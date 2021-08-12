import 'package:Zmarket/home/profile.dart';
import 'package:Zmarket/home/home_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MyHomePage(),
    Center(child: Text('In Development')),
    Center(child: Text('In Development')),
    Scaffold(
      body: Profile(),
    )
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(clipBehavior: Clip.none, children: [
        NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text("Zmarket",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 30.0,
                      )),
                  backgroundColor: Theme.of(context).accentColor,
                  expandedHeight: 80.0,
                  floating: false,
                  pinned: true,
                ),
              ];
            }, //_children[_currentIndex]
            body: _children[_currentIndex]),
        Positioned(
            top: 50,
            right: 10,
            child: Container(
                constraints: BoxConstraints(minHeight: 60, minWidth: 60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).accentColor,
                ),
                child: Material(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_outlined),
                      iconSize: 40,
                      color: Colors.white,
                    )))),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Listas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: "Inspiracao",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Voce",
          ),
        ],
      ),
    );
  }
}
