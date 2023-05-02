import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoradTextWidget extends StatelessWidget {
  const DashBoradTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
                text: "Hello Blue ",
                style: GoogleFonts.nunito(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                )),
            TextSpan(
                text: "(not blue ? ",
                style: GoogleFonts.nunito(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(
                text: "Log Out ",
                style: GoogleFonts.nunito(
                  color: Colors.red,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(
                text: ")",
                style: GoogleFonts.nunito(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                )),
          ]),
    );
  }
}
