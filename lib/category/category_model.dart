class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name, required this.image});
}

CategoryModel createCategoryModel(Map<String, String> categoryMap) {
  String name = '';
  String image = '';
  categoryMap.forEach((key, value) {
    name = key;
    image = value;
  });
  CategoryModel categoryModel = CategoryModel(name: name, image: image);

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
