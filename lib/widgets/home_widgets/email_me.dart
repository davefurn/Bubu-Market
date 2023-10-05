import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailMe extends StatelessWidget {
  const EmailMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffeeeeee),
      ),
      margin: const EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 10),
      child: TextField(
        cursorColor: Colors.black,
        style: const TextStyle(
          height: 1.5,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Color(0xFF1F2937),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            bottom: 12.5,
            top: 12.5,
          ),
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: Color.fromARGB(255, 232, 235, 240),
            size: 24,
          ),
          hintText: 'Enter Email Address',
          hintStyle: GoogleFonts.nunito(
            fontSize: 19,
          ),
          isDense: true,
          fillColor: GlobalVariables.scaffoldBackGroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFFF3F4F6)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFFF3F4F6)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFFF3F4F6)),
          ),
        ),
      ),
    );
  }
}
