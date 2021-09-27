import 'package:Zmarket/login/auth.dart';
import 'package:Zmarket/login/streamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleButton extends StatefulWidget {
  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  //TextEditingController controller = new TextEditingController();

  Widget googleLoginButton() {
    return Container(
      height: 50,
      width: 350,
      child: OutlinedButton(
        onPressed: () async {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          await provider.googleLogin();

          FirebaseAuth.instance.currentUser != null
              ? Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => StreamerPage()),
                  (Route<dynamic> route) => false,
                )
              : print(
                  'FirebaseAuth.instance.currentUser is: ${FirebaseAuth.instance.currentUser}');
        },
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            primary: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).colorScheme.primary),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage('assets/google_logo.png'),
            height: 25,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Continuar com Google',
                style: TextStyle(fontSize: 17),
              ))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: googleLoginButton());
  }
}
