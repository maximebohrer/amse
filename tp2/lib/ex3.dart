import 'package:flutter/material.dart';
import 'package:tp2/ex1.dart';
import 'package:tp2/ex2.dart';
import 'package:tp2/ex4.dart';

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
      createExercice: () => DisplayTileWidget()),
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
