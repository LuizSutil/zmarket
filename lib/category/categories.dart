import 'package:Zmarket/category/category_container.dart';
import 'package:flutter/material.dart';
import 'category_model.dart';

class Categorias extends StatefulWidget {
  final List<CategoryModel> categotyModels;
  Categorias({required this.categotyModels});

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return CategoryContainer(categoryModel: widget.categotyModels[index]);
      }, childCount: widget.categotyModels.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 1,
        mainAxisSpacing: 45,
        crossAxisCount: 2,
      ),
    );
  }
}
