import 'package:flutter/material.dart';

import 'prod_box.dart';
import 'produto_box_model.dart';

class Produtos extends StatefulWidget {
  final List<ProdBoxModel> prodboxes;
  late final func;
  Produtos({required this.prodboxes, required this.func});

  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return ProdBox(prodBoxModel: widget.prodboxes[index], fun: widget.func);
      }, childCount: widget.prodboxes.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 55,
        crossAxisCount: 2,
      ),
    );
  }
}
