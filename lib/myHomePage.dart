import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_1/listinhaModel.dart';
import 'appbar.dart';
import 'ListDisplayer.dart';
import 'categorias.dart';

class MyHomePage extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var posts = {
    'lista1': {
      'nome': 'Lista Semanal',
      'cart': ['Coquinha', 'Pizza da Sadia', 'Puta merda deu certo']
    },
    'lista2': {
      'nome': 'Festa',
      'cart': ['"Sal"', 'Coquinha', 'Gudang(importado)']
    },
    'lista': {
      'nome': 'Picnic',
      'cart': ['Vinho', 'Queijo', 'Baguette']
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 8, 56, 1),
      body: CustomScrollView(slivers: [
        Zappbar(),
        ListDisplay(getAllListinhas(posts)),
        SliverList(
            delegate: SliverChildListDelegate([
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: MaterialButton(
                  onPressed: () {},
                  color: Color.fromRGBO(31, 192, 5, 1),
                  textColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    size: 50,
                  ),
                  shape: CircleBorder(),
                ),
              ))
        ])),
        SliverList(
            delegate: SliverChildListDelegate([
          Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          ),
        ])),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: Categorias(),
        ),
      ]),
    );
  }
}
