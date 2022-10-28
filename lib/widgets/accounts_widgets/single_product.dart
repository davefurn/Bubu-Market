import 'package:bubu_market/constants/colors.dart';
import 'package:flutter/material.dart';

class SingeProduct extends StatelessWidget {
  final String image;
  const SingeProduct({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: GlobalVariables.colorSecondary,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(10),
          child: Image.network(image, fit: BoxFit.fitHeight,
          width: 180,
          ),
        ),
      ),
    );
  }
}
