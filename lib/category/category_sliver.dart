import 'package:flutter/material.dart';

import 'category_model.dart';

class CategorySliver extends StatefulWidget {
  final List<CategoryModel> categories;
  //final func;

  CategorySliver({required this.categories});
  @override
  _CategorySliverState createState() => _CategorySliverState();
}

class _CategorySliverState extends State<CategorySliver> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
