import 'package:flutter/material.dart';
import 'screens/main_nav_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const PortionApp());
}

class PortionApp extends StatelessWidget {
  const PortionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portion',
      theme: AppTheme.lightTheme,
      home: const MainNavScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
