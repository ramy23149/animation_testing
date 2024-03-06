import 'package:flutter/material.dart';

class AnimatedContaner extends StatefulWidget {
  const AnimatedContaner({super.key});

  @override
  State<AnimatedContaner> createState() => _AnimatedContanerState();
}

class _AnimatedContanerState extends State<AnimatedContaner> {
  double height = 50;
  double width = 50;
  Color color = Colors.blue;
  double raduis = 10;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 3),
          child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(seconds: 3),
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(raduis)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = opacity == 1 ? 0 : 1;
            height = height == 50 ? 200 : 50;
            width = width == 50 ? 200 : 50;
            color = color == Colors.blue ? Colors.red : Colors.blue;
            raduis = raduis == 10 ? 20 : 10;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
