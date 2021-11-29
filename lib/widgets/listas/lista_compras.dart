import 'package:Zmarket/models/listinha_model.dart';
import 'package:Zmarket/pages/cart_page.dart';
import 'package:Zmarket/utilities/db_json.dart';
import 'package:flutter/material.dart';

class ListaCompras extends StatefulWidget {
  final ListinhaModel lista;

  final Function callback;
  ListaCompras({required this.lista, required this.callback});

  @override
  _ListaComprasState createState() => _ListaComprasState();
}

class _ListaComprasState extends State<ListaCompras> {
  // deleteLista() {
  //   listas.remove(widget.nomeLista);
  //   widget.callback();
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        color: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              splashColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                ////////////
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CartPage(cartLocal: widget.lista)));
              },
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                          child: Text(widget.lista.nome,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.primary))),
                      Padding(
                          padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    widget.lista.cart.length >= 1
                                        ? widget.lista.cart[0].item == 'Manekin'
                                            ? 'Add Produtos para visualizar!'
                                            : widget.lista.cart[0].item
                                        : '',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                Text(
                                    widget.lista.cart.length >= 2
                                        ? widget.lista.cart[1].item.toString()
                                        : '',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                Text(
                                    widget.lista.cart.length >= 3
                                        ? widget.lista.cart[2].item.toString()
                                        : '',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                Text(
                                    widget.lista.cart.length >= 4
                                        ? widget.lista.cart[3].item.toString()
                                        : '',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                Text(
                                    widget.lista.cart.length >= 5
                                        ? widget.lista.cart[4].item.toString()
                                        : '',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                              ]))
                    ],
                  ),
                ),
                Column(children: [
                  IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz,
                          color: Theme.of(context).colorScheme.primary))
                ])
              ])),
        ));
  }
}
