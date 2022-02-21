import 'package:flutter/material.dart';
import 'ex4.dart';

const imageURL = 'https://picsum.photos/512';

class Exercice5b extends StatelessWidget {
  const Exercice5b({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Example")),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        padding: const EdgeInsets.all(5.0),
        children: [
          Tile(imageURL: imageURL, alignment: const Alignment(-1, -1))
              .croppedImageTile(),
          Tile(imageURL: imageURL, alignment: const Alignment(0, -1))
              .croppedImageTile(),
          Tile(imageURL: imageURL, alignment: const Alignment(1, -1))
              .croppedImageTile(),
          Tile(imageURL: imageURL, alignment: const Alignment(-1, 0))
              .croppedImageTile(),
          Tile(imageURL: imageURL, alignment: const Alignment(0, 0))
              .croppedImageTile(),
          Tile(imageURL: imageURL, alignment: const Alignment(1, 0))
              .croppedImageTile(),
          Tile(imageURL: imageURL, alignment: const Alignment(-1, 1))
              .croppedImageTile(),
          Tile(imageURL: imageURL, alignment: const Alignment(0, 1))
              .croppedImageTile(),
          Tile(imageURL: imageURL, alignment: const Alignment(1, 1))
              .croppedImageTile(),
        ],
      ),
    );
  }
}
