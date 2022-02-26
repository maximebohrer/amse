import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exercice2 extends StatefulWidget {
  const Exercice2({Key? key}) : super(key: key);

  @override
  _Exercice2State createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
  double rotX = 0;
  double rotZ = 0;
  bool mirror = false;
  double scale = 1;

  //variables nécéssaires à l'animation
  bool animationRunning = false;
  Timer? timer;
  double rotXChangeRate = 0.01;
  double rotZChangeRate = 0.01;
  double scaleChangeRate = 0.01;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transformations sur image")),
      floatingActionButton: FloatingActionButton(
          child: Icon(animationRunning ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            setState(() {
              animationRunning = !animationRunning;
              if (animationRunning) {
                timer =
                    Timer.periodic(const Duration(milliseconds: 20), animate);
              } else {
                timer!.cancel();
              }
            });
          }),
      body: SingleChildScrollView(
        child: Column(children: [
          //Image
          Container(
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..scale(scale)
                ..rotateY(mirror ? math.pi : 0)
                ..rotateX(rotX)
                ..rotateZ(rotZ),
              child: const Image(
                image: AssetImage("images/mouette.jpg"),
              ),
            ),
            padding: const EdgeInsets.all(10),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(color: Colors.white),
          ),

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

  void animate(Timer timer) {
    setState(() {
      double newRotX = rotX + rotXChangeRate;
      if (newRotX > -math.pi && newRotX < math.pi) {
        rotX = newRotX;
      } else {
        rotXChangeRate = -rotXChangeRate;
      }

      double newRotZ = rotZ + rotZChangeRate;
      if (newRotZ > -math.pi && newRotZ < math.pi) {
        rotZ = newRotZ;
      } else {
        rotZChangeRate = -rotZChangeRate;
      }

      double newScale = scale + scaleChangeRate;
      if (newScale > 0.1 && newScale < 2.5) {
        scale = newScale;
      } else {
        scaleChangeRate = -scaleChangeRate;
      }
    });
  }
}
