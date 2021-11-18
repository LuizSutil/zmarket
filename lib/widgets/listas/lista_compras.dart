import 'package:flutter/material.dart';

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
        elevation: 10,
        color: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              splashColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                print('clicked listinha!');
              },
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                          child: Text(widget.nomeLista,
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
                                Text(
                                    widget.produtos.length >= 4
                                        ? widget.produtos[3]
                                        : '',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                Text(
                                    widget.produtos.length >= 5
                                        ? widget.produtos[4]
                                        : '',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                Padding(
                                  child: Text(
                                    widget.produtos.length >= 1
                                        ? "..."
                                        : 'Add Produtos para visualizar!',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                )
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
