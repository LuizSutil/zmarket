import 'package:Zmarket/utilities/screensize_reducers.dart';
import 'package:Zmarket/widgets/z_app_bar.dart';
import 'package:flutter/material.dart';

class Produto extends StatefulWidget {
  final String produto;
  Produto({required this.produto});
  @override
  _ProdutoState createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
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
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 20, left: 15),
                        child: Text(
                          'Bebidas > Águas',
                          style: TextStyle(
                              fontSize: 17, fontStyle: FontStyle.italic),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 40),
                        child: Center(
                            child: Image.asset(
                          'assets/products/agua-crystal-500ml.jpg',
                          height: screenHeight(context) * 0.2,
                        ))),
                    Center(child: Text(widget.produto)),
                    Center(child: Text(r"R$ 1,55")),
                    Center(child: Text(r"500 ml")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                onTap: () {},
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  width: 60,
                                  height: 35,
                                  child: Center(
                                      child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                                )),
                            Container(
                              width: 30,
                              height: 35,
                              child: Center(
                                  child: Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            InkWell(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                onTap: () {},
                                child: Ink(
                                  width: 60,
                                  height: 35,
                                  child: Center(
                                      child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                )),
                          ],
                        ),
                        SizedBox(
                            width: 50,
                            child: ElevatedButton(
                                child:
                                    Image.asset('assets/svgs/plus-lista.png'),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(255, 106, 57, 1)))),
                        SizedBox(
                            width: 110,
                            child: ElevatedButton(
                                child: Image.asset(
                                    'assets/svgs/plus-carrinho.png'),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(255, 106, 57, 1)))),
                      ],
                    )
                  ],
                ))
              ]))
        ]));
  }
}
