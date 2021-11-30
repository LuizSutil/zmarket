import 'dart:ffi';

import 'package:Zmarket/tabs.dart';
import 'package:Zmarket/utilities/screensize_reducers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Notinha extends StatefulWidget {
  final double price;
  Notinha({required this.price});
  @override
  _NotinhaState createState() => _NotinhaState();
}

class _NotinhaState extends State<Notinha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Resumo da compra',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          Align(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Valor: " + r"R$ " + widget.price.toStringAsFixed(2),
                  style: TextStyle(fontSize: 30),
                ),
                Padding(
                    child: Text("Ainda não terminamos essa tela!"),
                    padding: EdgeInsets.only(top: 50)),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.secondary,
            ),
            width: screenWidth(context) * 0.8,
            height: screenHeight(context) * 0.6,
          )),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Tabs()));
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Tabs()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Retornar para Aplicativo',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  )))
        ],
      )),
    );
  }
}
