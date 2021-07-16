import 'package:flutter/material.dart';

class ListaCompras extends StatefulWidget {
  final String nomeLista;
  ListaCompras(this.nomeLista);

  @override
  _ListaComprasState createState() => _ListaComprasState();
}

class _ListaComprasState extends State<ListaCompras> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromRGBO(235, 235, 235, 1),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child:
                        Text(widget.nomeLista, style: TextStyle(fontSize: 20))),
                Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Pizza da Sadia",
                              style: TextStyle(fontSize: 13)),
                          Text("Coquinha (gelada)",
                              style: TextStyle(fontSize: 13)),
                          Text("Gudang importado",
                              style: TextStyle(fontSize: 13)),
                          Text("..."),
                        ]))
              ],
            ),
          ),
          Column(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                ),
                child: Text('Edit'),
                onPressed: () => {},
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                ),
                child: Text('Delete'),
                onPressed: () => {},
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                ),
                child: Text('View/Use'),
                onPressed: () => {},
              ),
            ),
          ])
        ]));
  }
}
