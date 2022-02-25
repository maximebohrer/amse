import 'package:flutter/material.dart';
import 'common.dart';

const ImageProvider image = NetworkImage('https://picsum.photos/512');

class Exercice5b extends StatelessWidget {
  const Exercice5b({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Taquin board"),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2.5,
        crossAxisSpacing: 2.5,
        padding: const EdgeInsets.all(20.0),
        children: [
          ImageTile(image: image, n: 3, x: 0, y: 0).getWidget(),
          ImageTile(image: image, n: 3, x: 1, y: 0).getWidget(),
          ImageTile(image: image, n: 3, x: 2, y: 0).getWidget(),
          ImageTile(image: image, n: 3, x: 0, y: 1).getWidget(),
          ImageTile(image: image, n: 3, x: 1, y: 1).getWidget(),
          ImageTile(image: image, n: 3, x: 2, y: 1).getWidget(),
          ImageTile(image: image, n: 3, x: 0, y: 2).getWidget(),
          ImageTile(image: image, n: 3, x: 1, y: 2).getWidget(),
          ImageTile(image: image, n: 3, x: 2, y: 2).getWidget(),
        ],
      ),
    );
  }
}
