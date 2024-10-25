import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class AuthRepository {
  AuthRepository();

  final String _logTag = 'AuthRepository';
  final authUidKey = 'authUid';
  final _storage = const FlutterSecureStorage();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      await _storage.delete(key: authUidKey);
      log.d('User logged out and UID removed from storage');
    } catch (e) {
      log.e('Error during logout: $e');
    }
  }

  Future<String?> getAuthUid() async {
    final authUid = await _storage.read(key: authUidKey);
    log.d('Returning the authUid: $authUid');
    return authUid;
  }

  Future<void> setAuthUid(String uid) async {
    await _storage.write(key: authUidKey, value: uid);
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      await setAuthUid(userCredential.user!.uid);
      return userCredential.user;
    } catch (e) {
      log.e('Error during sign in: $e');
      rethrow;
    }
  }

  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      await setAuthUid(userCredential.user!.uid);

      // Save user data to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email.trim(),
        'createdAt': FieldValue.serverTimestamp(),
        // Add other user fields as needed
      });

      return userCredential.user;
    } catch (e) {
      log.e('Error during registration: $e');
      rethrow;
    }
  }

  Future<User?> getCurrentUser() async {
    final uid = await getAuthUid();
    if (uid != null) {
      return _firebaseAuth.currentUser;
    }
    return null;
  }

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return doc.data();
      }
      return null;
    } catch (e) {
      log.e('Error fetching user data: $e');
      return null;
    }
  }
}
