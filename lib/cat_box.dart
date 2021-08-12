import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'cat_box_model.dart';

class CatBox extends StatefulWidget {
  final CatBoxModel catboxModel;
  final fun;

  CatBox({required this.catboxModel, required this.fun});
  @override
  _CatBoxState createState() => _CatBoxState();
}

class _CatBoxState extends State<CatBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
            minHeight: 115, minWidth: 115, maxHeight: 115, maxWidth: 115),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor, width: 3),
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor,
        ),
        child: Material(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
                borderRadius: BorderRadius.circular(15),
                splashColor: Colors.purple,
                onTap: () {
                  widget.fun();
                  //widget.fun(widget.catboxModel.category);
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
