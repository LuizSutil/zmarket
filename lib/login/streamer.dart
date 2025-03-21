import 'package:Zmarket/login/login.dart';
import 'package:Zmarket/tabs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'intro.dart';

class StreamerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Tabs(); // return home
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            } else {
              return Center(child: LoginPage());
            }
            // else {
            //   return IntroPage(); //return login page
            // }
          }));
}
