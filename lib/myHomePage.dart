import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'listinhaModel.dart';
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
    'Lista Semanal': {
      'nome': 'Lista Semanal',
      'cart': [
        'Yogurte',
        'Detergente',
        'Pão',
        'Tomate',
        'Banana',
        'Queijo',
        'Presunto'
      ]
    },
    'Festa': {
      'nome': 'Festa',
      'cart': [
        '"Sal"',
        'Coquinha',
        'Gudang(importado)',
        'Pizza da Sadia',
        'abluble',
        'zzz',
        'qweqwe',
        'doinsodf',
        'pppppp',
        'dkfoaskf'
      ]
    },
    'Picnic': {
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
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor)),
              ),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {
                  if (text != '') {
                    setState(() {
                      posts['$text'] = {'nome': '$text', 'cart': []};
                      Navigator.pop(context);
                    });
                  }
                },
                color: Theme.of(context).primaryColor,
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
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(slivers: [
        Zappbar(),
        ListDisplay(getAllListinhas(posts), posts, () => setState(() {})),
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
            color: Color.fromRGBO(204, 51, 153, 1),
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          ),
        ])),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: Categorias(),
        ),
      ]),
    );
  }
}
