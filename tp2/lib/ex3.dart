import 'package:flutter/material.dart';
import 'package:tp2/ex1.dart';
import 'package:tp2/ex2.dart';

List<Type> l = [Exercice1, Exercice2, Exercice3];

class Exercice3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil"),
      ),
      body: Container(
        child: ListView(
          children: [
            MenuTile(title: "a", info: "b", createExercice: () => const Exercice1()),
            MenuTile(title: "a", info: "b", createExercice: () => const Exercice2()),
          ],
        ),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile(
      {Key? key, required this.title, required this.info, required this.createExercice})
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