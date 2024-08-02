import 'package:chat_app/auth/loginOrRegister.dart';
import 'package:chat_app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in

            if (snapshot.hasData) {
              return HomeScreen();
            } else {

              // user is not logged in 
              return LoginOrRegister();
            }
          }),
    );
  }
}
