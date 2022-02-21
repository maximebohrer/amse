import 'package:flutter/material.dart';
import 'ex4.dart';

//====================

const imageURL = 'https://picsum.photos/512';

List<Widget> listTile = [
  Tile(imageURL: imageURL, n: 3, x: 0, y: 0).croppedImageTile(),
  Tile(imageURL: imageURL, n: 3, x: 1, y: 0).croppedImageTile(),
  Tile(imageURL: imageURL, n: 3, x: 2, y: 0).croppedImageTile(),
  Tile(imageURL: imageURL, n: 3, x: 0, y: 1).croppedImageTile(),
  Tile(imageURL: imageURL, n: 3, x: 1, y: 1).croppedImageTile(),
  Tile(imageURL: imageURL, n: 3, x: 2, y: 1).croppedImageTile(),
  Tile(imageURL: imageURL, n: 3, x: 0, y: 2).croppedImageTile(),
  Tile(imageURL: imageURL, n: 3, x: 1, y: 2).croppedImageTile(),
  Tile(imageURL: imageURL, n: 3, x: 2, y: 2).croppedImageTile(),
];

//====================

class Exercice5c extends StatefulWidget {
  const Exercice5c({Key? key}) : super(key: key);

  @override
  State<Exercice5c> createState() => _Exercice5cState();
}

class _Exercice5cState extends State<Exercice5c> {
  int n = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Example")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 2.5,
              crossAxisSpacing: 2.5,
              padding: const EdgeInsets.all(20.0),
              shrinkWrap: true,
              children: listTile,
            ),
          ],
        ),
      ),
    );
  }
}
