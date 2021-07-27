import 'cat_box_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'addprod_listabtn.dart';
import 'listinha_model.dart';
import 'app_bar.dart';
import 'list_displayer.dart';
import 'categorias.dart';

class MyHomePage extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var text = '';
  var kat = 'Categorias';
  var subKat = '';

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
  };

  Future _showCriarLista() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          insetPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          title: new Text('Criar Lista Nova'),
          children: <Widget>[
            Padding(
              child: TextField(
                onChanged: (texto) {
                  text = texto;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome da lista',
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor)),
              ),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {
                  if (text != '') {
                    setState(() {
                      posts['$text'] = {'nome': '$text', 'cart': []};
                      Navigator.pop(context);
                    });
                  }
                },
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Icon(Icons.arrow_right),
                shape: CircleBorder(),
              ),
            )
          ],
        );
      },
    );
  }

  addlistmap(list, item) {
    List x = list as List;
    x.add(item);
    return x;
  }

  Future _showAddToLista(produto) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              insetPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              title: Text.rich(TextSpan(text: 'Adicionar', children: <TextSpan>[
                TextSpan(
                    text: ' $produto ',
                    style: TextStyle(color: Colors.purple[600])),
                TextSpan(text: 'a qual lista?')
              ])),
              children: <Widget>[
                ListaAddBtn(
                    listaNames: getAllListinhaNames(posts),
                    fun: (lista) {
                      posts['$lista']!['cart'] =
                          addlistmap(posts['$lista']!['cart'], produto);
                      setState(() {});
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: CustomScrollView(slivers: [
          Zappbar(),
          ListDisplay(getAllListinhas(posts), posts, () => setState(() {})),
          SliverList(
              delegate: SliverChildListDelegate([
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: MaterialButton(
                    onPressed: () {
                      _showCriarLista();
                    },
                    color: Color.fromRGBO(31, 192, 5, 1),
                    textColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      size: 50,
                    ),
                    shape: CircleBorder(),
                  ),
                ))
          ])),
          SliverList(
              delegate: SliverChildListDelegate([
            Divider(
              color: Color.fromRGBO(204, 51, 153, 1),
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
          ])),
          SliverToBoxAdapter(
            child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      subKat == '' ? kat = 'Categorias' : subKat = '';
                    });
                  },
                )),
          ),
          SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: Categorias(
                  func: (categoryName) {
                    setState(() {
                      kat == 'Categorias'
                          ? kat = categoryName.category
                          : subKat == ''
                              ? subKat = categoryName.category
                              : _showAddToLista(categoryName.category);
                    });
                  },
                  catboxes: kat == 'Categorias'
                      ? getAllCatBoxes(categorias)
                      : subKat == ''
                          ? getAllCatBoxes(categorias['$kat']['SubCategorias'])
                          : getAllCatBoxes(categorias['$kat']['SubCategorias']
                              ['$subKat']['Produtos']))),
        ]));
  }
}
