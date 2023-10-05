import 'package:bubu_market/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth,
      height: 65,
      color: const Color(0xfff4dc51),
      padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'We are available 24/7, Need help? Call Us:',
                maxLines: 2,
                style: GoogleFonts.nunito(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                ' +234155202857',
                style: GoogleFonts.nunito(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 152, 40, 32),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Track Your Order',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
                child: VerticalDivider(
                  width: 20,
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
              Text(
                'My Account',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
                child: VerticalDivider(
                  width: 20,
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
              Text(
                'Logout',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
