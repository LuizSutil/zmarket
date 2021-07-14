import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_1/auth.dart';
import 'posts.dart';
import 'postList.dart';
import 'textInputWidget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  final String name;
  MyHomePage(this.name);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts
          .add(new Post(text, widget.user.displayName!, widget.user.photoURL!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ztelluz Market '),
        actions: [
          IconButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(children: <Widget>[
        Expanded(child: PostList(this.posts)),
        TextInputWidget(this.newPost)
      ]),
    );
  }
}
