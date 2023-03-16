import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/models/state_provider_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProductDiscountSales extends ConsumerWidget {
  final int index;
  const ProductDiscountSales({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
    
      width: 205,
     
      child: Card(
        elevation: 1,
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                     borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          GlobalVariables.categoryImages[index]['image']!,
                        ))),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
               padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 27,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Text(
                              'description ashvdhdv fsanfvsdsds hvfhwvewhfb jbewjavweubfuhcbwe',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2, ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'N 200,000',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textDirection: TextDirection.ltr,
                                  ),
                                  Text(
                                    'N 200,000',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2.85,
                                      color: const Color.fromARGB(255, 108, 108, 108)
      ,                                  ),
                                    textDirection: TextDirection.ltr,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              
                              width: double.maxFinite,
                              height: 36,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '200,000 Items left',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.notoSerif(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200,
                                        color: const Color(0xff282828),
                                        
                                      ),
                                      textDirection: TextDirection.ltr,
                                    ),
                                    SizedBox(height: 3,),
                                    LinearPercentIndicator(
                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                      barRadius: const Radius.circular(5),
                        width: 193,
                        lineHeight: 8.0,
                        percent: 0.5,
                        backgroundColor: Color.fromARGB(255, 226, 226, 226),
                        progressColor: const Color(0xffFF4500),
                      ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
