import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'constants/app_styles.dart';
import 'screens/portfolio_page/portfolio_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: AppTheme.darkTheme,
      home: const PortfolioHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
