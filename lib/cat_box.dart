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
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor, width: 3),
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(235, 235, 235, 1),
        ),
        child: Material(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
                splashColor: Colors.purple,
                onTap: () {
                  widget.fun(widget.catboxModel);
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(children: [
                    widget.catboxModel.icon,
                    Expanded(
                        child: Text(
                      widget.catboxModel.category,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ))
                  ]),
                ))));
  }
}
