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
                  // setState(() {
                  //_current = index;
                  //print(_current);
                  // });
                },
                viewportFraction: 0.8,
                enableInfiniteScroll: false,
                height: screenWidth(context) * 0.55), // Gotta Mediaquery
            items: getAllListinhas(listas).map((i) {
              return Builder(builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: ListaCompras(i.nome, i.cart, listas, () {
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
          }).toList())
    ]);
  }
}
