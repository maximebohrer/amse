import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exercice5b extends StatelessWidget {
  const Exercice5b({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    math.Random random = math.Random();
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Example (random colors)")),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        padding: const EdgeInsets.all(20.0),
        children: [
          Container(
            child: const Center(
                child: Text("1",
                    textAlign: TextAlign.center,
                    textScaleFactor: 7,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            color: HSVColor.fromAHSV(1, random.nextInt(360).toDouble(), 0.75, 1).toColor(),
          ),
          Container(
            child: const Center(
                child: Text("2",
                    textAlign: TextAlign.center,
                    textScaleFactor: 7,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            color: HSVColor.fromAHSV(1, random.nextInt(360).toDouble(), 0.75, 1).toColor(),
          ),
          Container(
            child: const Center(
                child: Text("3",
                    textAlign: TextAlign.center,
                    textScaleFactor: 7,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            color: HSVColor.fromAHSV(1, random.nextInt(360).toDouble(), 0.75, 1).toColor(),
          ),
          Container(
            child: const Center(
                child: Text("4",
                    textAlign: TextAlign.center,
                    textScaleFactor: 7,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            color: HSVColor.fromAHSV(1, random.nextInt(360).toDouble(), 0.75, 1).toColor(),
          ),
          Container(
            child: const Center(
                child: Text("5",
                    textAlign: TextAlign.center,
                    textScaleFactor: 7,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            color: HSVColor.fromAHSV(1, random.nextInt(360).toDouble(), 0.75, 1).toColor(),
          ),
          Container(
            child: const Center(
                child: Text("6",
                    textAlign: TextAlign.center,
                    textScaleFactor: 7,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            color: HSVColor.fromAHSV(1, random.nextInt(360).toDouble(), 0.75, 1).toColor(),
          ),
          Container(
            child: const Center(
                child: Text("7",
                    textAlign: TextAlign.center,
                    textScaleFactor: 7,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            color: HSVColor.fromAHSV(1, random.nextInt(360).toDouble(), 0.75, 1).toColor(),
          ),
          Container(
            child: const Center(
                child: Text("8",
                    textAlign: TextAlign.center,
                    textScaleFactor: 7,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            color: HSVColor.fromAHSV(1, random.nextInt(360).toDouble(), 0.75, 1).toColor(),
          ),
          Container(
            child: const Center(
                child: Text("9",
                    textAlign: TextAlign.center,
                    textScaleFactor: 7,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            color: HSVColor.fromAHSV(1, random.nextInt(360).toDouble(), 0.75, 1).toColor(),
          ),
        ],
      ),
    );
  }
}
