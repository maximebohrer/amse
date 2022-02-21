import 'package:flutter/material.dart';
import 'ex4.dart';

const imageURL = 'https://picsum.photos/512';

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
      appBar: AppBar(
        title: const Text("Taquin board"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //GridView
            GridView.count(
              crossAxisCount: n,
              mainAxisSpacing: 2.5,
              crossAxisSpacing: 2.5,
              padding: const EdgeInsets.all(20.0),
              shrinkWrap: true,
              children: createTileList(),
            ),

            //Slider n
            Container(
              child: Row(
                children: [
                  const Text("Taille :"),
                  Expanded(
                    child: Slider(
                      value: n.toDouble(),
                      min: 2,
                      max: 10,
                      divisions: 8,
                      label: n.toString(),
                      onChanged: (double value) {
                        setState(() {
                          n = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createTileList() {
    //Construction de la liste des tiles
    List<Widget> tileList = [];
    for (int y = 0; y < n; y++) {
      for (int x = 0; x < n; x++) {
        tileList.add(
          Tile(imageURL: imageURL, n: n, x: x, y: y).croppedImageTile(),
        );
      }
    }
    return tileList;
  }
}
