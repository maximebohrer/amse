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
  late int blankIndex;
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
              children: tileList
                  .map((e) => e.getWidget(onTap: () {
                        setState(() {
                          moveToBlank(tileList.indexOf(e), Direction.all);
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

  bool moveToBlank(int i, Direction d) {
    bool directionFound = false;
    if ((d == Direction.up || d == Direction.all) && !directionFound) {
      //i-n est l'indice de la case en haut de i
      if ((i - n) >= 0 && !tileList[i - n].isEmpty) {
        moveToBlank(i - n, Direction.up); //La fonction est récursive pour permettre de bouger plusieurs cases d'un coup
      }
      if ((i - n) >= 0 && tileList[i - n].isEmpty) {
        switchElements(tileList, i, i - n);
        return true;
      }
    }
    if ((d == Direction.down || d == Direction.all) && !directionFound) {
      //i+n est l'indice de la case en bas de i
      if ((i + n) < n * n && !tileList[i + n].isEmpty) {
        moveToBlank(i + n, Direction.down);
      }
      if ((i + n) < n * n && tileList[i + n].isEmpty) {
        switchElements(tileList, i, i + n);
        return true;
      }
    }
    if ((d == Direction.left || d == Direction.all) && !directionFound) {
      //i-1 est l'indice de la case à gauche de i si i%n > 0
      if ((i % n) > 0 && !tileList[i - 1].isEmpty) {
        moveToBlank(i - 1, Direction.left);
      }
      if ((i % n) > 0 && tileList[i - 1].isEmpty) {
        switchElements(tileList, i, i - 1);
        return true;
      }
    }
    if ((d == Direction.right || d == Direction.all) && !directionFound) {
      //i+1 est l'indice de la case à gauche de i si (i+1)%n > 0
      if (((i + 1) % n) > 0 && !tileList[i + 1].isEmpty) {
        moveToBlank(i + 1, Direction.right);
      }
      if (((i + 1) % n) > 0 && tileList[i + 1].isEmpty) {
        switchElements(tileList, i, i + 1);
        return true;
      }
    }
    return false;
  }

  void switchElements(List list, int index1, int index2) {
    var temp = list[index2];
    list[index2] = list[index1];
    list[index1] = temp;
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
    blankIndex = randomInt(n * n);
    tileList[blankIndex].isEmpty = true;
    return tileList;
  }
}

enum Direction { all, up, down, left, right }
