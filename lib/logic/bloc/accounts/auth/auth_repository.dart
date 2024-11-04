// lib/blocs/authentication/auth_repository.dart

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // Sign Up with Email & Password
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // Login with Email & Password
  Future<UserCredential> logIn({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // Logout
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  // Stream of Authentication State
  Stream<User?> get user => _firebaseAuth.authStateChanges();

  // Public Getter for Current User
  User? get currentUser => _firebaseAuth.currentUser;
}
