import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final void Function(String username) onSignup;

  SignupPage({required this.onSignup});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signup() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    if (username.isNotEmpty && password.isNotEmpty) {
      widget.onSignup(username);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Up for Flirtify",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "Username"),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _signup,
                child: Text("Sign Up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}