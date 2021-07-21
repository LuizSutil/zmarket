import 'package:flutter/material.dart';
import 'package:tutorial_1/appbar.dart';
import 'categorias.dart';

class IndividualLista extends StatefulWidget {
  final String nomeLista;
  final List cart;

  IndividualLista({required this.nomeLista, required this.cart});

  criarLista(cart) {
    List<Widget> items = [];

    cart.forEach((element) {
      items.add(Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(71, 51, 86, 1),
                ),
                alignment: Alignment.centerLeft,
                width: 80,
                height: 80,
                child: Card(
                  color: Color.fromRGBO(71, 51, 86, 1),
                  child: Align(
                      alignment: Alignment.center,
                      child: Image(
                        color: Colors.white,
                        image: AssetImage('assets/ztelluz_logo.png'),
                        height: 20,
                      )),
                ),
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    IconButton(
                      splashRadius: 23,
                      onPressed: () {},
                      color: Color.fromRGBO(28, 150, 9, 1),
                      icon: Icon(
                        Icons.remove_circle_outline,
                        size: 25,
                      ),
                    ),
                    Text('1'),
                    IconButton(
                      splashRadius: 23,
                      color: Color.fromRGBO(28, 150, 9, 1),
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                    )
                  ])),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    child: Text('RS 69,42'),
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
                child: Text(element,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
            alignment: Alignment.centerLeft,
          ),
        ]),
      ));
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
        backgroundColor: Color.fromRGBO(35, 8, 56, 1),
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
                    child: ListView(children: [
                      Padding(
                          child: Text(widget.nomeLista,
                              style: TextStyle(
                                  color: Colors.purple[900], fontSize: 26)),
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 10)),
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
                      fillColor: Colors.white,
                    )),
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 10),
                  ),
                ),
                Padding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: Text('Salvar lista')),
                      ElevatedButton(onPressed: () {}, child: Text('Cancelar')),
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
            sliver: Categorias(),
          ),
        ]));
  }
}
