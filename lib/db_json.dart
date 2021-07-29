import 'package:flutter/material.dart';

Map<String, dynamic> sub = {
  'Bebidas': {
    'Cervejas': {
      'CatName': 'Cervejas',
      'Icone': Icon(
        Icons.sports_bar,
        color: Colors.amber[900],
        size: 39,
      ),
      'SubCategorias': {
        'Cervejas Pretas': {
          'CatName': 'Cervejas Pretas',
          'Produtos': {
            'Roleta Russa': {
              'CatName': 'Roleta Russa',
              'Icone': Icon(Icons.sports_bar, size: 39)
            }
          },
          'Icone': Icon(Icons.sports_bar, size: 39)
        },
        'Cervejas Populares': {
          'CatName': 'Cervejas Populares',
          'Produtos': {
            'Roleta Russa': {
              'CatName': 'Roleta Russa',
              'Icone': Icon(Icons.sports_bar, size: 39)
            },
            'Coruja': {
              'CatName': 'Coruja',
              'Icone': Icon(Icons.sports_bar, size: 39)
            },
            'Dado Bier': {
              'CatName': 'Dado Bier',
              'Icone': Icon(Icons.sports_bar, size: 39)
            },
            'Saint beer inNatura': {
              'CatName': 'Dado Bier',
              'Icone': Icon(Icons.sports_bar, size: 39)
            },
          },
          'Icone': Icon(
            Icons.sports_bar_outlined,
            size: 39,
          )
        },
        'Cervejas Sem alcool': {
          'CatName': 'Cervejas Sem alcool',
          'Produtos': {
            'Heineken Alcool Free': {
              'CatName': 'Heineken Alcool Free',
              'Icone': Icon(Icons.sports_bar, size: 39)
            },
            'Skol Alcool Free': {
              'CatName': 'Skol Alcool Free',
              'Icone': Icon(Icons.sports_bar, size: 39)
            }
          },
          'Icone': Icon(
            Icons.sports_bar_rounded,
            size: 39,
          )
        },
        'Cervejas Nacionais': {
          'CatName': 'Cervejas Nacionais',
          'Produtos': {
            'Roleta Russa': {
              'CatName': 'Roleta Russa',
              'Icone': Icon(Icons.sports_bar, size: 39)
            }
          },
          'Icone': Icon(
            Icons.sports_bar_rounded,
            color: Colors.amber[900],
            size: 39,
          )
        }
      }
    },
    'Vinhos': {
      'CatName': 'Vinhos',
      'Icone': Icon(Icons.wine_bar, color: Colors.indigo[800], size: 39),
      'SubCategorias': {
        'Vinhos Tinto': {
          'CatName': 'Vinhos Tinto',
          'Produtos': {
            'Cruz Del Sur Malbec': {
              'CatName': 'Cruz Del Sur Malbec',
              'Icone': Icon(Icons.wine_bar, size: 39)
            }
          },
          'Icone': Icon(
            Icons.wine_bar,
            size: 39,
          )
        },
        'Vinhos Brancos': {
          'CatName': 'Vinhos Brancos',
          'Produtos': {
            'Cruz Del Sur Malbec': {
              'CatName': 'Cruz Del Sur Malbec',
              'Icone': Icon(Icons.wine_bar, size: 39)
            }
          },
          'Icone': Icon(Icons.wine_bar_outlined, size: 39)
        },
        'Vinhos Rose': {
          'CatName': 'Vinhos Rose',
          'Produtos': {
            'Cruz Del Sur Malbec': {
              'CatName': 'Cruz Del Sur Malbec',
              'Icone': Icon(Icons.wine_bar, size: 39)
            }
          },
          'Icone': Icon(Icons.wine_bar, color: Colors.pink[900], size: 39)
        }
      }
    },
    'Destilados': {
      'CatName': 'Destilados',
      'Icone': Icon(Icons.local_bar, color: Colors.tealAccent[700], size: 39),
      'SubCategorias': {
        'Vodkas': {
          'CatName': 'Vodkas',
          'Produtos': {
            'Smirnoff': {
              'CatName': 'Smirnoff',
              'Icone': Icon(Icons.local_bar, size: 39)
            }
          },
          'Icone': Icon(Icons.local_bar, size: 39)
        },
        'Whisky': {
          'CatName': 'Whisky',
          'Produtos': {
            'Red Label': {
              'CatName': 'Red Label',
              'Icone': Icon(Icons.local_bar, size: 39)
            }
          },
          'Icone': Icon(Icons.local_bar, color: Colors.amber[900], size: 39)
        },
        'Rum': {
          'CatName': 'Rum',
          'Produtos': {
            'CocoBlanc': {
              'CatName': 'CocoBlanc',
              'Icone': Icon(Icons.local_bar, size: 39)
            }
          },
          'Icone':
              Icon(Icons.local_bar, color: Colors.blueAccent[300], size: 39)
        },
        'Cachaça': {
          'CatName': 'Cachaça',
          'Produtos': {
            'Caninha': {
              'CatName': 'Caninha',
              'Icone': Icon(Icons.local_bar, size: 39)
            }
          },
          'Icone':
              Icon(Icons.local_bar, color: Colors.deepOrange[900], size: 39)
        },
        'Licor': {
          'CatName': 'Licor',
          'Produtos': {
            'Caninha': {
              'CatName': 'Caninha',
              'Icone': Icon(Icons.local_bar, size: 39)
            }
          },
          'Icone': Icon(Icons.local_bar, color: Colors.indigo[600], size: 39)
        },
        'Gin': {
          'CatName': 'Gin',
          'Produtos': {
            'Caninha': {
              'CatName': 'Caninha',
              'Icone': Icon(Icons.local_bar, size: 39)
            }
          },
          'Icone': Icon(Icons.local_bar, size: 39)
        },
        'Tequila': {
          'CatName': 'Tequila',
          'Produtos': {
            'Caninha': {
              'CatName': 'Caninha',
              'Icone': Icon(Icons.local_bar, size: 39)
            }
          },
          'Icone': Icon(Icons.local_bar, size: 39)
        },
      }
    }
  },
  'Pets': {
    'Cachorros': {
      'CatName': 'Cachorros',
      'Icone': Icon(
        Icons.pets,
        color: Colors.amber[900],
        size: 39,
      ),
      'SubCategorias': {
        'Ração': {
          'CatName': 'Ração',
          'Produtos': {
            'Golden p/dog': {
              'CatName': 'Golden p/dog',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'Pedigree p/dog': {
              'CatName': 'Pedigree p/dog',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'PremieR p/dog': {
              'CatName': 'PremieR p/dog',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'Gran Plus p/dog': {
              'CatName': 'Gran Plus p/dog',
              'Icone': Icon(Icons.pets, size: 39)
            },
          },
          'Icone': Icon(
            Icons.pets,
            color: Colors.grey[900],
            size: 39,
          )
        },
        'Ração filhote dog': {
          'CatName': 'Ração filhote dog',
          'Produtos': {
            'Golden filhote dog': {
              'CatName': 'Golden filhote dog',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'Pedigree filhote dog': {
              'CatName': 'Pedigree filhote dog',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'PremieR filhote dog': {
              'CatName': 'PremieR filhote dog',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'Gran Plus filhote dog': {
              'CatName': 'Gran Plus filhote dog',
              'Icone': Icon(Icons.pets, size: 39)
            },
          },
          'Icone': Icon(
            Icons.pets,
            color: Colors.deepPurple[500],
            size: 39,
          )
        },
        'Brinquedos para Cachorro': {
          'CatName': 'Brinquedos para Cachorro',
          'Produtos': {
            'Kong': {'CatName': 'Kong', 'Icone': Icon(Icons.pets, size: 39)},
            'Osso': {'CatName': 'Osso', 'Icone': Icon(Icons.pets, size: 39)},
            'Mordedor': {
              'CatName': 'Mordedor',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'Disco': {'CatName': 'Disco', 'Icone': Icon(Icons.pets, size: 39)},
          },
          'Icone': Icon(
            Icons.pets,
            color: Colors.grey[900],
            size: 39,
          )
        },
      }
    },
    'Gatos': {
      'CatName': 'Gatos',
      'Icone': Icon(
        Icons.pets,
        color: Colors.amber[900],
        size: 39,
      ),
      'SubCategorias': {
        'Ração': {
          'CatName': 'Ração',
          'Produtos': {
            'Golden p/cat': {
              'CatName': 'Golden p/cat',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'Pedigree p/cat': {
              'CatName': 'Pedigree p/cat',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'PremieR p/cat': {
              'CatName': 'PremieR p/cat',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'Gran Plus p/cat': {
              'CatName': 'Gran Plus p/cat',
              'Icone': Icon(Icons.pets, size: 39)
            },
          },
          'Icone': Icon(
            Icons.pets,
            color: Colors.grey[900],
            size: 39,
          )
        },
        'Ração filhote cat': {
          'CatName': 'Ração filhote cat',
          'Produtos': {
            'Golden filhote cat': {
              'CatName': 'Golden filhote cat',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'Pedigree filhote cat': {
              'CatName': 'Pedigree filhote cat',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'PremieR filhote cat': {
              'CatName': 'PremieR filhote cat',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'Gran Plus filhote cat': {
              'CatName': 'Gran Plus filhote cat',
              'Icone': Icon(Icons.pets, size: 39)
            },
          },
          'Icone': Icon(
            Icons.pets,
            color: Colors.deepPurple[500],
            size: 39,
          )
        },
        'Brinquedos para gatos': {
          'CatName': 'Brinquedos para gatos',
          'Produtos': {
            'Rato de pelúcia': {
              'CatName': 'Rato de pelúcia',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'Nicho': {'CatName': 'Nicho', 'Icone': Icon(Icons.pets, size: 39)},
            'Arranhador': {
              'CatName': 'Arranhador',
              'Icone': Icon(Icons.pets, size: 39)
            },
            'Bola': {'CatName': 'Bola', 'Icone': Icon(Icons.pets, size: 39)},
          },
          'Icone': Icon(
            Icons.pets,
            color: Colors.grey[900],
            size: 39,
          )
        },
      }
    }
  },
  'Snacks': {
    'Chips': {
      'CatName': 'Chips',
      'Icone': Icon(Icons.food_bank, color: Colors.red[600], size: 39),
      'SubCategorias': {
        'Pringles': {
          'CatName': 'Pringles',
          'Icone': Icon(Icons.food_bank, color: Colors.blue[600], size: 39),
          'Produtos': {
            'Pringles Original': {
              'CatName': 'Pringles Original',
              'Icone':
                  Icon(Icons.food_bank, color: Colors.amber[500], size: 39),
            },
            'Pringles Creme e Cebola': {
              'CatName': 'Pringles Creme e Cebola',
              'Icone':
                  Icon(Icons.food_bank, color: Colors.amber[500], size: 39),
            },
            'Pringles BBQ': {
              'CatName': 'Pringles BBQ',
              'Icone':
                  Icon(Icons.food_bank, color: Colors.amber[500], size: 39),
            },
            'Pringles Cheddar e Bacon': {
              'CatName': 'Pringles Cheddar e Bacon',
              'Icone':
                  Icon(Icons.food_bank, color: Colors.amber[500], size: 39),
            },
          }
        },
        'Lays': {
          'CatName': 'Lays',
          'Icone': Icon(Icons.food_bank, color: Colors.green[600], size: 39),
          'Produtos': {
            'Lays Clássica': {
              'CatName': 'Lays Clássica',
              'Icone':
                  Icon(Icons.food_bank, color: Colors.yellow[800], size: 39),
            },
            'Lays Sour Cream': {
              'CatName': 'Lay Sour Creams',
              'Icone':
                  Icon(Icons.food_bank, color: Colors.green[600], size: 39),
            },
            'Lays Flaming Hot': {
              'CatName': 'Lays Flaming Hot',
              'Icone':
                  Icon(Icons.food_bank, color: Colors.purple[600], size: 39),
            },
            'Lays Salt & Vinegar': {
              'CatName': 'Lays Salt & Vinegar',
              'Icone': Icon(Icons.food_bank, color: Colors.blue[500], size: 39),
            },
          },
        },
        'Doritos': {
          'CatName': 'Doritos',
          'Icone': Icon(Icons.food_bank, color: Colors.green[900], size: 39),
          'Produtos': {
            'Doritos Tradicional': {
              'CatName': 'Doritos Tradicional',
              'Icone':
                  Icon(Icons.food_bank, color: Colors.green[800], size: 39),
            },
            'Doritos Wasabi': {
              'CatName': 'Doritos Wasabi',
              'Icone':
                  Icon(Icons.food_bank, color: Colors.green[700], size: 39),
            },
            'Doritos Sweet Chilli': {
              'CatName': 'Doritos Sweet Chilli',
              'Icone':
                  Icon(Icons.food_bank, color: Colors.green[600], size: 39),
            },
            'Doritos Queijo': {
              'CatName': 'Doritos Queijo',
              'Icone':
                  Icon(Icons.food_bank, color: Colors.green[500], size: 39),
            },
          },
        }
      }
    }
  }
};

Map<String, dynamic> categorias = {
  'Bebidas': {
    'CatName': 'Bebidas',
    'Icone': Icon(
      Icons.liquor,
      color: Color.fromRGBO(33, 20, 68, 1),
      size: 39,
    ),
  },
  'Pets': {
    'CatName': 'Pets',
    'Icone': Icon(
      Icons.pets,
      color: Color.fromRGBO(33, 20, 68, 1),
      size: 39,
    ),
  },
  'Snacks': {
    'CatName': 'Snacks',
    'Icone': Icon(
      Icons.food_bank,
      color: Color.fromRGBO(33, 20, 68, 1),
      size: 39,
    ),
  },
};

var posts = {
  'Lista Semanal': {
    'nome': 'Lista Semanal',
    'cart': [
      'Yogurte',
      'Detergente',
      'Pão',
      'Tomate',
      'Banana',
      'Queijo',
      'Presunto'
    ]
  },
  'Festa': {
    'nome': 'Festa',
    'cart': [
      'Coca-cola',
      'Jose Cuervo',
      'Pizza da Sadia',
    ]
  },
  'Picnic': {
    'nome': 'Picnic',
    'cart': [
      'Pao',
      'Queijo',
    ]
  }
};
