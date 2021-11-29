import 'package:Zmarket/models/produtos_model.dart';
import 'package:Zmarket/utilities/screensize_reducers.dart';
import 'package:Zmarket/widgets/counter_item.dart';
import 'package:Zmarket/widgets/z_app_bar.dart';
import 'package:flutter/material.dart';

class Produto extends StatefulWidget {
  final ProdutoModel individualProduto;
  Produto({required this.individualProduto});
  @override
  _ProdutoState createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  var _quantity = 1;
  @override
  Widget build(BuildContext context) {
    var finalPrice =
        (_quantity * widget.individualProduto.price).toStringAsFixed(2);

    minusQuant() {
      setState(() {
        _quantity == 1 ? _quantity = 1 : _quantity--;
        print(_quantity);
      });
    }

    addQuant() {
      setState(() {
        _quantity++;
        print(_quantity);
      });
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Stack(clipBehavior: Clip.none, children: [
          NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[Zappbar()];
              },
              body: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 20, left: 15),
                        child: Text(
                          widget.individualProduto.category +
                              " > " +
                              widget.individualProduto.subcategory,
                          style: TextStyle(
                              fontSize: 17, fontStyle: FontStyle.italic),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 40),
                        child: Center(
                            child: Image.asset(
                          widget.individualProduto.image,
                          height: screenHeight(context) * 0.3,
                        ))),
                    Center(
                        child: Text(widget.individualProduto.name,
                            //  mostrar quantidade no nome do produto
                            // +
                            //     " x" +
                            //     _quantity.toString()
                            style: TextStyle(
                                fontSize: 23,
                                color:
                                    Theme.of(context).colorScheme.secondary))),
                    Center(
                        child: Text(
                            r"R$ " +
                                (widget.individualProduto.price * _quantity)
                                    .toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))),
                    Center(
                        child: Text(widget.individualProduto.amount +
                            " " +
                            widget.individualProduto.unit)),
                    Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ItemCounter(
                                add: addQuant,
                                minus: minusQuant,
                                quantity: _quantity),
                            SizedBox(
                                width: 50,
                                child: ElevatedButton(
                                    child: Image.asset(
                                        'assets/svgs/plus-lista.png'),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromRGBO(255, 106, 57, 1)))),
                            SizedBox(
                                width: 110,
                                child: ElevatedButton(
                                    child: Image.asset(
                                        'assets/svgs/plus-carrinho.png'),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromRGBO(255, 106, 57, 1)))),
                          ],
                        ))
                  ],
                ))
              ]))
        ]));
  }
}
