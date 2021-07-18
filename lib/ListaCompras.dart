import 'package:flutter/material.dart';

class ListaCompras extends StatefulWidget {
  final String nomeLista;
  final List<String> produtos;

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
            print('Card tapped.');
          },
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(widget.nomeLista,
                          style: TextStyle(fontSize: 20))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.produtos[0],
                                style: TextStyle(fontSize: 13)),
                            Text(widget.produtos[1],
                                style: TextStyle(fontSize: 13)),
                            Text(widget.produtos[2],
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
          ])),
    );
  }
}
