import 'package:Zmarket/deprecated/produto_container.dart';
import 'package:Zmarket/deprecated/produto_model_deprecated.dart';
import 'package:flutter/material.dart';

class ProdutosGrid extends StatefulWidget {
  final List<ProdutoModelDep> produtomodels;
  ProdutosGrid({required this.produtomodels});
  @override
  _ProdutosGridState createState() => _ProdutosGridState();
}

class _ProdutosGridState extends State<ProdutosGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return ProdutoContainer(
            fun: () {}, produtoModel: widget.produtomodels[index]);
      }, childCount: widget.produtomodels.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 1,
        mainAxisSpacing: 40,
        crossAxisCount: 2,
      ),
    );
  }
}
