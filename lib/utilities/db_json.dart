Map<String, dynamic> listas = {
  'Rancho do Mês': {
    'nome': 'Rancho do Mês',
    'cart': [
      {'item': "Água Mineral Crystal", 'amount': 1, 'subcat': 'Água'},
      {'item': "Água Mineral daguarda", 'amount': 1, 'subcat': 'Água'},
      {'item': "Água Mineral Voss", 'amount': 1, 'subcat': 'Água'}
    ],
  },
  'Festa do Vinho': {
    'nome': 'Festa do Vinho',
    'cart': [
      {'item': "Manekin", 'amount': 1, 'subcat': 'none'}
    ]
  }
};

var categories = {
  'Bebidas': [
    {'Água': 'assets/svgs/bebidas/water-bottle.png'},
    {'Café': 'assets/svgs/bebidas/tea.png'},
    {'Chá': 'assets/svgs/bebidas/tea-cup.png'},
    {'Champagne': 'assets/svgs/bebidas/toast.png'},
    {'Destilado': 'assets/svgs/bebidas/tequila.png'},
    {'Energético': 'assets/svgs/bebidas/soda-can.png'},
    {'Bebidas de Esporte': 'assets/svgs/bebidas/water-bottle-2.png'},
    {'Refrigerante': 'assets/svgs/bebidas/cola.png'},
    {'Sucos': 'assets/svgs/bebidas/orange-juice.png'},
    {'Vinhos': 'assets/svgs/bebidas/wine.png'},
  ],
  'Condimentos': [
    {'Açucar': 'assets/svgs/condimentos/acucar.png'},
    //{'Azeite':'assets/svgs/condimentos/acucar.png'},
    {'Enlatados': 'assets/svgs/condimentos/enlatados.png'},
    {'Farinha': 'assets/svgs/condimentos/farinha.png'},
    //{'Fermento':'assets/svgs/condimentos/acucar.png'},
    {'Ketchup': 'assets/svgs/condimentos/ketchup.png'},
    {'Molho de Tomate': 'assets/svgs/condimentos/tomatosauce.png'},
    {'Mustarda e Maionese': 'assets/svgs/condimentos/mayonnaise.png'},
    {'Pimentas': 'assets/svgs/condimentos/pimentas.png'},
    {'Sal': 'assets/svgs/condimentos/sal.png'},
    {'Temperos': 'assets/svgs/condimentos/temperos.png'},
    //{'Vinagre':'assets/svgs/condimentos/acucar.png'}
  ],
  // "Grãos": [
  //   {'Arroz'},
  //   {'Cereais'},
  //   {'Feijão'},
  //   {'Lentilha'},
  //   {'Macarrão'}
  // ],
  // "Snacks": [
  //   {'Barra de cereal'},
  //   {'Bolachas e biscoitos'},
  //   {'Bolos'},
  //   {'Chips'},
  //   {'Chocolate'},
  //   {'Doçes'},
  //   {'Gelatina'},
  //   {'Pipoca'}
  // ],
  // "Laticínios e frios": [
  //   {'Carnes frias'},
  //   {'Congelados'},
  //   {'Creamcheese'},
  //   {'Leite'},
  //   {'Manteiga'},
  //   {'Margarina'},
  //   {'Ovos'},
  //   {'Queijo'},
  //   {'Requeijão'},
  //   {'Yogurt'}
  // ],
  // "Higiene": [
  //   {'Absorvente'},
  //   {'Barba'},
  //   {'Condicionador'},
  //   {'Cotonete'},
  //   {'Creme dental'},
  //   {'Desodorante'},
  //   {'Frauda'},
  //   {'Papel higiênico'},
  //   {'Sabonete'},
  //   {'Shampoo'}
  // ],
  // "Limpeza": [
  //   {'Água sanitária'},
  //   {'Amaciante'},
  //   {'Desinfetante'},
  //   {'Detergente'},
  //   {'Esponja'},
  //   {'Guardanapo'},
  //   {'Lava roupas'},
  //   {'Limpa vidros'},
  //   {'Papel alumínio'},
  //   {'Papel toalha'},
  //   {'Saco de lixo'}
  // ]
};

var produtos = {
  'Açucar': {},
  'Enlatados': {},
  'Farinha': {},
  'Ketchup': {},
  'Molho de Tomate': {},
  'Mustarda e Maionese': {},
  'Pimentas': {},
  'Sal': {},
  'Temperos': {},
  'Café': {},
  'Chá': {},
  'Champagne': {},
  'Destilado': {},
  'Energético': {},
  'Bebidas de Esporte': {},
  'Refrigerante': {},
  'Sucos': {},
  'Vinhos': {},
  'Água': {
    'Água Mineral Crystal': {
      'name': 'Água Mineral Crystal',
      'image': 'assets/products/agua-crystal-500ml.jpg',
      'price': 1.55,
      'amount': '500',
      'unit': 'ml',
      'category': "Bebidas",
      'subcategory': "Água"
    },
    'Água Mineral daguarda': {
      'name': 'Água Mineral daguarda',
      'image': 'assets/products/agua-daguarda-500ml.jpg',
      'price': 1.25,
      'amount': '500',
      'unit': 'ml',
      'category': "Bebidas",
      'subcategory': "Água"
    },
    'Água Mineral Voss': {
      'name': 'Água Mineral Voss',
      'image': 'assets/products/voss-500ml.jpg',
      'price': 19.99,
      'amount': '500',
      'unit': 'ml',
      'category': "Bebidas",
      'subcategory': "Água"
    }
  }
};
