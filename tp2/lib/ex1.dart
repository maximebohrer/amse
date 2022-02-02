import 'package:flutter/material.dart';

class Exercice1 extends StatelessWidget {
  const Exercice1
({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Image(image: NetworkImage("https://picsum.photos/512/1024"),),
      padding: const EdgeInsets.all(10),
    );
  }
}