import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  late final String filterValue;
  final String filterText;
  final List<String> filterItems;
  final fun;

  Filter(
      {required this.filterValue,
      required this.filterText,
      required this.filterItems,
      required this.fun});
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.filterText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        DropdownButton<String>(
          value: widget.filterValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          //onChanged: ,

          onChanged: (String? newValue) {
            widget.fun(newValue);
          },
          items: <String>['All', 'Argentina', 'Chile']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            );
          }).toList(),
        ),
      ],
    );
  }
}
