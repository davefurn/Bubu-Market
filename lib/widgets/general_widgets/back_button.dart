import 'package:bubu_market/widgets/general_widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BacksButton extends StatelessWidget {
  const BacksButton({
    required this.func,
    Key? key,
    this.text = 'BACK',
    this.width = 5,
    this.size = 20,
    this.colors = Colors.white,
    this.textcolor = Colors.white,
  }) : super(key: key);
  final double? size;
  final String text;
  final double? width;
  final Color? colors;
  final Color? textcolor;
  final VoidCallback func;

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
            'assets/svgs/back-arrow.svg',
            color: colors,
            width: size,
            height: size,
          ),
          const SizedBoxes(
            width: 1,
          ),
          Text(
            text,
            style: textTheme.headlineMedium?.copyWith(color: textcolor),
          ),
        ],
      ),
    );
  }
}
