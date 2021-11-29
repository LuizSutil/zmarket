import 'package:Zmarket/models/listinha_model.dart';
import 'package:Zmarket/utilities/db_json.dart';
import 'package:Zmarket/utilities/screensize_reducers.dart';
import 'package:Zmarket/widgets/listas/lista_compras.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ListDisplayer extends StatefulWidget {
  final Function callback;
  final carrouselCounter;
  ListDisplayer({required this.callback, required this.carrouselCounter});
  @override
  _ListDisplayerState createState() => _ListDisplayerState();
}

class _ListDisplayerState extends State<ListDisplayer> {
  final CarouselController _controller = CarouselController();
  var text = "";
  var _current = 0;

  Future _showCriarLista() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          insetPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          title: new Text('Criar Lista Nova'),
          children: <Widget>[
            Padding(
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (texto) {
                  text = texto;
                },
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Theme.of(context).colorScheme.secondary)),
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black)),
                    labelText: 'Nome da lista',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary)),
              ),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {
                  if (text != '') {
                    setState(() {
                      listas['$text'] = {
                        'nome': '$text',
                        'cart': [
                          {'item': "Manekin", 'amount': 1, 'subcat': 'none'}
                        ]
                      };
                      print(listas.length);
                      _controller.animateToPage(listas.length - 1);

                      _current = listas.length;
                      Navigator.pop(context);
                      _current = listas.keys.toList().length - 1;

                      widget.callback(_current);
                    });
                  }
                },
                color: Theme.of(context).colorScheme.secondary,
                textColor: Colors.white,
                child: Icon(Icons.arrow_right),
                shape: CircleBorder(),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.only(top: 30),
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  widget.callback(index);
                  setState(() {
                    _current = index;
                    print(_current);
                  });
                },
                viewportFraction: 0.8,
                enableInfiniteScroll: false,
                height: screenWidth(context) * 0.55), // Gotta Mediaquery
            items: getAllListinhas(listas).map((lista) {
              return Builder(builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: ListaCompras(
                      lista: lista,
                      callback: () {
                        setState(() {});
                      }),
                );
              });
            }).toList(),
          )),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listas.keys.map((list) {
            int index = listas.keys.toList().indexOf(list);
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.carrouselCounter == index
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.black),
                );
              },
            );
          }).toList()),
      Padding(
          padding: EdgeInsets.only(right: 20, bottom: 20),
          child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    _showCriarLista();
                  },
                  child: Text(
                    'Criar Lista',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ))))
    ]);
  }
}
