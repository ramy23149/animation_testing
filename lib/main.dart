import 'package:flutter/material.dart';
import 'package:ramy_app/pages/login_page.dart';

void main() {
  runApp(const Scholarchat());
}

class Scholarchat extends StatelessWidget {
  const Scholarchat({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationPage());
  }
}
