import 'package:flutter/material.dart';
import 'package:hashini_portfolio/screens/portfolio_page.dart';


class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hashini Kodithuwakku - Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'SF Mono',
        scaffoldBackgroundColor: const Color(0xFF0A192F),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Calibre', fontWeight: FontWeight.w600, color: Color(0xFFCCD6F6)),
          displayMedium: TextStyle(fontFamily: 'Calibre', fontWeight: FontWeight.w600, color: Color(0xFFCCD6F6)),
          headlineLarge: TextStyle(fontFamily: 'Calibre', fontWeight: FontWeight.w600, color: Color(0xFFCCD6F6)),
          headlineMedium: TextStyle(fontFamily: 'Calibre', fontWeight: FontWeight.w500, color: Color(0xFFCCD6F6)),
          bodyLarge: TextStyle(fontFamily: 'Calibre', height: 1.6, color: Color(0xFF8892B0)),
          bodyMedium: TextStyle(fontFamily: 'Calibre', height: 1.6, color: Color(0xFF8892B0)),
        ),
      ),
      home: const PortfolioHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

