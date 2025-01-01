import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Home Page', 
          style: TextStyle(
            color:Theme.of(context).colorScheme.tertiary
          )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Page',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
              )
            )
          ],
        ),
      ),
    );
  }
}
