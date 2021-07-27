import 'dart:core';

class ListinhaModel {
  late String nome;
  late List cart;

  ListinhaModel({required this.nome, required this.cart});
}

ListinhaModel createListinha(record) {
  Map<String, dynamic> attributes = {
    'nome': '',
    'cart': [],
  };

  record.forEach((key, value) => {attributes[key] = value});

  ListinhaModel listinhaModel =
      new ListinhaModel(nome: attributes['nome'], cart: attributes['cart']);

  return listinhaModel;
}

List<ListinhaModel> getAllListinhas(Map<String, dynamic> data) {
  List<ListinhaModel> listinhas = [];

  data.forEach((key, value) {
    ListinhaModel listinha = createListinha(value);
    listinhas.add(listinha);
  });

  return listinhas;
}

List<String> getAllListinhaNames(Map<String, dynamic> data) {
  List<String> listinhas = [];

  data.forEach((key, value) {
    String listinha = createListinha(value).nome;
    listinhas.add(listinha);
  });

  return listinhas;
}
