import 'package:flutter/material.dart';
import 'common.dart';

const ImageProvider image = NetworkImage('https://picsum.photos/512');

class Exercice5c extends StatefulWidget {
  const Exercice5c({Key? key}) : super(key: key);

  @override
  State<Exercice5c> createState() => _Exercice5cState();
}

class _Exercice5cState extends State<Exercice5c> {
  int n = 3;

  @override
  Widget build(BuildContext context) {
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
              children: List<Widget>.generate(
                  n * n,
                  (i) =>
                      ImageTile(image: image, n: n, x: i % n, y: i ~/ n)
                          .getWidget()),
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
}
