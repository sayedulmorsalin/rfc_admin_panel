import 'package:flutter/material.dart';
import 'package:rfc_admin_panel/theme/app_theme.dart';
import 'package:rfc_admin_panel/view/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: AppTheme.light,
      home: const Home(),
    );
  }
}
