import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'admin_panel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final user = _usernameController.text.trim();
    final pass = _passwordController.text;

    if (user.isNotEmpty && pass.isNotEmpty) {
      if (pass == '000000') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminPanel()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(username: user)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Flirtify ❤️', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(controller: _usernameController, decoration: const InputDecoration(labelText: 'Username')),
            TextField(controller: _passwordController, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}