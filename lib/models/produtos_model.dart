import 'dart:core';

class ProdutoModel {
  late String name;
  late String image;
  late double price;
  late String amount;
  late String unit;
  late String category;
  late String subcategory;

  ProdutoModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.amount,
      required this.unit,
      required this.category,
      required this.subcategory});
}

ProdutoModel createProduto(record) {
  Map<String, dynamic> attributes = {
    'image': '',
    'price': 0.0,
    'amount': '',
    'unit': '',
    'category': '',
    'subcategory': '',
    'name': ''
  };

  record.forEach((key, value) => {attributes[key] = value});

  ProdutoModel produtoModel = new ProdutoModel(
    name: attributes['name'],
    image: attributes['image'],
    price: attributes['price'],
    amount: attributes['amount'],
    unit: attributes['unit'],
    category: attributes['category'],
    subcategory: attributes['subcategory'],
  );

  return produtoModel;
}

List<ProdutoModel> getAllProdutos(Map<String, dynamic> data) {
  List<ProdutoModel> produtos = [];

  data.forEach((key, value) {
    ProdutoModel produto = createProduto(value);
    produtos.add(produto);
  });

  return produtos;
}

// List<String> getAllListinhaNames(Map<String, dynamic> data) {
//   List<String> produtos = [];

//   data.forEach((key, value) {
//     String listinha = createProduto(value).nome;
//     produtos.add(listinha);
//   });

//   return produtos;
// }
