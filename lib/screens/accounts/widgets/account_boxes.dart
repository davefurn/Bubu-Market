// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountBoxes extends StatelessWidget {
 
  Color color;
  IconData icon;
  String text;
  AccountBoxes({
    Key? key,
    
    required this.color,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:  color,
        borderRadius: BorderRadius.circular(5),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10,),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              Icon(
                icon,
                size: 22,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: GoogleFonts.nunito(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
