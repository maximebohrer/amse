import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exercice5 extends StatelessWidget {
  const Exercice5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Example")),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        padding: const EdgeInsets.all(20.0),
        children: [
          Container(
            child: const Text("He'd have you all unravel at the"),
            color: Colors.teal[100],
          ),
          Container(
            child: const Text('Heed not the rabble'),
            color: Colors.teal[200],
          ),
          Container(
            child: const Text('Sound of screams but the'),
            color: Colors.teal[300],
          ),
          Container(
            child: const Text('Who scream'),
            color: Colors.teal[400],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution is coming...'),
            color: Colors.teal[500],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Colors.teal[600],
          ),
        ],
      ),
    );
  }
}
