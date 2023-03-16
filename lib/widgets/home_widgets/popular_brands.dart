import 'package:bubu_market/widgets/home_widgets/Products%20Cards/product_popular_brands.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bubu_market/constants/utils.dart';

class PopularBrands extends StatelessWidget {
  const PopularBrands({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: getProportionateScreenHeight(40),
            width: double.infinity,
            color: const Color(0xffF4DC51),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(10),
                top: getProportionateScreenHeight(15)),
            child: Text(
              'Popular Brands',
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 304,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 75,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return const ProductPopularBrands();
            },
          ),
        )
      ],
    );
  }
}
