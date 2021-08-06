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
                color: Colors.white,
                border:
                    Border.all(color: Theme.of(context).accentColor, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: () {
                  print(widget.categoryModel.title);
                },
                child: Image(
                  image: AssetImage(widget.categoryModel.image),
                  height: 120,
                  width: 120,
                ),
              )),
          Text(
            widget.categoryModel.title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor),
          )
        ],
      ),
    ]);
  }
}
