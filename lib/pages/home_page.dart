import 'package:flutter/material.dart';
import 'package:myapp/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    // get auth services
    final _auth = AuthService();
    
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home Page',
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary)),

        // logout buttot
        actions: [
          IconButton(
              onPressed: logout,
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Page',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary))
          ],
        ),
      ),
    );
  }
}
