import 'package:flutter/material.dart';
import 'common.dart';

class Exercice5a extends StatelessWidget {
  const Exercice5a({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grille colorée"),
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
