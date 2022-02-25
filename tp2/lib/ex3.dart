import 'package:flutter/material.dart';
import 'ex1.dart';
import 'ex2.dart';
import 'ex4.dart';
import 'ex5a.dart';
import 'ex5b.dart';
import 'ex5c.dart';
import 'ex6a.dart';
import 'ex6b.dart';
import 'ex7.dart';

//==========================

List<MenuTile> listExercice = [
  MenuTile(
      title: "Exercice 1",
      info: "Affichage d'une image",
      createExercice: () => const Exercice1()),
  MenuTile(
      title: "Exercice 2",
      info: "Transformations sur une image",
      createExercice: () => const Exercice2()),
  MenuTile(
      title: "Exercice 4",
      info: "Affichage d'une partie d'une image",
      createExercice: () => const Exercice4()),
  MenuTile(
      title: "Exercice 5a",
      info: "Grille fixe de cases colorées",
      createExercice: () => const Exercice5a()),
  MenuTile(
      title: "Exercice 5b",
      info: "Grille fixe de cases d'images",
      createExercice: () => const Exercice5b()),
  MenuTile(
      title: "Exercice 5c",
      info: "Grille réglable de cases d'images",
      createExercice: () => const Exercice5c()),
  MenuTile(
      title: "Exercice 6a",
      info: "Deux cases déplaçables",
      createExercice: () => const Exercice6a()),
  MenuTile(
      title: "Exercice 6b",
      info: "Grille de cases colorées déplaçables",
      createExercice: () => const Exercice6b()),
  MenuTile(
      title: "Exercice 7",
      info: "Jeu de taquin",
      createExercice: () => const Exercice7()),
];

//===========================

class Exercice3 extends StatelessWidget {
  const Exercice3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TP2"),
      ),
      body: ListView(
        children: listExercice,
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile(
      {Key? key,
      required this.title,
      required this.info,
      required this.createExercice})
      : super(key: key);
  final String title;
  final String info;
  final Function createExercice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          onTapMenuTile(context);
        },
        child: ListTile(
          title: Text(title),
          subtitle: Text(info),
          trailing: const Icon(Icons.arrow_right),
        ),
      ),
    );
  }

  void onTapMenuTile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return createExercice();
        },
      ),
    );
  }
}
