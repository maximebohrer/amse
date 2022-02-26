import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = math.Random();

// Ces classes sont utilisées dans les exercices. Il y a une classe pour les
// tiles de couleur et une classe pour les tiles d'image. Ce sont simplement
// des modèles de données, avec une méthode en plus qui construit le widget. Il
// n'y a pas de stateless widget à part car c'était plus simple à gérer dans le
// reste du code

abstract class Tile {
  /// Si true, la case est vide.
  bool isEmpty = false;

  /// L'index de la case
  int index = 0;

  /// Crée un widget représentant la tuile. [onTap] est la fonction à
  /// exécuter lors du clique sur le widget.
  Widget getWidget({void Function()? onTap});
}

class ColorTile extends Tile {
  late Color color;

  ColorTile({required this.color, required int index}) {
    super.index = index;
  }

  ColorTile.randomColor(int index) {
    color = HSVColor.fromAHSV(1, randomInt(360).toDouble(), 0.75, 1).toColor();
    super.index = index;
  }

  /// Crée un widget représentant la tuile. [onTap] est la fonction à
  /// exécuter lors du clique sur le widget.
  @override
  Widget getWidget({void Function()? onTap}) {
    if (isEmpty) return const SizedBox.shrink(); //widget vide
    return InkWell(
        child: Container(
          child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                '$index',
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
class ImageTile extends Tile {
  ImageProvider image;
  int x = 0;
  int y = 0;
  int n = 0;

  ImageTile({required this.image, required this.n, required int index}) {
    super.index = index;
    x = index % n; //coordonnée x de la case
    y = index ~/ n; //coordonnée y de la case
  }

  /// Crée un widget représentant la tuile. [onTap] est la fonction à
  /// exécuter lors du clique sur le widget.
  @override
  Widget getWidget({void Function()? onTap}) {
    if (isEmpty) return const SizedBox.shrink(); //widget vide
    return InkWell(
        child: FittedBox(
          fit: BoxFit.fill,
          child: ClipRect(
            child: Align(
              alignment: Alignment(2 * x / (n - 1) - 1, 2 * y / (n - 1) - 1),
              widthFactor: 1 / n,
              heightFactor: 1 / n,
              child: Image(image: image),
            ),
          ),
        ),
        onTap: onTap,
        splashColor: Colors.blue);
  }
}

/// Retourne un nombre aléatoire entre 0 inclus et [max] exlu.
int randomInt(int max) {
  return random.nextInt(max);
}

/// Inverse les éléments d'indices [index1] et [index2] dans [list].
void switchElements(List list, int index1, int index2) {
  var temp = list[index2];
  list[index2] = list[index1];
  list[index1] = temp;
}
