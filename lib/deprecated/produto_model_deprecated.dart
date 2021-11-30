class ProdutoModelDep {
  final String title;
  final String price;
  final String image;
  final String route;
  final filters;
  Set kwords = {};

  ProdutoModelDep(
      {required this.title,
      required this.price,
      required this.route,
      required this.image,
      required this.filters});
}

ProdutoModelDep createProdutoModelDep(productData) {
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

  ProdutoModelDep protudoModel = ProdutoModelDep(
      title: attributes['title'],
      price: attributes['price'],
      image: attributes['image'],
      route: attributes['route'],
      filters: attributes['filters']);
  protudoModel.kwords = Set.from(attributes['kwords']);

  return protudoModel;
}

List<ProdutoModelDep> getAllProdutoModels(Map<String, String> data) {
  List<ProdutoModelDep> produtoModels = [];
  data.forEach((key, value) {
    ProdutoModelDep produtoModel = createProdutoModelDep({"$key": "$value"});
    produtoModels.add(produtoModel);
  });
  return produtoModels;
}
