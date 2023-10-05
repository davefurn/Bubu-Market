import 'package:flutter/material.dart';
class SizedBoxes extends StatelessWidget {
  const SizedBoxes({
    Key? key,  this.width ,  this.height = 10,
  }) : super(key: key);
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) => SizedBox(
      width: width,
      height:  height,
    );
}
