import 'dart:core';

class ItemModel {
  late String item;
  late int count;
  late String subcat;

  int get thecount => count;

  void add(int value) {
    count = count + value;
  }

  void sub(int value) {
    count > 1 ? count = count - value : count = 1;
  }

  ItemModel({required this.item, required this.count, required this.subcat});
}

class ListinhaModel {
  late String nome;
  late List<ItemModel> cart;

  ListinhaModel({required this.nome, required this.cart});
}

ItemModel createItem(record) {
  Map<String, dynamic> attributes = {'item': '', 'count': 1, 'subcat': ''};

  record.forEach((key, value) => {attributes[key] = value});

  ItemModel itemModel = new ItemModel(
      item: attributes['item'],
      count: attributes['count'],
      subcat: attributes['subcat']);

  return itemModel;
}

List<ItemModel> createCart(data) {
  List<ItemModel> cart = [];

  data.forEach((value) {
    ItemModel item = createItem(value);
    cart.add(item);
  });

  return cart;
}

ListinhaModel createListinha(record) {
  Map<String, dynamic> attributes = {
    'nome': '',
    'cart': [],
  };

  record.forEach((key, value) => {attributes[key] = value});

  ListinhaModel listinhaModel = new ListinhaModel(
      nome: attributes['nome'], cart: createCart(attributes['cart']));

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
