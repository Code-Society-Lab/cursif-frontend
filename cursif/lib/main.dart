import 'package:cursif/pages/auth/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: const Color(0xFFD7263D), fontFamily: "Lato"),
        home: const LoginScreen());
  }
}
