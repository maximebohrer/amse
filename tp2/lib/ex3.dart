import 'package:flutter/material.dart';
import 'package:tp2/ex1.dart';
import 'package:tp2/ex2.dart';

class Exercice3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil"),
      ),
      body: Container(
        child: ListView(
          children: const [
            MenuTile(title: "a", info: "b", exercice: Exercice1()),
            MenuTile(title: "a", info: "b", exercice: Exercice2()),
          ],
        ),
      ),
    );
  }
}

class MenuTile<Exercice> extends StatelessWidget {
  const MenuTile(
      {Key? key,
      required this.title,
      required this.info,
      required this.exercice})
      : super(key: key);
  final String title;
  final String info;
  final Widget exercice;

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
          return exercice;
        },
      ),
    );
  }
}

class ExerciceTest extends StatelessWidget {
  const ExerciceTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plus d'information"),
      ),
      body: Center(
        child: Container(
          child: const Text("[ExerciceX]"),
        ),
      ),
    );
  }
}
