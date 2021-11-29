import 'package:flutter/material.dart';

class ListaAddBtn extends StatefulWidget {
  final List<String> listaNames;
  final Function fun;

  ListaAddBtn({required this.listaNames, required this.fun});
  @override
  _ListaAddBtnState createState() => _ListaAddBtnState();
}

class _ListaAddBtnState extends State<ListaAddBtn> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            height: 400.0, // Change as per your requirement
            width: 400.0,
            child: ListView.builder(
              itemCount: widget.listaNames.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    widget.fun(widget.listaNames[index]);
                  },
                  title: Card(
                      color: Colors.purple[600],
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            widget.listaNames[index],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ))),
                );
              },
            )));
  }
}
