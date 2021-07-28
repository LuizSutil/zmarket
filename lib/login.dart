import 'package:Zmarket/streamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage('assets/purple.png'),
            height: 95,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
              child: Text('Suas Compras de um jeito fácil',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 25,
                      fontFamily: 'Teko'))),
          Container(
              height: 50,
              width: 350,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    primary: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).accentColor),
                onPressed: () {},
                child: Text(
                  'Inscrever-se',
                  style: TextStyle(fontSize: 23),
                ),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                  height: 50,
                  width: 350,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Theme.of(context).accentColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        primary: Theme.of(context).accentColor,
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.grey,
                            size: 25,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Entrar com numero de telefone',
                                style: TextStyle(fontSize: 16),
                              ))
                        ]),
                  ))),
          GoogleButton()
        ])));
  }
}

class GoogleButton extends StatefulWidget {
  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  TextEditingController controller = new TextEditingController();

  Widget googleLoginButton() {
    return Container(
      height: 50,
      width: 350,
      child: OutlinedButton(
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.googleLogin();

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => StreamerPage()),
            (Route<dynamic> route) => false,
          );
        },
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Theme.of(context).accentColor),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            primary: Theme.of(context).accentColor,
            backgroundColor: Theme.of(context).primaryColor),
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
