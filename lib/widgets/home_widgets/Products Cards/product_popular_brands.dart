import 'package:flutter/material.dart';

import '../../../constants/Utils.dart';

class ProductPopularBrands extends StatefulWidget {
  const ProductPopularBrands({super.key});

  @override
  State<ProductPopularBrands> createState() => _ProductPopularBrandsState();
}

class _ProductPopularBrandsState extends State<ProductPopularBrands> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(image: AssetImage("assets/images/samsung.png"))
        
        ),
    );
  }
}
