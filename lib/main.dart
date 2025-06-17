import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const FlirtifyApp());
}

class FlirtifyApp extends StatelessWidget {
  const FlirtifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flirtify',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}