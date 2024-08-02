import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/myButton.dart';
import 'package:chat_app/components/myTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(BuildContext context) async {
    try {
      final authService = AuthService();
      return await authService.signIn(
          emailController.text, passwordController.text);
    }
    // catch any errors
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
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
              "Welcome back, you have been missed! ",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),

            //  email textfield
            Mytextfield(
                controller: emailController, text: "Email", obscure: false),
            SizedBox(
              height: 10,
            ),
            // pw textfield
            Mytextfield(
                controller: passwordController,
                text: "Password",
                obscure: true),
            SizedBox(
              height: 25,
            ),
            // login button

            MyButton(text: "Login", onTap: () => login(context)),
            SizedBox(
              height: 25,
            ),
            // register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
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
