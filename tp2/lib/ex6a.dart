import 'package:flutter/material.dart';
import 'dart:math' as math;

// ==============
// Models
// ==============

math.Random random = math.Random();

class Tile {
  late Color color;

  Tile(this.color);
  Tile.randomColor() {
    color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

// ==============
// Widgets
// ==============

class TileWidget extends StatelessWidget {
  final Tile tile;

  const TileWidget(this.tile, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return coloredBox();
  }

  Widget coloredBox() {
    return Container(
        color: tile.color,
        child: const Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}

void main() => runApp(MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles =
      List<Widget>.generate(2, (index) => TileWidget(Tile.randomColor()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.sentiment_very_satisfied),
          onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
