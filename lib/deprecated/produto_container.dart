import 'package:Zmarket/deprecated/produto_model_deprecated.dart';
import 'package:flutter/material.dart';

class ProdutoContainer extends StatefulWidget {
  final ProdutoModelDep produtoModel;
  final fun;

  ProdutoContainer({required this.fun, required this.produtoModel});
  @override
  _ProdutoContainerState createState() => _ProdutoContainerState();
}

class _ProdutoContainerState extends State<ProdutoContainer> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Column(children: [
        Container(
          child: Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image(
                        image: AssetImage(widget.produtoModel.image),
                        height: 85,
                      )),
                  constraints: BoxConstraints(minHeight: 120, minWidth: 130),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                    right: -4,
                    bottom: -4,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )),
                Positioned(
                    child: IconButton(
                      splashRadius: 25,
                      onPressed: () {},
                      icon: Icon(Icons.add_circle),
                      color: Colors.green,
                      iconSize: 45,
                    ),
                    right: -21,
                    bottom: -19),
              ]),
        ),
        Align(
          child: Text(
            r"R$ " + widget.produtoModel.price,
            style: TextStyle(
                fontSize: 17,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          alignment: Alignment.center,
        ),
        Container(
            alignment: Alignment.center,
            child: Text(
              widget.produtoModel.title,
              style: TextStyle(fontSize: 17),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
        Container(
            alignment: Alignment.center,
            child: Text(
              widget.produtoModel.filters['tipo'] == null
                  ? ''
                  : widget.produtoModel.filters['tipo'],
              style: TextStyle(fontSize: 17),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )),
        Container(
            child: Text(
          widget.produtoModel.filters['grape'] == null
              ? ''
              : widget.produtoModel.filters['grape'],
          style: TextStyle(fontSize: 17),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )),
        Container(
            alignment: Alignment.center,
            child: Text(
              widget.produtoModel.filters['class'] == null
                  ? ''
                  : widget.produtoModel.filters['class'],
              style: TextStyle(fontSize: 17),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )),
      ])
    ]);
  }
}
