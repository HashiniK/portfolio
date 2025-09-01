import 'package:flutter/material.dart';

import 'package:hashini_portfolio/constants/constants.dart';
import 'package:hashini_portfolio/constants/app_styles.dart';
import 'package:hashini_portfolio/screens/portfolio_page/portfolio_page.dart';

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
