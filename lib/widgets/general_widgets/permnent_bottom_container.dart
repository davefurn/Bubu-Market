import 'package:bubu_market/widgets/home_widgets/custom_button.dart';
import 'package:bubu_market/widgets/home_widgets/email_me.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PermanentBox extends StatefulWidget {
  const PermanentBox({Key? key}) : super(key: key);

  @override
  State<PermanentBox> createState() => _PermanentBoxState();
}

class _PermanentBoxState extends State<PermanentBox> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        height: 400,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: SizedBox(
                height: 39,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/images/icon + yellow text.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEW TO BUBU?',
                    style: GoogleFonts.nunito(
                      color: const Color(0xffF4DC51),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
            'Subscribe to our newsletter to get updates on our latest offers?',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Expanded(
                  flex: 6,
                  child: EmailMe(),
                ),
                Expanded(
                  flex: 3,
                  child: CustomButton(
                    color: Colors.black,
                    text: 'Submit',
                    onpressed: () {},
                    thickLine: 0,
                    textcolor: const Color(0xffF4DC51),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // GridView.count(
            // crossAxisCount: 2,
            // children: [
            // Container(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //        Text(
            //         'NEW TO BUBU?',
            //         style: GoogleFonts.nunito(
            //           color: const Color(0xffF4DC51),
            //           fontWeight: FontWeight.w700,
            //           fontSize: 16,
            //         ),
            //         textAlign: TextAlign.left,
            //       ),
            //     ],
            //   ),
            // )
            // ],
            // )
          ],
        ),
      );
}
