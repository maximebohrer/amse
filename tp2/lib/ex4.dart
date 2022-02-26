import 'package:flutter/material.dart';
import 'common.dart';

Tile tile = ImageTile(image: const AssetImage("images/mouette.jpg"), n: 3, index: 4);

class Exercice4 extends StatelessWidget {
  const Exercice4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Affichage et rognage d'image"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: const EdgeInsets.all(20.0),
                child: tile.getWidget(onTap: () {
                  print("tapped on tile");
                }))),
        const SizedBox(
            height: 200,
            child:
                Image(image: AssetImage("images/mouette.jpg"), fit: BoxFit.cover))
      ])),
    );
  }
}
