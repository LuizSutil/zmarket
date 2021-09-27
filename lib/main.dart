import 'package:Zmarket/login/auth.dart';
import 'package:Zmarket/login/streamer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Z_Market',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: Color.fromRGBO(33, 20, 68, 1),
                primary: Color.fromRGBO(239, 234, 232, 1))),
        home: StreamerPage(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ));
}
