import 'package:flutter/material.dart';
import 'common.dart';

class Exercice6a extends StatefulWidget {
  const Exercice6a({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Exercice6aState();
}

class Exercice6aState extends State<Exercice6a> {
  List<ColorTile> tiles =
      List<ColorTile>.generate(2, (index) => ColorTile.randomColor(index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2.5,
        crossAxisSpacing: 2.5,
        padding: const EdgeInsets.all(20.0),
        children: [tiles[0].getWidget(), tiles[1].getWidget()],
      ),
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
