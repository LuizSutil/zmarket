import 'package:flutter/material.dart';

class ItemCounter extends StatefulWidget {
  final Function add;
  final Function minus;
  final int quantity;
  ItemCounter({required this.add, required this.minus, required this.quantity});
  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            onTap: () {
              widget.minus();
            },
            child: Ink(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              width: 60,
              height: 35,
              child: Center(
                  child: Text(
                "-",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            )),
        Container(
          width: 30,
          height: 35,
          child: Center(
              child: Text(
            widget.quantity.toString(),
            style: TextStyle(fontSize: 15, color: Colors.white),
          )),
          color: Theme.of(context).colorScheme.secondary,
        ),
        InkWell(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            onTap: () {
              widget.add();
            },
            child: Ink(
              width: 60,
              height: 35,
              child: Center(
                  child: Text(
                "+",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
            )),
      ],
    );
  }
}
