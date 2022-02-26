import 'package:flutter/material.dart';

class Exercice1 extends StatelessWidget {
  const Exercice1
({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Image(image: AssetImage("images/mouette.jpg"),),
      padding: const EdgeInsets.all(10),
    );
  }
}