import 'package:Zmarket/cat_box.dart';
import 'package:Zmarket/cat_box_model.dart';
import 'package:Zmarket/database.dart';
import 'package:Zmarket/lista_compras.dart';
import 'package:Zmarket/produtos/produto_class.dart';
import 'package:Zmarket/search/wine_search.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../addprod_listabtn.dart';

import '../listinha_model.dart';
import '../db_json.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _loading = false;
  var _filterSelect = "All";
  var _category = "All";
  var text = "";
  var _current = 0;
  final CarouselController _controller = CarouselController();
  List<ProdutoModel> _models = [];

  void x(String initfilter) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WineSelect(
                  models: _models,
                  initFilter: initfilter,
                )));
  }

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
                      print(posts.length);
                      _controller.animateToPage(posts.length - 1);

                      _current = posts.length;
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
                      FirebaseAnalytics().logEvent(
                          name: 'adicionou_para_lista',
                          parameters: {
                            'Lista': '$lista',
                            'Produto': '$produto'
                          });
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //bottomNavigationBar: TabBare(),
        backgroundColor: Theme.of(context).primaryColor,
        body: _loading
            ? Center(child: CircularProgressIndicator())
            : CustomScrollView(slivers: [
                //
                //main appbar
                //
                //Zappbar(),
                //
                //Carousel
                //
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                  //print(_current);
                                });
                              },
                              viewportFraction: 0.9,
                              enableInfiniteScroll: false,
                              height: 180),
                          items: getAllListinhas(posts).map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child:
                                        ListaCompras(i.nome, i.cart, posts, () {
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
                          onPressed: () async {
                            _showCriarLista();
                            //print(getAllProdutos());
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
                SliverToBoxAdapter(
                    child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      _category = "All";
                      _filterSelect = "All";
                    });
                  },
                )),
                SliverToBoxAdapter(
                    child: _category == "All"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: CatBox(
                                        fun: () {
                                          setState(() {
                                            _category = "Bebidas";
                                          });
                                        },
                                        catboxModel: CatBoxModel(
                                            category: 'Adega',
                                            icon: Icon(Icons.local_bar)))),
                              ])
                        : _filterSelect == "All"
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: CatBox(
                                          fun: () => {},
                                          catboxModel: CatBoxModel(
                                              category: 'Destilados',
                                              icon: Icon(Icons.local_bar)))),
                                  CatBox(
                                      fun: () => {},
                                      catboxModel: CatBoxModel(
                                          category: 'Cervejas',
                                          icon: Icon(Icons.sports_bar))),
                                  Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: CatBox(
                                          fun: () {
                                            setState(() {
                                              _filterSelect = "Vinhos";
                                            });
                                          },
                                          catboxModel: CatBoxModel(
                                              category: 'Vinhos',
                                              icon: Icon(Icons.wine_bar))))
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: CatBox(
                                          fun: () => {x('Argentina')},
                                          catboxModel: CatBoxModel(
                                              category: 'Vinhos Tinto',
                                              icon: Icon(Icons.wine_bar)))),
                                  CatBox(
                                      fun: () => {},
                                      catboxModel: CatBoxModel(
                                          category: 'Vinhos Rose',
                                          icon: Icon(Icons.wine_bar))),
                                  Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: CatBox(
                                          fun: () => {},
                                          catboxModel: CatBoxModel(
                                              category: 'Vinhos Brancos',
                                              icon: Icon(Icons.wine_bar))))
                                ],
                              ))
              ]));
  }
}

//FirebaseAnalytics().logEvent(name: 'entrou_em_categoria', parameters: {'categoria': '$categoryName'});