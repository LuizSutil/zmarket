class ProdBoxModel {
  final String image;
  final String category;
  final String name;

  ProdBoxModel(
      {required this.image, required this.category, required this.name});
}

ProdBoxModel createProdBox(record) {
  Map<String, dynamic> attributes = {
    'ProdName': '',
    'Image': '',
  };

  record.forEach((key, value) => {attributes[key] = value});
  ProdBoxModel prodBoxModel = ProdBoxModel(
      image: attributes['Image'],
      category: attributes['ProdName'],
      name: attributes['Name']);

  return prodBoxModel;
}

List<ProdBoxModel> getAllProdBoxes(Map<String, dynamic> data) {
  List<ProdBoxModel> prodBoxes = [];
  data.forEach((key, value) {
    ProdBoxModel catBox = createProdBox(value);
    prodBoxes.add(catBox);
  });

  return prodBoxes;
}
