import 'package:Zmarket/deprecated/database.dart';
import 'package:Zmarket/models/listinha_model.dart';
import 'package:Zmarket/models/produtos_model.dart';
import 'package:Zmarket/pages/home_page.dart';
import 'package:Zmarket/pages/notinha_page.dart';
import 'package:Zmarket/tabs.dart';
import 'package:Zmarket/utilities/db_json.dart';
import 'package:Zmarket/utilities/screensize_reducers.dart';
import 'package:Zmarket/widgets/z_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartPage extends StatefulWidget {
  final ListinhaModel cartLocal;
  CartPage({required this.cartLocal});
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    void addAmount(ItemModel itemModelzera) {
      // setState(() {
      //   itemModelzera.add(1);

      int _amount = 0;
      int _index = 0;
      String _subcat = "";
      for (var map in listas[widget.cartLocal.nome]!['cart']) {
        if (map.containsKey("item")) {
          if (map['item'] == itemModelzera.item) {
            _amount = map['amount'];
            _subcat = map['subcat'];
            _index = listas[widget.cartLocal.nome]!['cart'].indexOf(map);
          }
        }
      }
      setState(() {
        listas[widget.cartLocal.nome]!['cart'].removeAt(_index);
        listas[widget.cartLocal.nome]!['cart'].insert(_index, {
          'item': itemModelzera.item,
          'amount': _amount + 1,
          'subcat': _subcat
        });
      });
      // print(listas);
    }

    void removeAmount(ItemModel itemModelzera) {
      setState(() {
        int _amount = 0;
        int _index = 0;
        String _subcat = "";
        for (var map in listas[widget.cartLocal.nome]!['cart']) {
          if (map.containsKey("item")) {
            if (map['item'] == itemModelzera.item) {
              _amount = map['amount'];
              _subcat = map['subcat'];
              _index = listas[widget.cartLocal.nome]!['cart'].indexOf(map);
            }
          }
        }

        if (_amount > 1) {
          setState(() {
            listas[widget.cartLocal.nome]!['cart'].removeAt(_index);
            listas[widget.cartLocal.nome]!['cart'].insert(_index, {
              'item': itemModelzera.item,
              'amount': _amount - 1,
              'subcat': _subcat
            });
          });
        }
      });
    }

    double totalPrice() {
      double total = 0;

      //ProdutoModel _produto;
      for (var map in listas[widget.cartLocal.nome]!['cart']) {
        total = total +
            (map['amount'] * produtos[map['subcat']]![map['item']]['price']);
      }

      return total;
    }

    void deleteProduct(index) {
      if (listas['Rancho do Mês']['cart'].length > 1) {
        setState(() {
          widget.cartLocal.cart.removeAt(index);
          listas['Rancho do Mês']['cart'].removeAt(index);
        });
      } else {
        setState(() {
          listas[widget.cartLocal.nome]!['cart']
              .add({'item': 'Manekin', 'amount': 1, 'subcat': 'none'});
          widget.cartLocal.cart
              .add(ItemModel(item: 'Manekin', count: 1, subcat: 'none'));
          widget.cartLocal.cart.removeAt(index);
          listas['Rancho do Mês']['cart'].removeAt(index);
        });
      }
    }

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
                      padding: EdgeInsets.only(
                        top: screenHeight(context) * 0.03,
                        left: screenWidth(context) * 0.1,
                      ),
                      child: Text(
                        widget.cartLocal.nome,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )),
                    SliverToBoxAdapter(
                        child: Container(
                            height: screenHeight(context) * 0.5,
                            child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: Scrollbar(
                                    child: widget.cartLocal.cart[0].item ==
                                            "Manekin"
                                        ? Center(
                                            child: Text(
                                                'Adicione itens para ver eles aqui!'))
                                        : GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 4,
                                              crossAxisCount: 1,
                                            ),
                                            itemCount:
                                                widget.cartLocal.cart.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              ProdutoModel _produtoLocal =
                                                  createProduto(produtos[widget
                                                          .cartLocal
                                                          .cart[index]
                                                          .subcat]![
                                                      widget.cartLocal
                                                          .cart[index].item]);
                                              return Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      side: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Image.asset(
                                                        _produtoLocal.image,
                                                        width: screenWidth(
                                                                context) *
                                                            0.14,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          SizedBox(
                                                              width: screenWidth(
                                                                      context) *
                                                                  0.25,
                                                              child: Center(
                                                                  child: Text(
                                                                _produtoLocal
                                                                    .name,
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ))),
                                                          Text(_produtoLocal
                                                                  .amount +
                                                              " " +
                                                              _produtoLocal
                                                                  .unit)
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(r'R$ ' +
                                                              (listas[widget.cartLocal.nome]!['cart']
                                                                              [index]
                                                                          [
                                                                          'amount'] *
                                                                      produtos[
                                                                          widget
                                                                              .cartLocal.cart[index].subcat]![widget
                                                                          .cartLocal
                                                                          .cart[
                                                                              index]
                                                                          .item]['price'])
                                                                  .toStringAsFixed(2)),
                                                          Row(children: [
                                                            InkWell(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            10)),
                                                                onTap: () {
                                                                  removeAmount(widget
                                                                      .cartLocal
                                                                      .cart[index]);
                                                                },
                                                                child: Ink(
                                                                  decoration: BoxDecoration(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .secondary,
                                                                      borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(
                                                                              10),
                                                                          bottomLeft:
                                                                              Radius.circular(10))),
                                                                  width: screenWidth(
                                                                          context) *
                                                                      0.08,
                                                                  height: screenHeight(
                                                                          context) *
                                                                      0.041,
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    "-",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            25,
                                                                        color: Colors
                                                                            .white),
                                                                  )),
                                                                )),
                                                            Container(
                                                              width: 30,
                                                              height: 35,
                                                              child: Center(
                                                                  child: Text(
                                                                listas[widget.cartLocal.nome]!['cart']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'amount']
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .white),
                                                              )),
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary,
                                                            ),
                                                            InkWell(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10)),
                                                                onTap: () {
                                                                  addAmount(widget
                                                                      .cartLocal
                                                                      .cart[index]);
                                                                },
                                                                child: Ink(
                                                                  width: screenWidth(
                                                                          context) *
                                                                      0.08,
                                                                  height: screenHeight(
                                                                          context) *
                                                                      0.041,
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    "+",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .white),
                                                                  )),
                                                                  decoration: BoxDecoration(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .secondary,
                                                                      borderRadius: BorderRadius.only(
                                                                          topRight: Radius.circular(
                                                                              10),
                                                                          bottomRight:
                                                                              Radius.circular(10))),
                                                                )),
                                                          ])
                                                        ],
                                                      ),
                                                      IconButton(
                                                        splashRadius: 20,
                                                        icon: Icon(
                                                          Icons.delete,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            deleteProduct(
                                                                index);
                                                          });
                                                        },
                                                        color: Colors.red,
                                                      )
                                                    ],
                                                  ));
                                            }))))),
                    SliverToBoxAdapter(
                      child: Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    SliverPadding(
                        padding:
                            EdgeInsets.only(top: screenHeight(context) * 0.01),
                        sliver: SliverToBoxAdapter(
                            child: Container(
                                height: screenHeight(context) * 0.15,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Card(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: widget.cartLocal.cart[0].item ==
                                              "Manekin"
                                          ? []
                                          : [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20, top: 20),
                                                  child: Text(
                                                    'Resumo',
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25),
                                                  )),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'Valor',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary),
                                                      ),
                                                      Container(
                                                          width: screenWidth(
                                                                  context) *
                                                              0.35,
                                                          child: Divider(
                                                            thickness: 3,
                                                            height: 20,
                                                            indent: 2,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                          )),
                                                      Text(
                                                          r'R$ ' +
                                                              totalPrice()
                                                                  .toStringAsFixed(
                                                                      2),
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary))
                                                    ],
                                                  ))
                                            ],
                                    ),
                                  ),
                                )))),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () async {
                          if (widget.cartLocal.cart[0].item == 'Manekin') {
                            {}
                          } else {
                            sendPurchase(
                                'users/xtWPCnN7saNVwJhQ9JpHyCPRqHT2/Pedidos',
                                listas[widget.cartLocal.nome]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Notinha(price: totalPrice())));
                          }
                        },
                        child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(255, 106, 57, 1),
                            ),
                            height: screenHeight(context) * 0.07,
                            child: Center(
                              child: Text('Comprar lista',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                            )),
                      ),
                    ))
                  ]))
            ])));
  }
}
