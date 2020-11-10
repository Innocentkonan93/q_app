import 'package:flutter/material.dart';
import 'package:q_app/geo.dart';
import 'package:q_app/screens/Accueil.dart';
import 'package:q_app/screens/connexion/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Popins',
          primaryColor: Colors.redAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: Colors.redAccent),
      home: LoginPage(),
    );
  }
}
