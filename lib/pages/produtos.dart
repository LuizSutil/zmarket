import 'package:Zmarket/pages/product_page.dart';
import 'package:Zmarket/widgets/z_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:Zmarket/utilities/db_json.dart';

class Produtos extends StatefulWidget {
  final String produtos;
  Produtos({required this.produtos});
  @override
  _ProdutosState createState() => _ProdutosState();
}

//categories[widget.subcategory]![i]

class _ProdutosState extends State<Produtos> {
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
                  padding: EdgeInsets.fromLTRB(15, 30, 0, 10),
                  child: Row(
                    children: [
                      Text(
                        widget.produtos,
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
                          return Column(children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Produto(
                                              produto: produtos[
                                                      widget.produtos]![index]
                                                  .keys
                                                  .toString()
                                                  .replaceAll("(", "")
                                                  .replaceAll(")", ""))));
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
                                          Padding(
                                              padding: EdgeInsets.only(top: 0),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 80,
                                                              maxWidth: 120),
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Text(
                                                        produtos[widget
                                                                    .produtos]![
                                                                index]
                                                            .keys
                                                            .toString()
                                                            .replaceAll("(", "")
                                                            .replaceAll(
                                                                ")", ""),
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                    Icon(Icons.more_horiz),
                                                  ])),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 0, bottom: 10),
                                            child: Image.asset(
                                              produtos[widget.produtos]![index]
                                                  .values
                                                  .toString()
                                                  .replaceAll("(", "")
                                                  .replaceAll(")", ""),
                                              width: 100,
                                              height: 100,
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Text(r'R$ 1,55',
                                                  style:
                                                      TextStyle(fontSize: 18))),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Text('500 ml'))
                                        ]))),
                            Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 50,
                                          child: ElevatedButton(
                                              child: Image.asset(
                                                  'assets/svgs/plus-lista.png'),
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color.fromRGBO(
                                                      255, 106, 57, 1)))),
                                      SizedBox(
                                          width: 110,
                                          child: ElevatedButton(
                                              child: Image.asset(
                                                  'assets/svgs/plus-carrinho.png'),
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color.fromRGBO(
                                                      255, 106, 57, 1)))),
                                    ]))
                          ]);
                        }, childCount: produtos[widget.produtos]!.length),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 4,
                            crossAxisCount: 2,
                            childAspectRatio: 0.6)))
              ]))
        ]));
  }
}
