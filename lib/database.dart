import 'package:Zmarket/produtos/produto_class.dart';
import 'package:firebase_database/firebase_database.dart';
import 'posts.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference savePost(Post post) {
  var id = databaseReference.child('posts/').push();
  id.set(post);
  return id;
}

Future<List<ProdutoModel>> getAllProdutos(String route) async {
  DataSnapshot dataSnapshot = await databaseReference.child(route).once();
  List<ProdutoModel> produtos = [];
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      ProdutoModel produtoModel = createProdutoModel(value);
      //produtos.add(produtoModel);
      produtos.add(produtoModel);
    });
  }
  return produtos;
}
