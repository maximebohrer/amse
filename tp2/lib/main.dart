import 'package:flutter/material.dart';
import 'ex3.dart';
//import 'ex7.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taquin',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Exercice3(),
//      home: const Exercice7(),
    );
  }
}
