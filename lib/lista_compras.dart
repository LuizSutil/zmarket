import 'package:flutter/material.dart';
import 'individual_lista.dart';

class ListaCompras extends StatefulWidget {
  final String nomeLista;
  final List<dynamic> produtos;
  final Map<String, Map<String, Object>> posts;
  final Function callback;
  ListaCompras(this.nomeLista, this.produtos, this.posts, this.callback);

  @override
  _ListaComprasState createState() => _ListaComprasState();
}

class _ListaComprasState extends State<ListaCompras> {
  deleteLista() {
    widget.posts.remove(widget.nomeLista);
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(230, 230, 230, 1),
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
                              child: Text(widget.produtos.length >= 1
                                  ? "..."
                                  : 'Add Produtos para visualizar!'),
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
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      size: 30,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: MaterialButton(
                  onPressed: () => {deleteLista()},
                  color: Theme.of(context).primaryColor,
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
                  color: Theme.of(context).primaryColor,
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
