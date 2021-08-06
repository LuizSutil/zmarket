import 'package:Zmarket/category/categories.dart';
import 'package:Zmarket/category/category_model.dart';
import 'package:Zmarket/functionalities/filter_drop_down.dart';
import 'package:flutter/material.dart';

import '../db_json.dart';

class WineSelect extends StatefulWidget {
  @override
  _WineSelectState createState() => _WineSelectState();
}

class _WineSelectState extends State<WineSelect> {
  String paisController = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: Filter(
                  filterValue: paisController,
                  filterText: "Pais",
                  filterItems: ['All', 'Argentina', 'Chile'],
                  fun: (newvalue) {
                    setState(() {
                      paisController = newvalue;
                    });
                  })),
          SliverToBoxAdapter(
              child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          )),
          Container(
              child: Categorias(
            categotyModels: getCategoryModels(
              data: shop,
              category: "Vinhos",
              country: paisController,
            ),
          )),
        ]));
  }
}
