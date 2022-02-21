import 'package:flutter/material.dart';
import 'ex4.dart';

//====================

const String imageURL = 'https://picsum.photos/512';
const int n = 3; //Nombre de Tile sur une ligne

List<Widget> listTile = [
  Tile(imageURL: imageURL, n: n, x: 0, y: 0).croppedImageTile(),
  Tile(imageURL: imageURL, n: n, x: 1, y: 0).croppedImageTile(),
  Tile(imageURL: imageURL, n: n, x: 2, y: 0).croppedImageTile(),
  Tile(imageURL: imageURL, n: n, x: 0, y: 1).croppedImageTile(),
  Tile(imageURL: imageURL, n: n, x: 1, y: 1).croppedImageTile(),
  Tile(imageURL: imageURL, n: n, x: 2, y: 1).croppedImageTile(),
  Tile(imageURL: imageURL, n: n, x: 0, y: 2).croppedImageTile(),
  Tile(imageURL: imageURL, n: n, x: 1, y: 2).croppedImageTile(),
  Tile(imageURL: imageURL, n: n, x: 2, y: 2).croppedImageTile(),
];

//====================

class Exercice5b extends StatelessWidget {
  const Exercice5b({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView Example"),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: n,
        mainAxisSpacing: 2.5,
        crossAxisSpacing: 2.5,
        padding: const EdgeInsets.all(20.0),
        children: listTile,
      ),
    );
  }
}
