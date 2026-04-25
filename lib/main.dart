import 'package:event_finder_app/screens/home_screen.dart';
import 'package:event_finder_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Finder',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      home: HomeScreen(),
    );
  }
}

