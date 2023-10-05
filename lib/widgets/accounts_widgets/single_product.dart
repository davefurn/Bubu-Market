import 'package:flutter/material.dart';

class SingeProduct extends StatelessWidget {
  const SingeProduct({required this.image, super.key});
  final String image;

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
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
