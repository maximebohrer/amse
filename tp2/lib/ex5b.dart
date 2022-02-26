import 'package:flutter/material.dart';
import 'common.dart';

const ImageProvider image = AssetImage("images/mouette.jpg");

class Exercice5b extends StatelessWidget {
  const Exercice5b({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grille d'images"),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2.5,
        crossAxisSpacing: 2.5,
        padding: const EdgeInsets.all(20.0),
        children: [
          ImageTile(image: image, n: 3, index: 0).getWidget(),
          ImageTile(image: image, n: 3, index: 1).getWidget(),
          ImageTile(image: image, n: 3, index: 2).getWidget(),
          ImageTile(image: image, n: 3, index: 3).getWidget(),
          ImageTile(image: image, n: 3, index: 4).getWidget(),
          ImageTile(image: image, n: 3, index: 5).getWidget(),
          ImageTile(image: image, n: 3, index: 6).getWidget(),
          ImageTile(image: image, n: 3, index: 7).getWidget(),
          ImageTile(image: image, n: 3, index: 8).getWidget(),
        ],
      ),
    );
  }
}
