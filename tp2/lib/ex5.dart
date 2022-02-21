import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exercice5 extends StatefulWidget {
  const Exercice5({Key? key}) : super(key: key);

  @override
  _Exercice5State createState() => _Exercice5State();
}

class _Exercice5State extends State<Exercice5> {
  double rotX = 0;
  double rotZ = 0;
  bool mirror = false;
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Example")),
      body: SingleChildScrollView(
        child: Column(children: [
          //Image
          GridView.count(crossAxisCount: 3, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0, padding: const EdgeInsets.all(20.0), children: [
            Container(
      child: const Text("He'd have you all unravel at the"),
      color: Colors.teal[100],
    ),
    Container(
      child: const Text('Heed not the rabble'),
      color: Colors.teal[200],
    ),
    Container(
      child: const Text('Sound of screams but the'),
      color: Colors.teal[300],
    ),
    Container(
      child: const Text('Who scream'),
      color: Colors.teal[400],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Revolution is coming...'),
      color: Colors.teal[500],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Revolution, they...'),
      color: Colors.teal[600],
    ),
          ],),

          //Slider rot X
          Container(
            child: Row(
              children: [
                const Text("Rotate X:"),
                Expanded(
                  child: Slider(
                    value: rotX,
                    min: -math.pi,
                    max: math.pi,
                    onChanged: (double value) {
                      setState(() {
                        rotX = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
          ),

          //Slider rot Z
          Container(
            child: Row(
              children: [
                const Text("Rotate Z:"),
                Expanded(
                  child: Slider(
                    value: rotZ,
                    min: -math.pi,
                    max: math.pi,
                    onChanged: (double value) {
                      setState(() {
                        rotZ = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
          ),

          //Checkbox mirror
          Container(
            child: Row(
              children: [
                const Text("Mirror:"),
                Checkbox(
                  value: mirror,
                  onChanged: (bool? value) {
                    setState(() {
                      mirror = value!;
                    });
                  },
                )
              ],
            ),
            padding: const EdgeInsets.all(10),
          ),

          //Slider scale
          Container(
            child: Row(
              children: [
                const Text("Scale:"),
                Expanded(
                  child: Slider(
                    value: scale,
                    min: 0.1,
                    max: 2.5,
                    onChanged: (double value) {
                      setState(() {
                        scale = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
          ),
        ]),
      ),
    );
  }
}
