import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContaner extends StatefulWidget {
  const AnimatedContaner({super.key});

  @override
  State<AnimatedContaner> createState() => _AnimatedContanerState();
}

class _AnimatedContanerState extends State<AnimatedContaner> {
  double value = 0;
  double _angle = 0;
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _angle),
              duration: const Duration(seconds: 2),
              builder: (ctx,double angle, __) {
              return  Transform.rotate(
                  angle: angle,
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                );
              }),
          Slider(
            value: value,
            onChanged: (double val) => setState(() {
              value = val;
              _angle = val;
            }),
            min: 0,
            max: pi * 2,
            divisions: 4,
            label: value.round().toString(),
          )
        ],
      ),
    );
  }
}
