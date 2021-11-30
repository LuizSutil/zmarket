import 'dart:ffi';

import 'package:Zmarket/deprecated/database.dart';
import 'package:Zmarket/login/auth.dart';
import 'package:Zmarket/widgets/z_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(widget.user.photoURL.toString()),
      ),
      ElevatedButton.icon(
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout(context);
          },
          icon: Icon(
            Icons.logout,
            color: Theme.of(context).colorScheme.secondary,
          ),
          label: Text(
            'Logout',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          )),
      ElevatedButton.icon(
          onPressed: () async {
            // var _x = await getCarrinho('users/' + widget.user.uid + '/Listas');
            // print(_x);
            print(widget.user);
          },
          icon: Icon(
            Icons.logout,
            color: Theme.of(context).colorScheme.secondary,
          ),
          label: Text(
            'userInfo log',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ))
    ])));
  }
}
