import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Products Cards/product_discount_sales.dart';

class DiscountSales extends StatelessWidget {
  const DiscountSales({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            color: const Color(0xffFF4500),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('% Discount Sales', style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('See All >', style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 7, 131, 233)
                  ),),
                ),
                Text('Sales Ends In:', style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),),
              ],
            ),
          ),
           const SizedBox(
          height: 10,
        ),
        Container(
          margin:const   EdgeInsets.symmetric(vertical: 5.0),
          height: 305,
          child: ListView.builder(
    itemCount: 7,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return ProductDiscountSales(index: index,);
    },
          ),
        )
        ],
      ),
    );
  }
}
