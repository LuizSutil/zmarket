import 'package:flutter/material.dart';
import 'individualLista.dart';

class ListaCompras extends StatefulWidget {
  final String nomeLista;
  final List<dynamic> produtos;

  ListaCompras(this.nomeLista, this.produtos);

  @override
  _ListaComprasState createState() => _ListaComprasState();
}

class _ListaComprasState extends State<ListaCompras> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          splashColor: Colors.purple,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => IndividualLista(
                        nomeLista: widget.nomeLista, cart: widget.produtos)));
          },
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(widget.nomeLista,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                widget.produtos.length >= 1
                                    ? widget.produtos[0]
                                    : '',
                                style: TextStyle(fontSize: 16)),
                            Text(
                                widget.produtos.length >= 2
                                    ? widget.produtos[1]
                                    : '',
                                style: TextStyle(fontSize: 16)),
                            Text(
                                widget.produtos.length >= 3
                                    ? widget.produtos[2]
                                    : '',
                                style: TextStyle(fontSize: 16)),
                            Padding(
                              child: Text("..."),
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            )
                          ]))
                ],
              ),
            ),
            Column(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                  child: MaterialButton(
                    onPressed: () => {},
                    color: Color.fromRGBO(56, 37, 109, 1),
                    textColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      size: 30,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: MaterialButton(
                  onPressed: () => {},
                  color: Color.fromRGBO(56, 37, 109, 1),
                  textColor: Colors.white,
                  child: Icon(
                    Icons.delete,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: MaterialButton(
                  onPressed: () => {},
                  color: Color.fromRGBO(56, 37, 109, 1),
                  textColor: Colors.white,
                  child: Icon(
                    Icons.add_shopping_cart,
                    size: 30,
                  ),
                ),
              ),
            ])
          ])),
    );
  }
}
