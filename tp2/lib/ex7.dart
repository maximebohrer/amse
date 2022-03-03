import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'common.dart';

List<String> difficultyNames = [
  "Bébé",
  "Facile",
  "Moyen",
  "Difficile",
  "Expert"
];

class Exercice7 extends StatefulWidget {
  const Exercice7({Key? key}) : super(key: key);

  @override
  State<Exercice7> createState() => _Exercice7State();
}

class _Exercice7State extends State<Exercice7> {
  int n = 4;
  late int blankIndex;
  bool mustReset = true;
  late List<Tile> tileList;
  List<List<int>> moves = [];
  GameState gameState = GameState.stopped;
  int difficulty = 2;
  bool useColorTiles = false;
  ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    if (mustReset) {
      reset();
      mustReset = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Taquin"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //GridView =========================================================
            GridView.count(
              crossAxisCount: n,
              mainAxisSpacing: 2.5,
              crossAxisSpacing: 2.5,
              padding: const EdgeInsets.all(20.0),
              shrinkWrap: true,
              children: tileList
                  .map((e) => e.getWidget(onTap: () {
                        if (gameState == GameState.running) {
                          setState(() {
                            moveToBlank(tileList.indexOf(e));
                            if (inOrder()) {
                              victory();
                            }
                          });
                        }
                      }))
                  .toList(),
            ),

            //Bouton choix d'image =============================================
            if (gameState == GameState.stopped)
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) {
                          return ImageSelector(
                            imagePickedCallback: (ImageProvider? img) {
                              setState(() {
                                image = img;
                                reset();
                              });
                            },
                          );
                        },
                      ),
                    );
                  },
                  child: const Text("Choisir une image"),
                ),
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              ),

            //Nombre de coups et bouton annuler ================================
            if (gameState == GameState.running)
              Container(
                child: Row(
                  children: [
                    Text('Nombre de coups : ' + moves.length.toString()),
                    ElevatedButton(
                      onPressed: moves.isEmpty
                          ? null
                          : () {
                              setState(() {
                                cancelLastMove();
                              });
                            },
                      child: const Text('Annuler un coup'),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                padding: const EdgeInsets.all(10),
              ),

            //Gagné ============================================================
            if (gameState == GameState.finished)
              Container(
                child: const Text(
                  "C'est gagné !",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                padding: const EdgeInsets.all(10),
              ),
            if (gameState == GameState.finished)
              Container(
                child: Text("en " + moves.length.toString() + " coups."),
                padding: const EdgeInsets.all(10),
              ),

            //Difficulté =======================================================
            if (gameState == GameState.stopped)
              Container(
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            difficulty = (difficulty - 1) % 5;
                          });
                        },
                        child: const Icon(Icons.arrow_left)),
                    Text('Difficulté : ' + difficultyNames[difficulty]),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          difficulty = (difficulty + 1) % 5;
                        });
                      },
                      child: const Icon(Icons.arrow_right),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              ),

            //Taille ===========================================================
            if (gameState == GameState.stopped)
              Container(
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            n = (n - 3) % 7 + 2;
                            reset();
                          });
                        },
                        child: const Icon(Icons.arrow_left)),
                    Text('Taille : ' + n.toString()),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          n = (n - 1) % 7 + 2;
                          reset();
                        });
                      },
                      child: const Icon(Icons.arrow_right),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              ),

            //Bouton start / stop ==============================================
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (gameState == GameState.stopped) {
                      start();
                    } else {
                      reset();
                    }
                  });
                },
                child: Text(gameState == GameState.stopped
                    ? "Commencer"
                    : gameState == GameState.running
                        ? "Arrêter"
                        : "Recommencer"),
              ),
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            ),
          ],
        ),
      ),
    );
  }

  /// Arrête et réinitialise la partie
  void reset() {
    //Construction de la liste des tiles
    tileList = [];
    for (int y = 0; y < n; y++) {
      for (int x = 0; x < n; x++) {
        tileList.add(
          image == null
              ? ColorTile.randomColor(n * y + x)
              : ImageTile(image: image!, n: n, index: n * y + x),
        );
      }
    }
    blankIndex = randomInt(n * n);
    tileList[blankIndex].isEmpty = true;
    moves = [];
    gameState = GameState.stopped;
  }

  /// Mélange les cases et commance la partie
  void start() {
    int moveNumber = 2 * n * n * (difficulty + 1);
    for (int i = 0; i < moveNumber; i++) {
      int random = randomInt(4);
      //idem que moveToBlank sauf que c'est la case vide qu'on "déplace"
      if (random == 0 && blankIndex - n >= 0) {
        switchElements(tileList, blankIndex, blankIndex - n);
        blankIndex -= n;
      } else if (random == 1 && blankIndex + n < n * n) {
        switchElements(tileList, blankIndex, blankIndex + n);
        blankIndex += n;
      } else if (random == 2 && blankIndex % n > 0) {
        switchElements(tileList, blankIndex, blankIndex - 1);
        blankIndex -= 1;
      } else if (random == 3 && (blankIndex + 1) % n > 0) {
        switchElements(tileList, blankIndex, blankIndex + 1);
        blankIndex += 1;
      }
    }
    if (inOrder()) {
      //si par hasard les cases ne sont pas mélangées on refait
      start();
    } else {
      gameState = GameState.running;
    }
  }

  /// Victoire
  void victory() {
    //on affiche l'image en entier
    tileList[blankIndex].isEmpty = false;
    gameState = GameState.finished;
  }

  /// Retourne true si toutes les cases sont à la bonne place
  bool inOrder() {
    for (int i = 0; i < n * n; i++) {
      if (tileList[i].index != i) return false;
    }
    return true;
  }

  /// Déplace la case d'indice [i] vers la case vide.
  void moveToBlank(int i) {
    //i-n est l'indice de la case en haut de i
    if (i - n >= 0 && tileList[i - n].isEmpty) {
      switchElements(tileList, i, i - n);
      moves.add([i, i - n]);
    }
    //i+n est l'indice de la case en bas de i
    else if (i + n < n * n && tileList[i + n].isEmpty) {
      switchElements(tileList, i, i + n);
      moves.add([i, i + n]);
    }
    //i-1 est l'indice de la case à gauche de i si i%n > 0
    else if (i % n > 0 && tileList[i - 1].isEmpty) {
      switchElements(tileList, i, i - 1);
      moves.add([i, i - 1]);
    }
    //i+1 est l'indice de la case à gauche de i si (i+1)%n > 0
    else if ((i + 1) % n > 0 && tileList[i + 1].isEmpty) {
      switchElements(tileList, i, i + 1);
      moves.add([i, i + 1]);
    }
    blankIndex = i;
  }

  void cancelLastMove() {
    if (moves.isNotEmpty) {
      switchElements(tileList, moves.last[0], moves.last[1]);
      moves.removeLast();
    }
  }
}

