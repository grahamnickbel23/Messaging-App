import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/models/message.dart';

class ChatServices {
  // get instances of firestore & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user stream
  /*
  List<Map<String,dynamic> =
  [
    {
      'email':test@gmail.com,
      'id':
    }
    {
      'email':balchal_chelepile@gmail.com,
      'id':
    }
  ]
  */

  // Get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection('User').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // Extract data for each user
        final user = doc.data();
        return {
          'uid': user['uid'] ?? 'Unknown UID', // Handle missing or null data
          'email': user['email'],
          'userName': user['userName'] ?? 'Unknown User'
        }; // Return the user as a Map<String, dynamic>
      }).where((user) => user['userName'] != 'Unknown User').toList(); 
       // Filter out users without valid usernames
      // Convert to a list of maps
    });
  }
  //get user stream

  // send message
  Future<void> sendMessage(String receiverID, message) async {
    // get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create a new message
    Message newMessage = Message(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp);
    // construct chatroom id for two user (sorted to ensure uniqueness)
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); // sort this ids to make sure chat room is same for any two people
    String chatroomID = ids.join('_');

    // add message to new database
    await _firestore
        .collection('Chatrooms')
        .doc(chatroomID)
        .collection('Messages')
        .add(newMessage.toMap());
  }

  // get messages
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    // construct a chatroom id for the two uer
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection('Chatrooms')
        .doc(chatRoomID)
        .collection('Messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
