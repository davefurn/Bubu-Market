import 'package:bubu_market/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../constants/Utils.dart';


class CustomButton extends StatelessWidget {
  final double? hpD;
  final String text;
  final VoidCallback onpressed;
  final Color? color;
  final Color? textcolor;
  final Color? borderColor;
  final double thickLine;
  const CustomButton(
      {super.key, this.hpD, required this.text, required this.onpressed, this.color, this.textcolor, required this.thickLine, this.borderColor});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hpD ?? getProportionateScreenWidth(20),
      ),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          side: BorderSide(
            color: borderColor ?? GlobalVariables.colorPrimary,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: textcolor,
          ),
        ),
      ),
    );
  }
}
