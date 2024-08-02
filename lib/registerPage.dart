import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/myButton.dart';
import 'package:chat_app/components/myTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatelessWidget {
  final Function()? onTap;

  Registerpage({super.key, required this.onTap});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  register(BuildContext context) {
    final _authservice = AuthService();

    // ---> password match create user
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _authservice.registerUser(
            _emailController.text, _passwordController.text);
      } on FirebaseAuthException catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(e.toString()),
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password not match"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 50,
            ),
            // welcome back message

            Text(
              "Let\'s create an account for you ",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),

            //  email textfield
            Mytextfield(
                controller: _emailController, text: "Email", obscure: false),
            SizedBox(
              height: 10,
            ),
            // pw textfield
            Mytextfield(
                controller: _passwordController,
                text: "Password",
                obscure: true),
            SizedBox(
              height: 10,
            ),

            Mytextfield(
                controller: _confirmPasswordController,
                text: "Confirm Password",
                obscure: true),
            SizedBox(
              height: 25,
            ),

            // login button

            MyButton(text: "Register", onTap: () => register),
            SizedBox(
              height: 25,
            ),
            // register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have a account?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
