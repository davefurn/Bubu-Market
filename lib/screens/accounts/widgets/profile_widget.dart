import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/Utils.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                "assets/images/clothes.jpeg",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Hello Blue",
              style: GoogleFonts.nunito(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Bubu member in 5 months",
              style: GoogleFonts.sacramento(
                fontSize: 21,
                fontWeight: FontWeight.w100,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
