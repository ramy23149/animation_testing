import 'package:flutter/material.dart';

class AnimatedContaner extends StatefulWidget {
  const AnimatedContaner({super.key});

  @override
  State<AnimatedContaner> createState() => _AnimatedContanerState();
}

class _AnimatedContanerState extends State<AnimatedContaner>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Size> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    controller.repeat(reverse: true, period: const Duration(seconds: 2));
    animation = Tween<Size>(
            begin: const Size(100, 150), end: const Size(100, 250))
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn));
    // controller.addListener(() =>
    //   setState(() {})
    // ); kda bta3ml rebuild ll UI Kolo
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  double height = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedBuilder(//rebuild llgoza dh bs
            animation: controller,
            builder: (context, child) {
            return  FlutterLogo(
                size: animation.value.height,
              );
            },
          ),
          ListTile(
              trailing: const Icon(Icons.arrow_right_alt_outlined),
              tileColor: Colors.green,
              title: const Text('Forward'),
              onTap: () => controller.forward()),
          ListTile(
              leading: const Icon(Icons.arrow_back),
              tileColor: Colors.red,
              title: const Text('Forward'),
              onTap: () => controller.reverse())
        ],
      ),
    );
  }
}
