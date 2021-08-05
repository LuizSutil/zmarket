import 'package:flutter/material.dart';

import 'category_model.dart';

class CategoryContainer extends StatefulWidget {
  final CategoryModel categoryModel;

  CategoryContainer({required this.categoryModel});
  @override
  _CategoryContainerState createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Column(
        children: [
          Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).accentColor, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: () {
                  print(widget.categoryModel.name);
                },
                child: Image(
                  image: AssetImage(widget.categoryModel.image),
                  height: 120,
                  width: 9999,
                ),
              ))
        ],
      ),
      Text(
        widget.categoryModel.name,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor),
      )
    ]);
  }
}
