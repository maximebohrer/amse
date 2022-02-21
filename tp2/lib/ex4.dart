import 'package:flutter/material.dart';

// Cette classe prend argument le nombre n de cases sur une ligne,
// et les coordonnées x et y (de 0 à n-1) de la case, et calcule
// toute seule l'alignement.

class Tile {
  String imageURL;
  int x;
  int y;
  int n;

  Tile(
      {required this.imageURL,
      required this.n,
      required this.x,
      required this.y});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Align(
          alignment: Alignment(2 * x / (n-1) - 1, 2 * y / (n-1) - 1),
          widthFactor: 1 / n,
          heightFactor: 1 / n,
          child: Image.network(imageURL),
        ),
      ),
    );
  }

  Widget getWidget(void Function()? onTap) {
    return InkWell(
        child: tile.croppedImageTile(), splashColor: Colors.blue, onTap: onTap);
  }
}

Tile tile = Tile(imageURL: 'https://picsum.photos/512', n: 3, x: 1, y: 1);

class DisplayTileWidget extends StatelessWidget {
  const DisplayTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: const EdgeInsets.all(20.0),
                child: tile.getWidget(() {
                  print("tapped on tile");
                }))),
        SizedBox(
            height: 200,
            child:
                Image.network('https://picsum.photos/512', fit: BoxFit.cover))
      ])),
    );
  }
}
