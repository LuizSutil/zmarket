import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'cat_box_model.dart';

class CatBox extends StatefulWidget {
  final CatBoxModel catboxModel;
  late final fun;

  CatBox({required this.catboxModel, required this.fun});
  @override
  _CatBoxState createState() => _CatBoxState();
}

class _CatBoxState extends State<CatBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.fun(widget.catboxModel);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          padding: const EdgeInsets.all(18),
          child: Column(children: [
            widget.catboxModel.icon,
            Text(widget.catboxModel.category)
          ]),
        ));
  }
}
