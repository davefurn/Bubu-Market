import 'package:bubu_market/constants/utils.dart';
import 'package:bubu_market/widgets/home_widgets/Products%20Cards/product_card_type2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreAll extends StatelessWidget {
  const ExploreAll({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(10),
              right: getProportionateScreenWidth(10),
              top: getProportionateScreenHeight(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Explore All',
                  style: GoogleFonts.nunito(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'See All',
                  style: GoogleFonts.nunito(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ProductCardType2(
              index: index,
            ),
          ),
        )
      ],
    );
  }
}
