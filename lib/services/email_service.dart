import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailService {
  static const String serviceId = String.fromEnvironment('ServiceId', defaultValue: '');
  static const String templateId = String.fromEnvironment('TemplateId', defaultValue: ''); // Fixed!
  static const String publicKey = String.fromEnvironment('PublicKey', defaultValue: '');   // Fixed!

  static Future<bool> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          'name': name,        // Matches {{name}} in template
          'email': email,      // Matches {{email}} in template
          'message': message,  // Matches {{message}} in template
          'time': DateTime.now().toString().substring(0, 16), // Matches {{time}}
        },
      }),
    );

    return response.statusCode == 200;
  }
}