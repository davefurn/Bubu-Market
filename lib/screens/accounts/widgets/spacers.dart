import 'package:flutter/material.dart';

class Spacers extends StatelessWidget {
  final double height;
  const Spacers({
    super.key, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
    );
  }
}
