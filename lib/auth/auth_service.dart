import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  // Instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      // Attempt to sign in the user
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up

  // sign out

  // Error
  
}
