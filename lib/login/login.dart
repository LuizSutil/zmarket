import 'package:Zmarket/widgets/google_btn.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage('assets/purple.png'),
            color: Theme.of(context).colorScheme.secondary,
            height: 95,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
              child: Text('Um app sobre você, e suas compras',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 25,
                      fontFamily: 'Teko'))),
          Container(
              height: 50,
              width: 350,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    primary: Theme.of(context).colorScheme.primary,
                    backgroundColor: Theme.of(context).colorScheme.secondary),
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
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.secondary),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        primary: Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.primary),
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
