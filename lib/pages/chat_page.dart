import 'package:flutter/material.dart';
import 'package:myapp/services/auth/auth_service.dart';
import 'package:myapp/services/chat/chat_services.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  // final String receiverID;

  ChatPage({super.key, required this.receiverEmail});
  // ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  // // text controller
  // final TextEditingController _messageController = TextEditingController();

  // // chat & auth service
  // final ChatServices _chatServices = ChatServices();
  // final AuthService authService = AuthService();

  // // send a message
  // void sendMessage() async {
  //   // if there is something include the text field
  //   if (_messageController.text.isNotEmpty) {
  //     // send the message
  //     await _chatServices.sendMessage(receiverID, _messageController.text);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail,
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
