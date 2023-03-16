// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bubu_market/widgets/home_widgets/Products%20Cards/product_card_discout_ratings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bubu_market/constants/utils.dart';

import 'Products Cards/product_card_type2.dart';


class DealOfDay extends StatelessWidget {
  const DealOfDay({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(10),
                top: getProportionateScreenHeight(15)),
            child: Text(
              'Best Selling Products',
              style: GoogleFonts.nunito(
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCardType2(index: index,);
            },
            separatorBuilder: (context, index) {
              return ProductCardTypeDiscountLessRating(index: index,);
            },
          ),
        )
      ],
    );
  }
}


