import 'package:flutter/material.dart';

class Spacers extends StatelessWidget {
  const Spacers({
    required this.height,
    super.key,
  });
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
      );
}
