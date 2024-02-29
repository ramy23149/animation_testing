import 'package:flutter/material.dart';
import 'package:ramy_app/models/clipPath_model.dart';

class ClipPathView extends StatelessWidget {
  const ClipPathView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ClipPathBody(),
    );
  }
}

class ClipPathBody extends StatefulWidget {
  const ClipPathBody({super.key});

  @override
  State<ClipPathBody> createState() => _ClipPathBodyState();
}

class _ClipPathBodyState extends State<ClipPathBody>
    with SingleTickerProviderStateMixin {
  List<ColorModel> colors = const [
    ColorModel(Color(0xFFa4161a), Alignment.centerLeft), // Red
    ColorModel(Color(0xFFffba08), Alignment.centerRight), // Orange
    ColorModel(Color(0xFF3f88c5), Alignment.topCenter), // Yellow
    ColorModel(Color(0xFF032b43), Alignment.bottomCenter), // Green
    ColorModel(Color(0xFF136f63), Alignment.topLeft), // Blue
    ColorModel(Color(0xFF7986CB), Alignment.bottomRight), // Indigo
    ColorModel(Color(0xFFffdac6), Alignment.center), // Purple
    ColorModel(Color(0xFFF06292), Alignment.topRight), // Pin
  ];

  late AnimationController animationController;
  late ColorModel cruntColor;
  late ColorModel prevColor;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    cruntColor = colors.first;
    prevColor = colors.last;

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            color: prevColor.color,
            height: MediaQuery.of(context).size.height * .6,
          ),
          AnimatedBuilder(
              animation: animationController,
              builder: (context, _) {
                return ClipPath(
                  clipper:
                      CustomPath(animationController.value,cruntColor.alignment),
                  child: Container(
                    color: cruntColor.color,
                    height: MediaQuery.of(context).size.height * .6,
                  ),
                );
              }),
        ]),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.builder(
                itemCount: colors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        cruntColor = colors[index];
                        animationController.forward(from: 0).whenComplete(() {
                            prevColor = cruntColor;
                          
                        setState(() {});
                          
                        });
                      
                      },
                      child: GridViewItem(colorModel: colors[index]));
                }),
          ),
        )
      ],
    );
  }
}

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.colorModel});
  final ColorModel colorModel;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: colorModel.color,
    );
  }
}

class CustomPath extends CustomClipper<Path> {
  final double value;
  final Alignment alignment;
  CustomPath(this.value, this.alignment);
  @override
  Path getClip(Size size) {
    Path path = Path();

    if (alignment == Alignment.centerLeft) {
      buildPath(path, size, Offset(0.0, size.height/2));
    } else if (alignment == Alignment.centerRight) {
      buildPath(path, size,Offset(size.width, size.height/2));
    } else if (alignment == Alignment.topCenter) {
      buildPath(path, size, Offset(size.width/2,0));
    } else if (alignment == Alignment.bottomCenter) {
      buildPath(
          path, size, Offset(size.width/2,size.height));
    } else if (alignment == Alignment.topLeft) {
      buildPath(path, size, const Offset(0, 0));
    } else if (alignment == Alignment.bottomRight) {
      buildPath(path, size, Offset(size.height,size.width));
    } else if (alignment == Alignment.center) {
      buildPath(path, size, Offset(size.width / 2, size.height / 2));
    } else if (alignment == Alignment.topRight) {
      buildPath(path, size, Offset(size.width, 0));
    }

    return path;
  }

  void buildPath(Path path, Size size, Offset offset) {
    path.addOval(
        Rect.fromCircle(center: offset, radius: size.height * 2 * value));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
