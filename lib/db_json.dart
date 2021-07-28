import 'package:flutter/material.dart';

Map<String, dynamic> categorias = {
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
      'Cervejas Seleção Nacional': {
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
        'Icone': Icon(Icons.local_bar, color: Colors.blueAccent[300], size: 39)
      },
      'Cachaça': {
        'CatName': 'Cachaça',
        'Produtos': {
          'Caninha': {
            'CatName': 'Caninha',
            'Icone': Icon(Icons.local_bar, size: 39)
          }
        },
        'Icone': Icon(Icons.local_bar, color: Colors.deepOrange[900], size: 39)
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
      '"Sal"',
      'Coquinha',
      'Gudang(importado)',
      'Pizza da Sadia',
      'abluble',
      'zzz',
      'qweqwe',
      'doinsodf',
      'pppppp',
      'dkfoaskf'
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
