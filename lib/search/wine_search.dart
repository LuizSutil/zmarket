import 'package:Zmarket/app_bar.dart';
import 'package:Zmarket/database.dart';
import 'package:Zmarket/functionalities/filter_drop_down.dart';
import 'package:Zmarket/produtos/produto_class.dart';
import 'package:Zmarket/produtos/produtos_grid.dart';
import 'package:flutter/material.dart';

class WineSelect extends StatefulWidget {
  final List<ProdutoModel> models;
  final String initFilter;
  WineSelect({required this.models, required this.initFilter});
  @override
  _WineSelectState createState() => _WineSelectState();
}

class _WineSelectState extends State<WineSelect> {
  String _paisController = "All";
  String _classeController = "All";
  String _grapeController = "All";
  String _regionController = "All";
  String _corController = "All";

  List<ProdutoModel> x(data) {
    var pais = _paisController;
    var classe = _classeController;
    var grape = _grapeController;
    var region = _regionController;
    var cor = _corController;

    List<ProdutoModel> filtrado = data;

    if (_paisController != "All") {
      List<ProdutoModel> _modelsPaises = filtrado
          .where((element) => element.filters['country'] == _paisController)
          .toList();
      filtrado = _modelsPaises;
    }

    if (_classeController != "All") {
      List<ProdutoModel> _modelsPaises = filtrado
          .where((element) => element.filters['class'] == _classeController)
          .toList();
      filtrado = _modelsPaises;
    }

    if (_grapeController != "All") {
      List<ProdutoModel> _modelsPaises = filtrado
          .where((element) => element.filters['grape'] == _grapeController)
          .toList();
      filtrado = _modelsPaises;
    }
    if (_corController != "All") {
      List<ProdutoModel> _modelsPaises = filtrado
          .where((element) => element.filters['tipo'] == _corController)
          .toList();
      filtrado = _modelsPaises;
    }
    if (_regionController != "All") {
      List<ProdutoModel> _modelsPaises = filtrado
          .where((element) => element.filters['region'] == _regionController)
          .toList();
      filtrado = _modelsPaises;
    }

    return filtrado;
  }

  @override
  Widget build(BuildContext context) {
    // List<ProdutoModel> filteredModels = _paisController == "All"
    //    ? widget.models
    //    : widget.models
    //        .where((element) => element.filters['country'] == _paisController)
    //        .toList();
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: StreamBuilder(
            stream: getAllProdutos('produtos/bebidas/vinhos/').asStream(),
            builder: (context, snapshot) {
              var xx = snapshot.data;
              if (snapshot.connectionState == ConnectionState.done) {
                return CustomScrollView(slivers: [
                  SliverAppBar(
                    title: Text("Vinhos",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30.0,
                        )),
                    backgroundColor: Theme.of(context).accentColor,
                    expandedHeight: 80.0,
                    floating: false,
                    pinned: true,
                  ),
                  SliverToBoxAdapter(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        Filter(
                            filterValue: _paisController,
                            filterText: "Pais",
                            filterItems: [
                              'All',
                              'Argentina',
                              'Chile',
                              'Itália',
                              'França',
                              'Portugal'
                            ],
                            fun: (newvalue) {
                              setState(() {
                                _paisController = newvalue;
                              });
                            }),
                        Filter(
                            filterValue: _classeController,
                            filterText: "Classe",
                            filterItems: ['All', 'Seco', 'Meio Seco'],
                            fun: (newvalue) {
                              setState(() {
                                _classeController = newvalue;
                              });
                            }),
                        Filter(
                            filterValue: _grapeController,
                            filterText: "Uva",
                            filterItems: [
                              'All',
                              'Merlot',
                              'Cabernet Sauvignon',
                              'Sangiovese',
                              'Aragonês'
                            ],
                            fun: (newvalue) {
                              setState(() {
                                _grapeController = newvalue;
                              });
                            }),
                      ])),
                  SliverToBoxAdapter(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        Filter(
                            filterValue: _regionController,
                            filterText: "Região",
                            filterItems: [
                              'All',
                              'Vale Central',
                              'Mendoza',
                              'Toscana',
                              'Pessac Léognan',
                              'Alentejo'
                            ],
                            fun: (newvalue) {
                              setState(() {
                                _regionController = newvalue;
                              });
                            }),
                        Filter(
                            filterValue: _corController,
                            filterText: "Tipo",
                            filterItems: ['All', 'Tinto', 'Branco', 'Rose'],
                            fun: (newvalue) {
                              setState(() {
                                _corController = newvalue;
                              });
                            }),
                      ])),
                  SliverPadding(
                    sliver: ProdutosGrid(produtomodels: x(xx)),
                    padding: EdgeInsets.only(top: 40),
                  )
                ]);
              } else {
                return CustomScrollView(slivers: [
                  SliverAppBar(
                    title: Text("Vinhos",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30.0,
                        )),
                    backgroundColor: Theme.of(context).accentColor,
                    expandedHeight: 80.0,
                    floating: false,
                    pinned: true,
                  ),
                  SliverToBoxAdapter(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        Filter(
                            filterValue: _paisController,
                            filterText: "Pais",
                            filterItems: [
                              'All',
                              'Argentina',
                              'Chile',
                              'Itália',
                              'França',
                              'Portugal'
                            ],
                            fun: (newvalue) {
                              setState(() {
                                _paisController = newvalue;
                              });
                            }),
                        Filter(
                            filterValue: _classeController,
                            filterText: "Classe",
                            filterItems: ['All', 'Seco', 'Meio Seco'],
                            fun: (newvalue) {
                              setState(() {
                                _classeController = newvalue;
                              });
                            }),
                        Filter(
                            filterValue: _grapeController,
                            filterText: "Uva",
                            filterItems: [
                              'All',
                              'Merlot',
                              'Cabernet Sauvignon',
                              'Sangiovese',
                              'Aragonês'
                            ],
                            fun: (newvalue) {
                              setState(() {
                                _grapeController = newvalue;
                              });
                            }),
                      ])),
                  SliverToBoxAdapter(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        Filter(
                            filterValue: _regionController,
                            filterText: "Região",
                            filterItems: [
                              'All',
                              'Vale Central',
                              'Mendoza',
                              'Toscana',
                              'Pessac Léognan',
                              'Alentejo'
                            ],
                            fun: (newvalue) {
                              setState(() {
                                _regionController = newvalue;
                              });
                            }),
                        Filter(
                            filterValue: _corController,
                            filterText: "Tipo",
                            filterItems: ['All', 'Tinto', 'Branco', 'Rose'],
                            fun: (newvalue) {
                              setState(() {
                                _corController = newvalue;
                              });
                            }),
                      ])),
                  SliverToBoxAdapter(
                      child: Center(
                          child: Padding(
                    child: CircularProgressIndicator(),
                    padding: EdgeInsets.only(top: 150),
                  )))
                ]);
              }
            }));
  }
}
