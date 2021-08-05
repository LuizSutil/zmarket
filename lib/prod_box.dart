import 'package:Zmarket/produto_box_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProdBox extends StatefulWidget {
  final ProdBoxModel prodBoxModel;
  final fun;

  ProdBox({required this.prodBoxModel, required this.fun});

  @override
  _ProdBoxState createState() => _ProdBoxState();
}

class _ProdBoxState extends State<ProdBox> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Column(children: [
        Container(
          child: Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  child: Image(
                    image: AssetImage(widget.prodBoxModel.image),
                    height: 85,
                  ),
                  constraints: BoxConstraints(minHeight: 120, minWidth: 130),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).accentColor, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                    right: -4,
                    bottom: -4,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
                Positioned(
                    child: IconButton(
                      splashRadius: 25,
                      onPressed: () {},
                      icon: Icon(Icons.add_circle),
                      color: Colors.green,
                      iconSize: 45,
                    ),
                    right: -21,
                    bottom: -21),
              ]),
        ),
        Align(
          child: Text(
            widget.prodBoxModel.price,
            style: TextStyle(
                fontSize: 17,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          alignment: Alignment.center,
        ),
        Container(
            constraints: BoxConstraints(maxWidth: 150),
            alignment: Alignment.center,
            child: Text(
              widget.prodBoxModel.name,
              style: TextStyle(fontSize: 17),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )),
      ])
    ]);
  }
}
