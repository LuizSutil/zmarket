import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_1/auth.dart';
import 'Lista.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ztelluz Market '),
          actions: [
            IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Scaffold(
            backgroundColor: Color.fromRGBO(35, 8, 56, 1),
            body: Column(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
                child: ListaCompras(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                child: ListaCompras(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                child: aaa(),
              ),
            ])));
  }
}

class aaa extends StatefulWidget {
  const aaa({Key? key}) : super(key: key);

  @override
  _aaaState createState() => _aaaState();
}

class _aaaState extends State<aaa> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
            onTap: () {
              print('Card tapped.');
            },
            child: ListaCompras()),
      ),
    );
  }
}
