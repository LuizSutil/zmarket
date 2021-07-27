//import 'cat_box_model.dart';
import 'package:Zmarket/cat_box_model.dart';
import 'package:flutter/material.dart';
import 'cat_box.dart';

class Categorias extends StatefulWidget {
  final List<CatBoxModel> catboxes;
  late final func;
  Categorias({required this.catboxes, required this.func});

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return CatBox(catboxModel: widget.catboxes[index], fun: widget.func);
      }, childCount: widget.catboxes.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 3,
      ),
    );
  }
}
