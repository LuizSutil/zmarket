import 'cat_box_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'addprod_listabtn.dart';
import 'listinha_model.dart';
import 'app_bar.dart';
import 'list_displayer.dart';
import 'categorias.dart';
import 'db_json.dart';

class MyHomePage extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var text = '';
  var kat = 'Categorias';
  var subKat = '';

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
                child: Icon(Icons.arrow_right),
                shape: CircleBorder(),
              ),
            )
          ],
        );
      },
    );
  }

  _addlistmap(list, item) {
    List x = list as List;
    x.add(item);
    return x;
  }

  Future _showAddToLista(produto) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              insetPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              title: Text.rich(TextSpan(text: 'Adicionar', children: <TextSpan>[
                TextSpan(
                    text: ' $produto ',
                    style: TextStyle(color: Colors.purple[600])),
                TextSpan(text: 'a qual lista?')
              ])),
              children: <Widget>[
                ListaAddBtn(
                    listaNames: getAllListinhaNames(posts),
                    fun: (lista) {
                      posts['$lista']!['cart'] =
                          _addlistmap(posts['$lista']!['cart'], produto);
                      setState(() {});
                      Navigator.pop(context);
                    })
              ]);
        });
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
          SliverToBoxAdapter(
            child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      subKat == '' ? kat = 'Categorias' : subKat = '';
                    });
                  },
                )),
          ),
          SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: Categorias(
                  func: (categoryName) {
                    setState(() {
                      kat == 'Categorias'
                          ? kat = categoryName.category
                          : subKat == ''
                              ? subKat = categoryName.category
                              : _showAddToLista(categoryName.category);
                    });
                  },
                  catboxes: kat == 'Categorias'
                      ? getAllCatBoxes(categorias)
                      : subKat == ''
                          ? getAllCatBoxes(categorias['$kat']['SubCategorias'])
                          : getAllCatBoxes(categorias['$kat']['SubCategorias']
                              ['$subKat']['Produtos']))),
        ]));
  }
}
