import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorTile {
  late Color color;
  int number;
  static math.Random random = math.Random();

  ColorTile({required this.color, required this.number});

  ColorTile.randomColor(this.number) {
    color =
        HSVColor.fromAHSV(1, random.nextInt(360).toDouble(), 0.75, 1).toColor();
  }

  Widget getWidget() {
    return Container(
      child: Center(
          child: Text("$number",
              textAlign: TextAlign.center,
              textScaleFactor: 3,
              style: const TextStyle(fontWeight: FontWeight.bold))),
      color: color,
    );
  }
}

class Exercice5a extends StatelessWidget {
  const Exercice5a({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView Example (random colors)"),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2.5,
        crossAxisSpacing: 2.5,
        padding: const EdgeInsets.all(20.0),
        children: [
          ColorTile.randomColor(1).getWidget(),
          ColorTile.randomColor(2).getWidget(),
          ColorTile.randomColor(3).getWidget(),
          ColorTile.randomColor(4).getWidget(),
          ColorTile.randomColor(5).getWidget(),
          ColorTile.randomColor(6).getWidget(),
          ColorTile.randomColor(7).getWidget(),
          ColorTile.randomColor(8).getWidget(),
          ColorTile.randomColor(9).getWidget(),
        ],
      ),
    );
  }
}
