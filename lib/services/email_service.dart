import 'dart:convert';

import 'package:http/http.dart' as http;

class EmailConfig {
  static const String serviceId = String.fromEnvironment(
    'ServiceId',
    defaultValue: '',
  );
  static const String templateId = String.fromEnvironment(
    'TemplateId',
    defaultValue: '',
  );
  static const String publicKey = String.fromEnvironment(
    'PublicKey',
    defaultValue: '',
  );
  static const String emailJsUrl =
      'https://api.emailjs.com/api/v1.0/email/send';

  /// Debug method to help troubleshoot configuration issues
  static void printConfig() {
    print('=== EmailJS Configuration Debug ===');
    print('ServiceId: ${serviceId.isNotEmpty ? "✓ Set (${serviceId.length} chars)" : "✗ Missing/Empty"}');
    print('TemplateId: ${templateId.isNotEmpty ? "✓ Set (${templateId.length} chars)" : "✗ Missing/Empty"}');
    print('PublicKey: ${publicKey.isNotEmpty ? "✓ Set (${publicKey.length} chars)" : "✗ Missing/Empty"}');
    print('EmailJS URL: $emailJsUrl');
    print('================================');
  }

  /// Get detailed configuration status
  static String getConfigStatus() {
    final missingConfigs = <String>[];

    if (serviceId.isEmpty) missingConfigs.add('ServiceId');
    if (templateId.isEmpty) missingConfigs.add('TemplateId');
    if (publicKey.isEmpty) missingConfigs.add('PublicKey');

    if (missingConfigs.isEmpty) {
      return 'All configuration values are set ✓';
    } else {
      return 'Missing configuration: ${missingConfigs.join(', ')}';
    }
  }
}

class EmailRequest {
  final String name;
  final String email;
  final String message;

  const EmailRequest({
    required this.name,
    required this.email,
    required this.message,
  });

  Map<String, dynamic> toEmailJsPayload() {
    return {
      'service_id': EmailConfig.serviceId,
      'template_id': EmailConfig.templateId,
      'user_id': EmailConfig.publicKey,
      'template_params': {
        'name': name,
        'email': email,
        'message': message,
        'time': DateTime.now().toString().substring(0, 16),
      },
    };
  }

  // Validation
  bool get isValid => name.isNotEmpty && email.isNotEmpty && message.isNotEmpty;

  String? get validationError {
    if (name.isEmpty) return 'Name is required';
    if (email.isEmpty) return 'Email is required';
    if (!_isValidEmail(email)) return 'Please enter a valid email address';
    if (message.isEmpty) return 'Message is required';
    return null;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

class EmailResponse {
  final bool success;
  final String? message;
  final int? statusCode;

  const EmailResponse({required this.success, this.message, this.statusCode});

  factory EmailResponse.success() {
    return const EmailResponse(
      success: true,
      message: 'Email sent successfully',
    );
  }

  factory EmailResponse.failure({String? message, int? statusCode}) {
    return EmailResponse(
      success: false,
      message: message ?? 'Failed to send email',
      statusCode: statusCode,
    );
  }
}

class EmailService {
  static const Duration _timeout = Duration(seconds: 30);

  /// Send email using EmailJS service
  static Future<EmailResponse> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      final request = EmailRequest(
        name: name.trim(),
        email: email.trim(),
        message: message.trim(),
      );

      // Validate request
      if (!request.isValid) {
        return EmailResponse.failure(message: request.validationError);
      }

      // Check if configuration is available
      if (!_isConfigurationValid()) {
        // Print debug info in development
        EmailConfig.printConfig();
        return EmailResponse.failure(
          message: 'Email service not configured properly. ${EmailConfig.getConfigStatus()}',
        );
      }

      final response = await http
          .post(
        Uri.parse(EmailConfig.emailJsUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(request.toEmailJsPayload()),
      )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        return EmailResponse.success();
      } else {
        return EmailResponse.failure(
          message: 'Server error: ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return EmailResponse.failure(message: _getErrorMessage(e));
    }
  }

  /// Check if EmailJS configuration is valid with improved debugging
  static bool _isConfigurationValid() {
    final isValid = EmailConfig.serviceId.isNotEmpty &&
        EmailConfig.templateId.isNotEmpty &&
        EmailConfig.publicKey.isNotEmpty;

    // In debug mode or development, print config status
    if (!isValid) {
      print('EmailJS Configuration Invalid:');
      print(EmailConfig.getConfigStatus());
    }

    return isValid;
  }

  /// Get user-friendly error message
  static String _getErrorMessage(dynamic error) {
    if (error.toString().contains('TimeoutException')) {
      return 'Request timed out. Please check your internet connection.';
    } else if (error.toString().contains('SocketException')) {
      return 'Network error. Please check your internet connection.';
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }

  /// Test email service configuration - now with detailed feedback
  static Future<bool> testConfiguration() async {
    print('Testing EmailJS Configuration...');
    EmailConfig.printConfig();
    return _isConfigurationValid();
  }

  /// New method: Get configuration status for UI
  static String getConfigurationStatus() {
    return EmailConfig.getConfigStatus();
  }
}