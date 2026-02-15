import 'package:flutter/material.dart';
import 'reporter_capture.dart';
import 'ai_list.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool askPassword = false;
  String error = '';

  void next() {
    if (!askPassword) {
      if (username.text.trim() == 'supra') {
        setState(() {
          askPassword = true;
          error = '';
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => ReporterCapture()),
        );
      }
    } else {
      if (password.text == '1234') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AIList()),
        );
      } else {
        setState(() {
          error = 'Wrong password';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (askPassword)
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        askPassword = false;
                        password.clear();
                        error = '';
                      });
                    },
                  ),
                ),

              const Text(
                'Campus Issue Portal',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              TextField(
                controller: username,
                enabled: !askPassword,
                decoration: const InputDecoration(labelText: 'Username'),
              ),

              if (askPassword) ...[
                const SizedBox(height: 20),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
              ],

              if (error.isNotEmpty) ...[
                const SizedBox(height: 15),
                Text(error, style: const TextStyle(color: Colors.red)),
              ],

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: next,
                child: Text(askPassword ? 'Login' : 'Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
