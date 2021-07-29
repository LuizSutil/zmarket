import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class Zappbar extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  _ZappbarState createState() => _ZappbarState();
}

class _ZappbarState extends State<Zappbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).accentColor,
      title: Text(
        'Ztelluz Market',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      actions: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.user.photoURL.toString()),
            ),
            IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                icon: Icon(Icons.logout)),
          ],
        ),
      ],
    );
  }
}
