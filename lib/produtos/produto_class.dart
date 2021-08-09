class ProdutoModel {
  final String title;
  final String price;
  final String image;
  final String route;
  final filters;
  Set kwords = {};

  ProdutoModel(
      {required this.title,
      required this.price,
      required this.route,
      required this.image,
      required this.filters});
}

ProdutoModel createProdutoModel(productData) {
  Map<String, dynamic> attributes = {
    'title': '',
    'price': '',
    'image': '',
    'route': '',
    'kwords': [],
    'filters': {}
  };

  productData.forEach((key, value) {
    attributes[key] = value;
  });

  ProdutoModel protudoModel = ProdutoModel(
      title: attributes['title'],
      price: attributes['price'],
      image: attributes['image'],
      route: attributes['route'],
      filters: attributes['filters']);
  protudoModel.kwords = Set.from(attributes['kwords']);

  return protudoModel;
}

List<ProdutoModel> getAllProdutoModels(Map<String, String> data) {
  List<ProdutoModel> produtoModels = [];
  data.forEach((key, value) {
    ProdutoModel produtoModel = createProdutoModel({"$key": "$value"});
    produtoModels.add(produtoModel);
  });
  return produtoModels;
}
