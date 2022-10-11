import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sized_boxes.dart';

class BacksButton extends StatelessWidget {
  final double? size;
  final String text;
  final double? width;
  final Color? colors;
  final Color? textcolor;
  final VoidCallback func;
  const BacksButton(
      {Key? key,
      this.text = "BACK",
      this.width = 5,
      this.size = 20,
      this.colors = Colors.white,
      this.textcolor = Colors.white,
      required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: func,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/svgs/back-arrow.svg",
            color: colors,
            width: size,
            height: size,
          ),
          const SizedBoxes(width: 1,),
          Text(
            text,
            style: textTheme.headlineMedium?.copyWith(color: textcolor),
          ),
        ],
      ),
    );
  }
}

