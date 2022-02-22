import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = math.Random();

// Ces classes sont utilisées dans les exercices. Il y a une classe pour les
// tiles de couleur et une classe pour les tiles d'image. Ce sont simplement
// des modèles de données, avec une méthode en plus qui construit le widget. Il
// n'y a pas de stateless widget à part car c'était plus simple à gérer dans le
// reste du code

class ColorTile {
  late Color color;
  int number = 0;
  bool isEmpty = false;

  ColorTile({required this.color, required this.number});

  ColorTile.randomColor(this.number) {
    color =
        HSVColor.fromAHSV(1, random.nextInt(360).toDouble(), 0.75, 1).toColor();
  }

  Widget getWidget({void Function()? onTap}) {
    if (isEmpty) return const SizedBox.shrink(); //empty widget
    return InkWell(
        child: Container(
          child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                '$number',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(85, 0, 0, 0)),
              )),
          padding: const EdgeInsets.all(10),
          color: color,
        ),
        onTap: onTap,
        splashColor: Colors.blue);
  }
}

// La classe des tiles images prend en argument le nombre n de cases sur une
// ligne, et les coordonnées x et y (de 0 à n-1) de la case, et calcule
// toute seule l'alignement.

class ImageTile {
  String imageURL = "";
  int x = 0;
  int y = 0;
  int n = 0;
  bool isEmpty = false;

  ImageTile(
      {required this.imageURL,
      required this.n,
      required this.x,
      required this.y});

  Widget getWidget([void Function()? onTap]) {
    if (isEmpty) return const SizedBox.shrink(); //empty widget
    return InkWell(
        child: FittedBox(
          fit: BoxFit.fill,
          child: ClipRect(
            child: Align(
              alignment: Alignment(2 * x / (n - 1) - 1, 2 * y / (n - 1) - 1),
              widthFactor: 1 / n,
              heightFactor: 1 / n,
              child: Image.network(imageURL),
            ),
          ),
        ),
        onTap: onTap,
        splashColor: Colors.blue);
  }
}

int randomInt(int max) {
  return random.nextInt(max);
}
