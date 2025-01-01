import 'package:flutter/material.dart';
import 'package:myapp/components/my_drawer.dart';
import 'package:myapp/components/user_tile.dart';
import 'package:myapp/services/auth/auth_service.dart';
import 'package:myapp/services/chat/chat_services.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key}); // const deleted ere

  // chat and auth service
  final ChatServices chatServices = ChatServices();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home Page',
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
      ),
      drawer: MyDrawer(),
      // this body is for dummy perpous
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Page',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary))
          ],
        ),
      ),
      // body: _buildUserList(),
    );
  }

//   // build a list of user except for the current logged in user
//   Widget _buildUserList() {
//     return StreamBuilder(
//         stream: _chatService.getUserStream(),
//         builder: (context, snapshot) {
//           // error
//           if (snapshot.hasData) {
//             return Text('Error');
//           }

//           // loading....
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Text('Loading');
//           }

//           // return list view
//           return ListView(
//             children: [snapshot.data!.map<widget>((userData) => _buildUserListItem(userData)).toList()],
//           );
//         });

//         // build indivisual list tile for user
//         Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context){
//           // display all user except current user
//           return UserTile(Text: Text, onTap: onTap)
//         }
// }
}