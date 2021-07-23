import 'package:flutter/material.dart';

class Categorias extends StatefulWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      crossAxisCount: 3,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(
            Icons.local_bar,
            size: 45,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(
            Icons.local_cafe,
            size: 45,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(
            Icons.local_dining,
            size: 45,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(
            Icons.outdoor_grill,
            size: 45,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(
            Icons.wine_bar,
            size: 45,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(
            Icons.sanitizer,
            size: 45,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(
            Icons.savings,
            size: 45,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(
            Icons.smoking_rooms,
            size: 45,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(
            Icons.sports_bar,
            size: 45,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(
            Icons.pets,
            size: 45,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
