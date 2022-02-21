import 'package:flutter/material.dart';

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({required this.imageURL, required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: alignment,
            widthFactor: 0.3333333333,
            heightFactor: 0.33333333333,
            child: Image.network(imageURL),
          ),
        ),
      ),
    );
  }
}

Tile tile =
    Tile(imageURL: 'https://picsum.photos/512', alignment: const Alignment(-1, 0));

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
                child: createTileWidgetFrom(tile))),
        Container(
            height: 200,
            child:
                Image.network('https://picsum.photos/512', fit: BoxFit.cover))
      ])),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      splashColor: Colors.blue,
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}
