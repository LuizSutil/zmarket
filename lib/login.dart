import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(35, 8, 56, 1),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 250, 0, 200),
                child: Image(
                  image: AssetImage('assets/ztelluz_logo.png'),
                  height: 95,
                )),
            GoogleButton()
          ],
        ));
  }
}

class GoogleButton extends StatefulWidget {
  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  TextEditingController controller = new TextEditingController();

  Widget googleLoginButton() {
    return OutlinedButton(
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.googleLogin();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/google_logo.png'),
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Sign in with Google',
                        style: TextStyle(color: Colors.black, fontSize: 20)))
              ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: googleLoginButton());
  }
}
