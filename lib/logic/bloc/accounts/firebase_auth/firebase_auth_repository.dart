import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FirebaseAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Stream to observe user authentication state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Method to sign in with email and password
  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      // You can handle Firebase specific errors here
      rethrow;
    }
  }

  // Method to sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Method to get current authenticated user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Store token securely (optional as Firebase manages tokens internally)
  Future<void> storeToken() async {
    if (_firebaseAuth.currentUser != null) {
      String? token = await _firebaseAuth.currentUser!.getIdToken();
      await _secureStorage.write(key: 'authToken', value: token);
    }
  }

  // Retrieve token from secure storage
  Future<String?> getToken() async {
    return _secureStorage.read(key: 'authToken');
  }
}
