import 'dart:async';
import 'dart:math';

import 'package:bubu_market/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  final double initialRadius = 10;
  double radius = 10;
  double pi = 3.14;
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  List<Color> colors = [
    GlobalVariables.colorPrimary,
    GlobalVariables.colorAccent,
    GlobalVariables.colorSecondary,
  ];
  Color colorNow = GlobalVariables.colorPrimary;
  int colorIndex = 0;
  void changeColor() {
    if (colorIndex < 2) {
      colorIndex = colorIndex + 1;
      setState(() {
        colorNow = colors[colorIndex];
      });
    } else {
      colorIndex = 0;
      setState(() {
        colorNow = colors[colorIndex];
      });
    }
  }

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (t) => changeColor());
  }

  @override
  void dispose() {
    _animationController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Transform.rotate(
          angle: _animationController.value * 2 * pi,
          child: SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              children: [
                const Dot(
                  radius: 30,
                  color: Colors.transparent,
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(pi / 4),
                    radius * sin(pi / 4),
                  ),
                  child: const Dot(
                    radius: 2,
                    color: GlobalVariables.colorAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(2 * pi / 4),
                    radius * sin(2 * pi / 4),
                  ),
                  child: Dot(
                    radius: 2,
                    color: Colors.yellow.shade100,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(3 * pi / 4),
                    radius * sin(3 * pi / 4),
                  ),
                  child: Dot(
                    radius: 2,
                    color: colorNow,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(4 * pi / 4),
                    radius * sin(4 * pi / 4),
                  ),
                  child: Dot(
                    radius: 2,
                    color: Colors.yellow.shade200,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(5 * pi / 4),
                    radius * sin(5 * pi / 4),
                  ),
                  child: Dot(
                    radius: 2,
                    color: Colors.yellow.shade300,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(6 * pi / 4),
                    radius * sin(6 * pi / 4),
                  ),
                  child: Dot(
                    radius: 2,
                    color: Colors.yellow.shade400,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(7 * pi / 4),
                    radius * sin(7 * pi / 4),
                  ),
                  child: Dot(
                    radius: 2,
                    color: Colors.yellow.shade500,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(8 * pi / 4),
                    radius * sin(8 * pi / 4),
                  ),
                  child: Dot(
                    radius: 2,
                    color: Colors.yellow.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class Dot extends StatelessWidget {
  const Dot({required this.color, Key? key, this.radius}) : super(key: key);
  final double? radius;
  final Color color;

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      );
}
