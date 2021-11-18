//import 'package:Zmarket/home/profile.dart';
//import 'package:Zmarket/home/home_page.dart';
import 'package:Zmarket/pages/home_page.dart';
import 'package:Zmarket/widgets/z_app_bar.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MyHomePage(),
    Center(child: Text('In Development')),
    Center(child: Text('In Development')),
    //Scaffold(
    //  body: Profile(),
    //)
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
              return <Widget>[Zappbar()];
            }, //_children[_currentIndex]
            body: _children[_currentIndex]),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Pesquisa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.lightbulb),
          //   label: "Inspiracao",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Você",
          ),
        ],
      ),
    );
  }
}
