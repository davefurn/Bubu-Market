import 'package:bubu_market/constants/Utils.dart';
import 'package:bubu_market/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onpressed,
    required this.thickLine,
    super.key,
    this.hpD,
    this.color,
    this.textcolor,
    this.borderColor,
  });
  final double? hpD;
  final String text;
  final VoidCallback onpressed;
  final Color? color;
  final Color? textcolor;
  final Color? borderColor;
  final double thickLine;

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
