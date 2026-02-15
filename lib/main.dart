import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCfhfNkryXmOJ3tU0KjBefyz718xgbhBqI",
      authDomain: "campus-ai-prototype.firebaseapp.com",
      projectId: "campus-ai-prototype",
      storageBucket: "campus-ai-prototype.firebasestorage.app",
      messagingSenderId: "347958772770",
      appId: "1:347958772770:web:387cd720789d842672767b",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
