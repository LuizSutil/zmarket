import 'package:flutter/material.dart';
import 'app_bar.dart';

class IndividualLista extends StatefulWidget {
  final String nomeLista;
  final List cart;

  IndividualLista({required this.nomeLista, required this.cart});

  criarLista(cart) {
    List<Widget> items = [];

    cart.forEach((element) {
      items.add(Item(element, 69.42));
    });
    return items;
  }

  @override
  _IndividualListaState createState() => _IndividualListaState();
}

class _IndividualListaState extends State<IndividualLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: CustomScrollView(slivers: [
          Zappbar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                  height: 500,
                  child: Card(
                    color: Theme.of(context).accentColor,
                    child: ListView(children: [
                      Padding(
                          child: Text(widget.nomeLista,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26)),
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 10)),
                      Padding(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.criarLista(widget.cart),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      )
                    ]),
                  )),
            )),
          ])),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    child: TextField(
                        decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Theme.of(context).primaryColor,
                    )),
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 10),
                  ),
                ),
                Padding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Salvar lista',
                          )),
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                )
              ],
            ),
          ),
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
            padding: EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
                child: Text('insert categorias widget here')),
          ),
        ]));
  }
}

class Item extends StatefulWidget {
  final String element;
  final double itemPrice;
  Item(this.element, this.itemPrice);
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    var finalPrice = (quantity * widget.itemPrice).toStringAsFixed(2);

    minusQuant() {
      setState(() {
        quantity == 1 ? quantity = 1 : quantity--;
        print(quantity);
      });
    }

    addQuant() {
      setState(() {
        quantity++;
        print(quantity);
      });
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              alignment: Alignment.centerLeft,
              width: 80,
              height: 80,
              child: Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/vinhos/vinho1.JPG'),
                    height: 80,
                  )),
            ),
            Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                splashRadius: 23,
                onPressed: () {
                  minusQuant();
                },
                color: Color.fromRGBO(28, 150, 9, 1),
                icon: Icon(
                  Icons.remove_circle_outline,
                  size: 25,
                ),
              ),
              Text(
                quantity.toString(),
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              IconButton(
                splashRadius: 23,
                color: Color.fromRGBO(28, 150, 9, 1),
                onPressed: () {
                  addQuant();
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 25,
                ),
              )
            ])),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  child: Text('RS $finalPrice',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                )),
            IconButton(
              splashRadius: 23,
              color: Colors.red,
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                size: 25,
              ),
            )
          ],
        ),
        Align(
          child: Padding(
              child: Text(widget.element,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
          alignment: Alignment.centerLeft,
        ),
      ]),
    );
  }
}
