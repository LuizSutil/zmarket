import 'package:Zmarket/deprecated/produto_model_deprecated.dart';
import 'package:Zmarket/models/listinha_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final user = FirebaseAuth.instance.currentUser!;

Future<List<ProdutoModelDep>> getAllProdutos(String route) async {
  DataSnapshot dataSnapshot = await databaseReference.child(route).once();
  List<ProdutoModelDep> produtos = [];
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      ProdutoModelDep produtoModel = createProdutoModelDep(value);
      //produtos.add(produtoModel);
      produtos.add(produtoModel);
    });
  }
  return produtos;
}

Future<dynamic> getCarrinho(String route) async {
  DataSnapshot dataSnapshot = await databaseReference.child(route).once();

  var teste;
  if (dataSnapshot.value != null) {
    teste = dataSnapshot.value;
  }
  return teste;
}

Future<void> sendPurchase(String route, carrinho) async {
  var _address = await getCarrinho('users/' + user.uid.toString() + '/Address');
  DateTime now = new DateTime.now();
  String convertedDateTime =
      "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

  Map<String, dynamic> _data = {
    convertedDateTime: {
      'Cart': carrinho['cart'],
      'Address': _address,
      'Delivered': false
    }
  };

  return databaseReference.child(route).set(_data);
}
