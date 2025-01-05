import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/chat_bubble.dart';
import 'package:myapp/components/my_textfield.dart';
import 'package:myapp/services/auth/auth_service.dart';
import 'package:myapp/services/chat/chat_services.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;

  // ChatPage({super.key, required this.receiverEmail});
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // text controller
  final TextEditingController _messageController = TextEditingController();

  // chat & auth service
  final ChatServices _chatServices = ChatServices();
  final AuthService authService = AuthService();

  // for textfield focus
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // add listener to focus mode
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        // cuase a delay so that keyborad has a time to show up
        // then the amount of remaining space will be calculated
        // then scroll down
        Future.delayed(const Duration(milliseconds: 500), () => scrollDown());
      }
    });

    // wait a bit for listview to be built, then scroll down to the buttom
    Future.delayed(
      const Duration(milliseconds: 500),
      () => scrollDown(),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // scroll controller
  final ScrollController _scrollController = ScrollController();
  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  // send a message
  void sendMessage() async {
    // if there is something include the text field
    if (_messageController.text.isNotEmpty) {
      // send the message
      await _chatServices.sendMessage(
          widget.receiverID, _messageController.text);

      // clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail,
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Display all messages
          Expanded(child: _buildMessageList()),

          //user Input
          _buildUserInput()
        ],
      ),
    );
  }

  // build Message list
  Widget _buildMessageList() {
    String senderID = authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatServices.getMessages(widget.receiverID, senderID),
      builder: (context, snapshot) {
        // errors
        if (snapshot.hasError) {
          return const Text("Error");
        }
        // loading....
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        //return list view
        return ListView(
          controller: _scrollController,
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  // build Message Item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser = data['senderID'] == authService.getCurrentUser()!.uid;

    // align message to right if sender is current user otherwise left
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data["message"], isCurrentUser: isCurrentUser)
          ],
        ));
  }

  // build message Input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Row(
        children: [
          // textfiled should makeup most of the spaces
          Expanded(
              child: MyTextfield(
            hintText: "Type a message",
            obscureText: false,
            controller: _messageController,
            focusNode: myFocusNode,
          )),

          // send button
          Container(
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(Icons.send, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