enum GameState { stopped, running, finished }

//==============================================================================

class ImageSelector extends StatelessWidget {
  final Function imagePickedCallback;
  const ImageSelector({Key? key, required this.imagePickedCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choisir une image"),
        centerTitle: true,
      ),
      body: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 2.5,
          crossAxisSpacing: 2.5,
          padding: const EdgeInsets.all(20.0),
          shrinkWrap: true,
          children: [
            useColorTiles(context),
            useGalleryImage(context),
            useCameraImage(context),
            usePresetImage(
                const NetworkImage('https://picsum.photos/512'), context),
            usePresetImage(const AssetImage('images/joconde.jpg'), context),
            usePresetImage(const AssetImage('images/fleur.jpg'), context),
            usePresetImage(const AssetImage("images/city.jpg"), context),
            usePresetImage(const AssetImage('images/einstein.jpg'), context),
            usePresetImage(const AssetImage('images/stary_night.jpg'), context),
            usePresetImage(const AssetImage("images/dog.jpg"), context),
            usePresetImage(const AssetImage('images/tour_eiffel.jpg'), context),
            usePresetImage(const AssetImage("images/mouette.jpg"), context),
            usePresetImage(const AssetImage("images/lenna.png"), context),
            usePresetImage(const AssetImage("images/shanghai.jpg"), context),
            usePresetImage(const AssetImage("images/scream.jpg"), context),
          ]),
    );
  }

  Widget usePresetImage(ImageProvider image, BuildContext context) {
    return InkWell(
        child: Image(image: image),
        onTap: () {
          imagePickedCallback(image);
          Navigator.pop(context);
        },
        splashColor: Colors.blue);
  }

  Widget useColorTiles(BuildContext context) {
    return InkWell(
        child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 2.5,
            crossAxisSpacing: 2.5,
            shrinkWrap: true,
            children: [
              ColorTile(color: Colors.red, index: 0).getWidget(),
              ColorTile(color: Colors.green, index: 1).getWidget(),
              ColorTile(color: Colors.blue, index: 2).getWidget(),
              ColorTile(color: Colors.yellow, index: 3).getWidget()
            ]),
        onTap: () {
          imagePickedCallback(null);
          Navigator.pop(context);
        });
  }

  Widget useGalleryImage(BuildContext context) {
    return InkWell(
        child: Container(
          child: const Icon(
            Icons.image,
            color: Colors.white,
            size: 50,
          ),
          color: Colors.black45,
        ),
        onTap: () {
          getFromGallery(context);
        });
  }

  Widget useCameraImage(BuildContext context) {
    return InkWell(
        child: Container(
          child: const Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 50,
          ),
          color: Colors.black45,
        ),
        onTap: () {
          getFromCamera(context);
        });
  }

  getFromGallery(BuildContext context) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imagePickedCallback(FileImage(File(pickedFile.path)));
      Navigator.pop(context);
    }
  }

  getFromCamera(BuildContext context) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imagePickedCallback(FileImage(File(pickedFile.path)));
      Navigator.pop(context);
    }
  }
}
