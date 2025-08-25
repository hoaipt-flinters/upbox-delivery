import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future signInGoogle() async {
    final googleSignIn = GoogleSignIn.instance;
    final googleUser = await googleSignIn.authenticate();
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credentials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
  final auth = FirebaseAuth.instance;
  await auth.signInWithCredential(credentials);
    notifyListeners();
  }
}
