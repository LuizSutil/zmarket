import 'package:flutter/material.dart';

import 'login.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/purple.png'),
              color: Theme.of(context).accentColor,
              height: 95,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 40),
                child: Text('Suas Compras de um jeito fácil',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 25,
                        fontFamily: 'Teko'))),
            Container(
                height: 50,
                width: 300,
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
            Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 70,
                height: 2,
                color: Theme.of(context).accentColor,
              ),
              Padding(
                child: Text(
                  'Ja tem uma conta?',
                  style: TextStyle(fontSize: 18),
                ),
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              ),
              Container(
                width: 70,
                height: 2,
                color: Theme.of(context).accentColor,
              ),
            ])),
            Container(
                height: 50,
                width: 300,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Theme.of(context).accentColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      primary: Theme.of(context).accentColor,
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ],
        )));
  }
}
