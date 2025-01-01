import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // text controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // tap to go to register page
  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // login function
  void register() {}

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
              "Let's create an account for you !! ",
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            //username
            const SizedBox(height: 20),
            MyTextfield(
              hintText: 'username',
              obscureText: false,
              controller: usernameController,
            ),

            //Email
            const SizedBox(height: 10),
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

            // confirm Password
            const SizedBox(height: 10),
            MyTextfield(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: confirmPasswordController,
            ),

            // Register User
            const SizedBox(height: 20),
            MyButton(onTap: register, heading: 'Register'),

            // sign in or Register
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already a Member ?'),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    'LogIn Now',
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