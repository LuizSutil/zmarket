import 'package:Zmarket/models/listinha_model.dart';
import 'package:Zmarket/models/produtos_model.dart';
import 'package:Zmarket/pages/product_page.dart';
import 'package:Zmarket/tabs.dart';
import 'package:Zmarket/utilities/db_json.dart';
import 'package:Zmarket/widgets/lista_button.dart';
import 'package:Zmarket/widgets/z_app_bar.dart';
import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  final List<ProdutoModel> subcatProdutos;
  final String category;
  //
  Produtos({required this.subcatProdutos, required this.category});
  @override
  _ProdutosState createState() => _ProdutosState();
}

//categories[widget.subcategory]![i]

class _ProdutosState extends State<Produtos> {
  Future _showAddToLista(ProdutoModel produto) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              insetPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              title: Text.rich(TextSpan(text: 'Adicionar', children: <TextSpan>[
                TextSpan(
                    text: " " + produto.name + " ",
                    style: TextStyle(color: Colors.purple[600])),
                TextSpan(text: 'a qual lista?')
              ])),
              children: <Widget>[
                ListaAddBtn(
                    listaNames: getAllListinhaNames(listas),
                    fun: (lista) {
                      bool _exists = false;
                      int _amount = 0;
                      int _index = 0;
                      String _subcat = "";

                      for (var map in listas['$lista']!['cart']) {
                        if (map.containsKey("item")) {
                          if (map['item'] == produto.name) {
                            _exists = true;
                            _amount = map['amount'];
                            _subcat = map['subcat'];
                            _index = listas['$lista']!['cart'].indexOf(map);
                          }
                        }
                      }

                      //print(listas['$lista']!['cart'][_index]);
                      if (_exists) {
                        listas['$lista']!['cart'].removeAt(_index);

                        listas['$lista']!['cart'].insert(_index, {
                          'item': produto.name,
                          'amount': _amount + 1,
                          'subcat': _subcat
                        });
                        if (listas[lista]!['cart'][0]['item'] == 'Manekin') {
                          listas[lista]!['cart'].removeAt(0);
                        }
                      } else {
                        listas['$lista']!['cart'].add({
                          'item': produto.name,
                          'amount': 1,
                          'subcat': produto.subcategory
                        });
                        if (listas[lista]!['cart'][0]['item'] == 'Manekin') {
                          listas[lista]!['cart'].removeAt(0);
                        }
                        ;
                      }
                      print(listas['$lista']!['cart']);

                      setState(() {});
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Tabs()),
              (Route<dynamic> route) => false);
          return false;
        },
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: Stack(clipBehavior: Clip.none, children: [
              NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[Zappbar()];
                  }, //_children[_currentIndex]
                  body: CustomScrollView(slivers: [
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 30, 0, 10),
                      child: Row(
                        children: [
                          Text(
                            widget.category,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Image.asset(
                                'assets/svgs/filterIcon.png',
                                width: 25,
                                height: 25,
                              ))
                        ],
                      ),
                    )),
                    SliverPadding(
                        padding: EdgeInsets.all(10),
                        sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return Column(children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Produto(
                                                    individualProduto: widget
                                                        .subcatProdutos[index],
                                                  )));
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 3,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 0),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Container(
                                                          constraints:
                                                              BoxConstraints(
                                                                  minWidth: 80,
                                                                  maxWidth:
                                                                      120),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Text(
                                                            widget
                                                                .subcatProdutos[
                                                                    index]
                                                                .name,
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
                                                          ),
                                                        ),
                                                        Icon(Icons.more_horiz),
                                                      ])),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 0, bottom: 10),
                                                child: Image.asset(
                                                  widget.subcatProdutos[index]
                                                      .image,
                                                  width: 100,
                                                  height: 100,
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Text(
                                                      r'R$ ' +
                                                          widget
                                                              .subcatProdutos[
                                                                  index]
                                                              .price
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 18))),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Text(widget
                                                          .subcatProdutos[index]
                                                          .amount +
                                                      widget
                                                          .subcatProdutos[index]
                                                          .unit))
                                            ]))),
                                Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width: 50,
                                              child: ElevatedButton(
                                                  child: Image.asset(
                                                      'assets/svgs/plus-lista.png'),
                                                  onPressed: () {
                                                    _showAddToLista(widget
                                                        .subcatProdutos[index]);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              Color.fromRGBO(
                                                                  255,
                                                                  106,
                                                                  57,
                                                                  1)))),
                                          SizedBox(
                                              width: 110,
                                              child: ElevatedButton(
                                                  child: Image.asset(
                                                      'assets/svgs/plus-carrinho.png'),
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              Color.fromRGBO(
                                                                  255,
                                                                  106,
                                                                  57,
                                                                  1)))),
                                        ]))
                              ]);
                            }, childCount: widget.subcatProdutos.length),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 4,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.6)))
                  ]))
            ])));
  }
}
