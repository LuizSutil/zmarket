import 'package:Zmarket/produto_box_model.dart';
import 'package:flutter/material.dart';

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
    return Container(
        child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).accentColor, width: 2),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
          Image(
            image: AssetImage(widget.prodBoxModel.image),
            height: 90,
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
                iconSize: 50,
              ),
              right: -21,
              bottom: -21),
          Positioned(
            child: Container(
                constraints: BoxConstraints(maxWidth: 100),
                child: Text(
                  'RS 42,69',
                  style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                )),
            top: 133,
            right: 45,
          ),
          Positioned(
            child: Container(
                constraints: BoxConstraints(maxWidth: 120),
                child: Text(
                  widget.prodBoxModel.name,
                  style: TextStyle(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
            top: 150,
          ),
        ])
        //Text(widget.prodBoxModel.category),
        );
  }
}
