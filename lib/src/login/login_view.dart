import 'package:flutter/material.dart';
import 'package:flutter_app_getx/src/configs/firebase_auth_constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Email"),
            controller: _emailController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Password"),
            controller: _passwordController,
            obscureText: true,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  authController.register(_emailController.text.trim(),
                      _passwordController.text.trim());
                },
                child: const Text("Sign Up"),
              ),
              ElevatedButton(
                onPressed: () async {
                  authController.login(_emailController.text.trim(),
                      _passwordController.text.trim());
                },
                child: const Text("Login"),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {
              authController.signInWithGoogle();
            },
            child: const Text("Sign In with Google"),
          ),
        ],
      ),
    );
  }
}
