import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> loginUser(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getMe() async {
    var user = _auth.currentUser;
    if (user != null) {
      return await _firestore.collection('users').doc(user.uid).get();
    }
    throw Exception('No authenticated user found');
  }

  Future<void> updateUser(Map<String, dynamic> userDetails) async {
    var user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update(userDetails);
    } else {
      throw Exception('No authenticated user found');
    }
  }
}
