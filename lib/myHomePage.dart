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
  var text = '';

  var posts = {
    'lista1': {
      'nome': 'Lista Semanal',
      'cart': ['Coquinha', 'Pizza da Sadia', 'Puta merda deu certo']
    },
    'lista2': {
      'nome': 'Festa',
      'cart': ['"Sal"', 'Coquinha', 'Gudang(importado)']
    },
    'lista3': {
      'nome': 'Picnic',
      'cart': [
        'Vinho',
        'Queijo',
      ]
    }
  };

  Future _showCriarLista() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          insetPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          title: new Text('Criar Lista Nova'),
          children: <Widget>[
            Padding(
              child: TextField(
                onChanged: (texto) {
                  text = texto;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome da lista',
                    labelStyle: TextStyle(color: Color.fromRGBO(35, 8, 56, 1))),
              ),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {
                  if (text != '') {
                    setState(() {
                      posts['$text'] = {
                        'nome': '$text',
                        'cart': ['blabla', 'blablabla', 'balsdbfoa']
                      };
                      Navigator.pop(context);
                    });
                  }
                },
                color: Color.fromRGBO(31, 192, 5, 1),
                textColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward,
                  size: 20,
                ),
                shape: CircleBorder(),
              ),
            )
          ],
        );
      },
    );
  }

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
                  onPressed: () {
                    _showCriarLista();
                  },
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
