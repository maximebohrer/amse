import 'package:flutter/material.dart';
import 'common.dart';

class Exercice6b extends StatefulWidget {
  const Exercice6b({Key? key}) : super(key: key);

  @override
  State<Exercice6b> createState() => _Exercice6bState();
}

class _Exercice6bState extends State<Exercice6b> {
  int n = 3;
  bool mustReset = true;
  late List<Tile> tileList;

  @override
  Widget build(BuildContext context) {
    if (mustReset) {
      tileList = reset();
      mustReset = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Grille colorée"),
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
              children: tileList
                  .map((e) => e.getWidget(onTap: () {
                        setState(() {
                          moveToBlank(tileList.indexOf(e));
                        });
                      }))
                  .toList(),
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
                          mustReset = true;
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

  List<Tile> reset() {
    //Construction de la liste des tiles
    List<Tile> tileList = [];
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

  /// Déplace la case d'incide [i] vers la case vide.
  void moveToBlank(int i) {
    //i-n est l'indice de la case en haut de i
    if ((i - n) >= 0 && tileList[i - n].isEmpty) {
      switchElements(tileList, i, i - n);
    }
    //i+n est l'indice de la case en bas de i
    else if ((i + n) < n * n && tileList[i + n].isEmpty) {
      switchElements(tileList, i, i + n);
    }
    //i-1 est l'indice de la case à gauche de i si i%n > 0
    else if ((i % n) > 0 && tileList[i - 1].isEmpty) {
      switchElements(tileList, i, i - 1);
    }
    //i+1 est l'indice de la case à gauche de i si (i+1)%n > 0
    else if (((i + 1) % n) > 0 && tileList[i + 1].isEmpty) {
      switchElements(tileList, i, i + 1);
    }
  }
}
