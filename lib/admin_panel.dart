import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Welcome to Admin Panel\n(Password: 000000)\n\nHere you can later add analytics, block users, or customize chats!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}