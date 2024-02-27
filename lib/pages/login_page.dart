import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hallo World'),
                      SizedBox(width: 10,),
                      AnimatedCrossFade(
                          firstChild: CircleAvatar(radius: 16,),
                          secondChild: SizedBox(),
                          crossFadeState: CrossFadeState.showFirst,
                          duration: Duration(seconds: 1))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
