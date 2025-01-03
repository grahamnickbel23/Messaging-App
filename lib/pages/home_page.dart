import 'package:flutter/material.dart';
import 'package:myapp/components/my_drawer.dart';
import 'package:myapp/components/user_tile.dart';
import 'package:myapp/pages/chat_page.dart';
import 'package:myapp/services/auth/auth_service.dart';
import 'package:myapp/services/chat/chat_services.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key}); // Added const

  // Chat and auth service
  final ChatServices _chatServices = ChatServices();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Home Page',
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  // Build a list of users except for the currently logged-in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatServices.getUsersStream(),
      builder: (context, snapshot) {
        // Error
        if (snapshot.hasError) {
          return const Text('Error occurred');
        }

        // Loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }

        // Check if snapshot has data
        if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
          return const Text('No users found');
        }

        // Return list view
        var userList = snapshot.data as List<Map<String, dynamic>>;
        return ListView(
          children: userList
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // Build individual list tile for user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    // Display all users except the current user
    return UserTile(
      text: userData["email"],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              receiverEmail: userData["email"],
            ),
          ),
        );
      },
    );
  }
}
