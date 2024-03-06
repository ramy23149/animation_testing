import 'package:flutter/material.dart';

class AnimatedContaner extends StatefulWidget {
  const AnimatedContaner({super.key});

  @override
  State<AnimatedContaner> createState() => _AnimatedContanerState();
}

class _AnimatedContanerState extends State<AnimatedContaner> {

  double value = 0;
  
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child:
             Transform.rotate(
            angle: 22/7*value,
              child: Image.asset('assets/images/car.jpeg'))),
            Slider(
              value: value,
               onChanged: (double val)=>setState(() =>value=val),
               min: 0,
               max: 3,
               divisions: 100,
               label: value.round().toString(),
               )
        ],
      ),
    );
  }
}
