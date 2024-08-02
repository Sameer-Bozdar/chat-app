import 'package:chat_app/auth/auth_gate.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/auth/loginOrRegister.dart';
import 'package:chat_app/loginPage.dart';
import 'package:chat_app/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: AuthGate(),
    );
  }
}
