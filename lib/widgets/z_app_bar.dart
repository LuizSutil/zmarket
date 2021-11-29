import 'package:flutter/material.dart';

class Zappbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Zmarket",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 30.0,
          )),
      backgroundColor: Theme.of(context).colorScheme.primary,
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      expandedHeight: 20.0,
      floating: false,
      pinned: true,
      centerTitle: false,
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                print("shopping cart!");
              }, // handle your image tap here
              child: Image.asset(
                'assets/svgs/shopping-cart.png',
                //fit: BoxFit.cover, // this is the solution for border
                width: 60.0,
                height: 60.0,
              ),
            ))
      ],
    );
  }
}
