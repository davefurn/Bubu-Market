import 'package:bubu_market/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        horizontal: hpD ?? 5,
      ),
      child: InkWell(

        borderRadius: BorderRadius.circular(5),
        onTap: onpressed,
        child: Container(
          margin: const EdgeInsets.only(bottom: 1),
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
          child: Center(child: Text(text, style: GoogleFonts.nunito(
            fontSize: 17,
            fontWeight: FontWeight.w600,
color: textcolor,
          ),)),
        ),
      )
    );
  }
}
