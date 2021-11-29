import 'package:Zmarket/models/listinha_model.dart';
import 'package:Zmarket/pages/sub_category.dart';
import 'package:Zmarket/utilities/db_json.dart';
import 'package:Zmarket/utilities/screensize_reducers.dart';
import 'package:Zmarket/widgets/listas/list_displayer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var carrouselState = 0;
  List listateste = [
    "Laticínios e frios",
    "Condimentos e temperos",
    "Grãos",
    "Snacks",
    "Bebidas",
    "Higiene",
    "Limpeza"
  ];
  List categoryImg = [
    'assets/svgs/maincategories/cheese.png',
    'assets/svgs/maincategories/salt.png',
    'assets/svgs/maincategories/wheat.png',
    'assets/svgs/maincategories/popcorn.png',
    'assets/svgs/maincategories/beverage.png',
    'assets/svgs/maincategories/toothbrush.png',
    'assets/svgs/maincategories/broom.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
                child: ListDisplayer(
              callback: (index) {
                setState(() {
                  carrouselState = index;
                });
              },
              carrouselCounter: carrouselState,
            )),
          ),
          SliverToBoxAdapter(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Center(
                            child: Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth(context) * 0.1, bottom: 10),
                          child: Text('Categorias',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )))
                    ])),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                if (index == (listateste.length)) {
                  return Container(
                      color: Theme.of(context).colorScheme.secondary);
                } else {
                  return Container(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Colors.white,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SubCategory(
                                                subcategory: listateste[index],
                                              )));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      categoryImg[index],
                                      //fit: BoxFit.cover, // this is the solution for border
                                      width: 90.0,
                                      height: 90.0,
                                    ),
                                    Text(listateste[index])
                                  ],
                                ),
                              ))));
                }
              },
                  childCount: (listateste.length.isEven
                      ? listateste.length
                      : listateste.length +
                          1)), //length is even ? length : length + 1
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
              )),
        ],
      ),
    );
  }
}
