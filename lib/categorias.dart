//import 'cat_box_model.dart';
import 'package:flutter/material.dart';
import 'cat_box.dart';

class Categorias extends StatefulWidget {
  final List<CatBox> catbox;

  Categorias({required this.catbox});

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
      children: widget.catbox,
    );
  }
}
