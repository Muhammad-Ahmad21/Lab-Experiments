import 'package:flutter/material.dart';
import 'package:mendly_1/screens/splash_screen.dart';
import 'package:mendly_1/utils/app_theme.dart';

void main() {
  runApp(const MendlyApp());
}

class MendlyApp extends StatelessWidget {
  const MendlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mendly',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
