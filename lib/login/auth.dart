import 'package:Zmarket/deprecated/database.dart';
import 'package:Zmarket/login/login.dart';
import 'package:Zmarket/login/streamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      _user = googleUser;

      final googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final _x = await FirebaseAuth.instance.signInWithCredential(credential);
      if (_x.additionalUserInfo!.isNewUser) {
        createDbAccount(_x.user!.uid.toString());
      }
      ;
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future logout(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.disconnect();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StreamerPage()));
    } catch (e) {
      print(e.toString());
    }
  }
}
