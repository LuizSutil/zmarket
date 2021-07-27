import 'package:flutter/material.dart';

class CatBoxModel {
  late Icon icon;
  late String category;

  CatBoxModel({required this.icon, required this.category});
}

CatBoxModel createCatBox(record) {
  Map<String, dynamic> attributes = {
    'CatName': '',
    'Icone': Icon,
  };

  record.forEach((key, value) => {attributes[key] = value});
  CatBoxModel catBoxModel =
      CatBoxModel(icon: attributes['Icone'], category: attributes['CatName']);

  return catBoxModel;
}

List<CatBoxModel> getAllCatBoxes(Map<String, dynamic> data) {
  List<CatBoxModel> catBoxes = [];
  data.forEach((key, value) {
    CatBoxModel catBox = createCatBox(value);
    catBoxes.add(catBox);
  });

  return catBoxes;
}
