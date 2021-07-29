import 'package:Zmarket/lista_compras.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'cat_box_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'addprod_listabtn.dart';
import 'listinha_model.dart';
import 'app_bar.dart';
import 'categorias.dart';
import 'db_json.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var text = '';
  var kat = 'Categorias';
  var subKat = '';
  var migue = '';
  var _current = 0;

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
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Theme.of(context).accentColor)),
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black)),
                    labelText: 'Nome da lista',
                    labelStyle:
                        TextStyle(color: Theme.of(context).accentColor)),
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
                      //_current = posts.keys.toList().length - 1;
                      FirebaseAnalytics().logEvent(
                          name: 'nova_lista_criada',
                          parameters: {'listName': '$text'});
                    });
                  }
                },
                color: Theme.of(context).accentColor,
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
          //
          //main appbar
          //
          Zappbar(),
          //
          //Carousel
          //
          SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                            print(_current);
                          });
                        },
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        height: 180),
                    items: getAllListinhas(posts).map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: ListaCompras(i.nome, i.cart, posts, () {
                                setState(() {});
                              }));
                        },
                      );
                    }).toList(),
                  ))),
          //
          // Carousel dots
          //
          SliverToBoxAdapter(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: posts.keys.map((list) {
                    int index = posts.keys.toList().indexOf(list);
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Colors.purple
                                  : Colors.black),
                        );
                      },
                    );
                  }).toList())),
          //
          // Add list button
          //
          SliverList(
              delegate: SliverChildListDelegate([
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: MaterialButton(
                    onPressed: () {
                      _showCriarLista();
                      print('Categoria: $kat');
                      print('migue: $migue');
                      print('subcategoria: $subKat');
                      print(sub['Bebidas']['Cervejas']['SubCategorias']);
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

          //
          //Divider
          //
          SliverToBoxAdapter(
              child: Divider(
            color: Theme.of(context).accentColor,
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          )),

          //
          // Promotions tab
          //
          SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        height: 130),
                    items: [
                      'Promoções',
                      'Produtos de limpeza 20% deconto',
                      'Lorem Ipsum'
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.red),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        splashColor:
                                            Theme.of(context).accentColor,
                                        onTap: () {},
                                        child: Container(
                                            child: Center(
                                                child: Text(
                                          i,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 30,
                                          ),
                                        )))),
                                  )));
                        },
                      );
                    }).toList(),
                  ))),

          //
          //// categories
          /////
          SliverToBoxAdapter(
            child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      kat != 'Categorias' && migue == ''
                          ? kat = 'Categorias'
                          : migue != '' && subKat == ''
                              ? migue = ''
                              : subKat = '';
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
                          ? kat = categoryName
                          : migue == ''
                              ? migue = categoryName
                              : subKat == ''
                                  ? subKat = categoryName
                                  : _showAddToLista(categoryName);
                    });
                  },
                  catboxes: kat == 'Categorias'
                      ? getAllCatBoxes(categorias)
                      : migue == ''
                          ? getAllCatBoxes(sub[kat])
                          : subKat == ''
                              ? getAllCatBoxes(sub[kat][migue]['SubCategorias'])
                              : getAllCatBoxes(sub[kat][migue]['SubCategorias']
                                  [subKat]['Produtos']))),
        ]));
  }
}
