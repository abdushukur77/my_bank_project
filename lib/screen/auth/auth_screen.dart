import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                TextField(
                  controller: passwordController,
                ),
                TextField(
                  controller: usernameController,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
