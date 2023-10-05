import 'package:bubu_market/constants/utils.dart';
import 'package:bubu_market/widgets/home_widgets/Products%20Cards/product_type_3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToYourWishList extends StatelessWidget {
  const AddToYourWishList({super.key});

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
                  'Add To Your Wishlist',
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
          height: 620,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 305,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => ProductCardType3(index: index),
          ),
        )
      ],
    );
  }
}
