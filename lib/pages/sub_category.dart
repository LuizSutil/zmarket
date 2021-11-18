import 'package:Zmarket/pages/produtos.dart';
import 'package:Zmarket/widgets/z_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:Zmarket/utilities/db_json.dart';

class SubCategory extends StatefulWidget {
  final String subcategory;
  SubCategory({required this.subcategory});
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

//categories[widget.subcategory]![i]

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Stack(clipBehavior: Clip.none, children: [
          NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[Zappbar()];
              }, //_children[_currentIndex]
              body: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        widget.subcategory,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Image.asset(
                            'assets/svgs/filterIcon.png',
                            width: 25,
                            height: 25,
                          ))
                    ],
                  ),
                )),
                SliverPadding(
                    padding: EdgeInsets.all(10),
                    sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Produtos(
                                              produtos: categories[widget
                                                      .subcategory]![index]
                                                  .keys
                                                  .toString()
                                                  .replaceAll("(", "")
                                                  .replaceAll(")", ""),
                                            )));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          categories[widget.subcategory]![index]
                                              .values
                                              .toString()
                                              .replaceAll("(", "")
                                              .replaceAll(")", ""),
                                          width: 100,
                                          height: 100,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              categories[widget.subcategory]![
                                                      index]
                                                  .keys
                                                  .toString()
                                                  .replaceAll("(", "")
                                                  .replaceAll(")", ""),
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      57, 69, 158, 1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ))
                                      ])));
                        }, childCount: categories[widget.subcategory]!.length),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                        )))
              ]))
        ]));
  }
}
