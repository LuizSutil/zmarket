import 'package:firebase_database/firebase_database.dart';
import 'posts.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference savePost(Post post) {
  var id = databaseReference.child('posts/').push();
  id.set(post);
  return id;
}
