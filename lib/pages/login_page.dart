import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/components/my_textfield.dart';

class LoginPage extends StatelessWidget {

  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

   // tap to go to login page
  final Function()? onTap;

  LoginPage({super.key, required this.onTap});
  // login function
  void logIn(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),

            // Text
            Text(
              "Welcome back, You have missed !!",
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            //Email
            const SizedBox(height: 20),
            MyTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: emailController,
            ),

            // Password
            const SizedBox(height: 10),
            MyTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),

            // Login
            const SizedBox(height: 20),
            MyButton(
              onTap:logIn,
              heading: 'Log in'
            ),

            // Register or sign in
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Not a Member ?'
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap:onTap,
                  child: const Text(
                    'Register Now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
