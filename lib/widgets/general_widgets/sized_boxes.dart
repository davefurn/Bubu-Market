import 'package:flutter/material.dart';
class SizedBoxes extends StatelessWidget {
  final double? width;
  final double? height;
  const SizedBoxes({
    Key? key,  this.width ,  this.height = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
      height:  height,
    );
  }
}