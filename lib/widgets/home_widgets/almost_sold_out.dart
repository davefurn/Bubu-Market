
import 'package:bubu_market/widgets/home_widgets/Products%20Cards/product_card_discout_ratings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bubu_market/constants/utils.dart';

import 'Products Cards/product_card_type2.dart';


class AlmostSoldOut extends StatelessWidget {
  const AlmostSoldOut({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height:getProportionateScreenHeight(40),
            width:  double.infinity,
            color: const Color(0xff008080),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(10),
                
                top: getProportionateScreenHeight(15)),
            child: 
                Text(
                  'Almost Sold Out',
                  style: GoogleFonts.nunito(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
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
            itemBuilder: (context, index) {
              return ProductCardType2(index: index,);
            },
          ),
        )
      ],
    );
  }
}


