class CategoryModel {
  final String title;
  final String tipo;
  final String barril;
  final String grape;
  final String safra;
  final String guarda;
  final String teor;
  final String temperatura;
  final String winery;
  final String country;
  final String region;
  final String classe;
  final String volume;
  final String price;
  final String image;

  CategoryModel({
    required this.title,
    required this.tipo,
    required this.barril,
    required this.grape,
    required this.safra,
    required this.guarda,
    required this.teor,
    required this.temperatura,
    required this.winery,
    required this.country,
    required this.region,
    required this.classe,
    required this.volume,
    required this.price,
    required this.image,
  });
}

CategoryModel createCategoryModel(Map<String, String> productData) {
  Map<String, String> attributes = {
    'title': '',
    'tipo': '',
    'barril': '',
    'grape': '',
    'safra': '',
    'guarda': '',
    'teor': '',
    'temperatura': '',
    'winery': '',
    'country': '',
    'region': '',
    'classe': '',
    'volume': '',
    'price': '',
    'image': '',
  };

  productData.forEach((key, value) {
    attributes[key] = value;
  });
  CategoryModel categoryModel = CategoryModel(
    title: attributes['title'].toString(),
    tipo: attributes['tipo'].toString(),
    barril: attributes['barril'].toString(),
    grape: attributes['grape'].toString(),
    safra: attributes['safra'].toString(),
    guarda: attributes['guarda'].toString(),
    teor: attributes['teor'].toString(),
    temperatura: attributes['temperatura'].toString(),
    winery: attributes['winery'].toString(),
    country: attributes['country'].toString(),
    region: attributes['region'].toString(),
    classe: attributes['classe'].toString(),
    volume: attributes['volume'].toString(),
    price: attributes['price'].toString(),
    image: attributes['image'].toString(),
  );

  return categoryModel;
}

List<CategoryModel> getAllCategoryModels(Map<String, String> data) {
  List<CategoryModel> categoryModels = [];
  data.forEach((key, value) {
    CategoryModel categoryModel = createCategoryModel({"$key": "$value"});
    categoryModels.add(categoryModel);
  });
  return categoryModels;
}

List<CategoryModel> getCategoryModels(
    {required Map<String, List<Map<String, String>>> data,
    required String category,
    required String country}) {
  List<CategoryModel> categoryModels = [];
  data[category]!.forEach((element) {
    CategoryModel model = createCategoryModel(element);
    categoryModels.add(model);
  });

  if (country != 'All') {
    Iterable<CategoryModel> x =
        categoryModels.where((element) => element.country == country);
    List<CategoryModel> y = x.toList();
    return y;
  } else {
    return categoryModels;
  }
}
