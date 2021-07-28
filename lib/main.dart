import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:provider/provider.dart';
import 'streamer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Z_Market',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(239, 234, 232, 1),
            accentColor: Color.fromRGBO(33, 20, 68, 1)),
        home: StreamerPage(),
      ));
}
