import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  User? get currentUser {
    return FirebaseAuth.instance.currentUser;
  }

  Stream<User?> get authStateChanges => FirebaseAuth.instance.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUser({
    required String email,
    required String password,
  }) async {
    final auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
  final auth = FirebaseAuth.instance;
  await auth.signOut();
  }

  // firebase functions
}
