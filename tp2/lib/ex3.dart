import 'package:flutter/material.dart';
import 'package:tp2/ex1.dart';
import 'package:tp2/ex2.dart';
import 'package:tp2/ex4.dart';
import 'package:tp2/ex5a.dart';
import 'package:tp2/ex5b.dart';
import 'package:tp2/ex5c.dart';
import 'package:tp2/ex6a.dart';
import 'ex6b.dart';

//==========================

List<MenuTile> listExercice = [
  MenuTile(
      title: "Exercice 1",
      info: "Affichage d'une image aléatoire",
      createExercice: () => const Exercice1()),
  MenuTile(
      title: "Exercice 2",
      info: "Rotate & scale image",
      createExercice: () => const Exercice2()),
  MenuTile(
      title: "Exercice 4",
      info: "Display a tile",
      createExercice: () => const Exercice4()),
  MenuTile(
      title: "Exercice 5a",
      info: "Grid of colored boxes",
      createExercice: () => const Exercice5a()),
  MenuTile(
      title: "Exercice 5b",
      info: "Fixed grid of cropped images",
      createExercice: () => const Exercice5b()),
  MenuTile(
      title: "Exercice 5c",
      info: "Configurable Taquin Board",
      createExercice: () => const Exercice5c()),
  MenuTile(
      title: "Exercice 6a",
      info: "Moving Tiles",
      createExercice: () => const Exercice6a()),
  MenuTile(
      title: "Exercice 6b",
      info: "Moving Tiles in Grid",
      createExercice: () => const Exercice6b()),
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
