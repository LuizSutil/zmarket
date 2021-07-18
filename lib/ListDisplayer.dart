import 'package:flutter/material.dart';
import 'ListaCompras.dart';
import 'listinhaModel.dart';

class ListDisplay extends StatefulWidget {
  final List<ListinhaModel> lista;

  ListDisplay(this.lista);

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
              child: ListaCompras(widget.lista[index].nome, [
                widget.lista[index].cart[0],
                widget.lista[index].cart[1],
                widget.lista[index].cart[2]
              ]));
        },
        childCount: widget.lista.length,
      ),
    );
  }
}
