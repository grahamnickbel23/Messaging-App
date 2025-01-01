import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {

  // get instances of firestore
  final _firestore = FirebaseFirestore.instance;

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
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // Extract data for each user
        final user = doc.data();
        return user; // Return the user as a Map<String, dynamic>
      }).toList(); // Convert to a list of maps
    });
  }
  //get user stream

  // send message

  // get messages
  
}