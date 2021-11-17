import 'dart:html';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0 * 3),
        child: Center(
          child: SizedBox(
            width: 8.0 * 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0 * 2),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0 * 3),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0 * 2),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0 * 3),
                ElevatedButton(
                  // padding: const EdgeInsets.all(8.0 * 2.5),
                  onPressed: _logIn,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0 * 1.5),
                    child: Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logIn() {
    window.document.cookie =
        'session-id=${Uuid().v4()}; domain=.test-company.com; path=/; expires=Thu, 01 Jan 2022 00:00:01 GMT;';

    Navigator.pop(context);
  }
}
