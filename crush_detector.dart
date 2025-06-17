import 'package:flutter/material.dart';
import 'dart:math';

class CrushDetector extends StatelessWidget {
  const CrushDetector({super.key});

  @override
  Widget build(BuildContext context) {
    final crushChance = Random().nextInt(100) + 1;
    String result;

    if (crushChance > 75) {
      result = "Your crush definitely likes you back! 💖";
    } else if (crushChance > 40) {
      result = "Hmm, there's a good chance they might! 😊";
    } else {
      result = "Keep trying, or maybe it's time to move on 😅";
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Crush Detector")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite, color: Colors.red, size: 100),
              const SizedBox(height: 20),
              Text("Chance: $crushChance%", style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text(result, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}