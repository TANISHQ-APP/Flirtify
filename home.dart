import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'crush_detector.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username!'),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CrushDetector()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Chat with your AI Girlfriend 💬"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen(username: username)),
            );
          },
        ),
      ),
    );
  }
}