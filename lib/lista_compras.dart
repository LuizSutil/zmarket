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
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [
              const Color.fromRGBO(92, 32, 171, 1),
              const Color.fromRGBO(60, 60, 134, 1),
              Theme.of(context).accentColor,
            ],
            begin: const FractionalOffset(2.0, 2.0),
            end: const FractionalOffset(2.0, 2.0),
            stops: [0.0, 1.0, 2.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              splashColor: Theme.of(context).primaryColor,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IndividualLista(
                            nomeLista: widget.nomeLista,
                            cart: widget.produtos)));
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
                                  color: Theme.of(context).primaryColor))),
                      Padding(
                          padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    widget.produtos.length >= 1
                                        ? widget.produtos[0]
                                        : '',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                Text(
                                    widget.produtos.length >= 2
                                        ? widget.produtos[1]
                                        : '',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                Text(
                                    widget.produtos.length >= 3
                                        ? widget.produtos[2]
                                        : '',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                Padding(
                                  child: Text(
                                    widget.produtos.length >= 1
                                        ? "..."
                                        : 'Add Produtos para visualizar!',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                )
                              ]))
                    ],
                  ),
                ),
                Column(children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 20, 0),
                      child: MaterialButton(
                        onPressed: () => {},
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          size: 30,
                          color: Theme.of(context).accentColor,
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
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 5),
                    child: MaterialButton(
                      onPressed: () => {},
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: 30,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ])
              ])),
        ));
  }
}
