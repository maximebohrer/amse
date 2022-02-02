import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as vec_math;

// class Exercice2 extends StatelessWidget {
//   Exercice2({Key? key}) : super(key: key);

//   int rotationX = 0;

//   @override
//   Widget build(BuildContext context) {
// return Container(
//   child: const Image(
//     image: NetworkImage("https://picsum.photos/512/1024"),
//   ),
//   padding: const EdgeInsets.all(5),
//   clipBehavior: Clip.hardEdge,
//   decoration: const BoxDecoration(color: Colors.white),
// );
//   }
// }

class Exercice2 extends StatefulWidget {
  const Exercice2({Key? key}) : super(key: key);

  @override
  _Exercice2State createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
  double rotX = 0;
  double rotZ = 0;
  bool mirror = false;
  double scale = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..scale(scale)
          ..rotateX(rotX)
          ..rotateY(rotZ),
        child: const Image(
          image: NetworkImage("https://picsum.photos/512/1024"),
        ),
      ),
      padding: const EdgeInsets.all(5),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(color: Colors.white),
    );
  }
}
