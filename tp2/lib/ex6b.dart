import 'package:flutter/material.dart';
import 'common.dart';

const imageURL = 'https://picsum.photos/512';

class Exercice6b extends StatefulWidget {
  const Exercice6b({Key? key}) : super(key: key);

  @override
  State<Exercice6b> createState() => _Exercice6bState();
}

class _Exercice6bState extends State<Exercice6b> {
  int n = 3;
  bool mustCreateTileList = true;
  late List<ColorTile> tileList;

  @override
  Widget build(BuildContext context) {
    if (mustCreateTileList) {
      tileList = createTileList();
      mustCreateTileList = false;
    }

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
              children: tileList.map((e) => e.getWidget()).toList(),
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
                          mustCreateTileList = true;
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

  List<ColorTile> createTileList() {
    //Construction de la liste des tiles
    List<ColorTile> tileList = [];
    for (int y = 0; y < n; y++) {
      for (int x = 0; x < n; x++) {
        tileList.add(
          ColorTile.randomColor(n * y + x),
        );
      }
    }
    tileList[randomInt(n * n)].isEmpty = true;
    return tileList;
  }
}
