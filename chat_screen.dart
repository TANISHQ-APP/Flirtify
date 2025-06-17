import 'package:flutter/material.dart';
import 'crush_detector.dart';
import 'dart:math';

class ChatScreen extends StatefulWidget {
  final String username;

  const ChatScreen({super.key, required this.username});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  final List<String> randomReplies = [
    "Hey cutie 😘",
    "Tell me your biggest secret 😉",
    "Have you ever had a crush on someone close?",
    "You're fun to talk to 😍",
    "What’s your type? Be honest!",
    "Would you go on a virtual date with me? 💖",
    "Aww I was thinking of you 🥺",
    "I feel like we’d vibe in real life 💫",
    "I love how you talk 🥰",
    "This convo is getting interesting 😏"
  ];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add({"user": _controller.text.trim()});
    });

    _controller.clear();

    Future.delayed(const Duration(milliseconds: 700), () {
      final reply = randomReplies[Random().nextInt(randomReplies.length)];
      setState(() {
        _messages.add({"bot": reply});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with GF - ${widget.username}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CrushDetector()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (_, i) {
                final msg = _messages[i];
                if (msg.containsKey("user")) {
                  return ListTile(
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.pink[100], borderRadius: BorderRadius.circular(10)),
                        child: Text(msg["user"]!, style: const TextStyle(color: Colors.black)),
                      ),
                    ),
                  );
                } else {
                  return ListTile(
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                        child: Text(msg["bot"]!, style: const TextStyle(color: Colors.black87)),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(controller: _controller, decoration: const InputDecoration(hintText: "Type a message...")),
                ),
                IconButton(icon: const Icon(Icons.send), onPressed: _sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}