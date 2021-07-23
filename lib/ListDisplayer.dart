import 'package:flutter/material.dart';
import 'ListaCompras.dart';
import 'listinhaModel.dart';

class ListDisplay extends StatefulWidget {
  final List<ListinhaModel> lista;
  final Map<String, Map<String, Object>> posts;
  final Function callback;

  ListDisplay(this.lista, this.posts, this.callback);

  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ListaCompras(widget.lista[index].nome,
                  widget.lista[index].cart, widget.posts, widget.callback));
        },
        childCount: widget.lista.length,
      ),
    );
  }
}
