Map<String, dynamic> listas = {
  'Rancho do Mês': {
    'nome': 'Rancho do Mês',
    'cart': [
      {'item': "Água Mineral Crystal", 'amount': 1, 'subcat': 'Água'},
      {'item': "Água Mineral daguarda", 'amount': 1, 'subcat': 'Água'},
      {'item': "Água Mineral Outra", 'amount': 1, 'subcat': 'Água'}
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
  // 'Condimentos e temperos': [
  //   {'Açucar'},
  //   {'Azeite'},
  //   {'Enlatados'},
  //   {'Farinha'},
  //   {'Fermento'},
  //   {'Ketchup'},
  //   {'Molho de Tomate'},
  //   {'Mustarda e Maionese'},
  //   {'Pimentas'},
  //   {'Sal'},
  //   {'Temperos'},
  //   {'Vinagre'}
  // ],
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
      'image': 'assets/svgs/bebidas/water-bottle.png',
      'price': 1.25,
      'amount': '500',
      'unit': 'ml',
      'category': "Bebidas",
      'subcategory': "Água"
    },
    'Água Mineral Outra': {
      'name': 'Água Mineral Outra',
      'image': 'assets/svgs/bebidas/water-bottle.png',
      'price': 1.12,
      'amount': '500',
      'unit': 'ml',
      'category': "Bebidas",
      'subcategory': "Água"
    }
  }
};
