
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountBoxes extends StatelessWidget {
  const AccountBoxes({
    required this.color,
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);
 final Color color;
 final IconData icon;
 final String text;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            bottom: 10,
            top: 10,
            right: 10,
          ),
          child: Align(
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
