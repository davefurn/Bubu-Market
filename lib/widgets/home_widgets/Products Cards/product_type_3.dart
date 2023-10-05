import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/models/state_provider_model.dart';
import 'package:bubu_market/widgets/home_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardType3 extends ConsumerWidget {
  const ProductCardType3({
    required this.index,
    Key? key,
    this.rating,
    this.discount = true,
  }) : super(key: key);
  final bool? rating;
  final bool? discount;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(stateProviderInteger3);
    return Card(
      elevation: 1,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    GlobalVariables.categoryImages[index]['image']!,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                    top: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xfffad1e8),
                    ),
                    padding: const EdgeInsets.all(5),
                    height: 22,
                    child: Text(
                      '40% OFF',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 152, 40, 32),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 24,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'description ashvdhdv fsanfvsdsds hvfhwvewhfb jbewj',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.nunito(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 24,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'N200,000',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.nunito(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (counter == 0)
                    CustomButton(
                      text: 'Add To Wishlist',
                      onpressed: () =>
                          ref.read(stateProviderInteger3.notifier).state++,
                      thickLine: 1,
                      color: const Color(0xfff4dc51),
                      textcolor: Colors.black,
                    )
                  else
                    CustomButton(
                      text: 'Remove from  wishlist',
                      onpressed: () =>
                          ref.read(stateProviderInteger3.notifier).state--,
                      thickLine: 1,
                      color: const Color(0xfff4dc51),
                      textcolor: Colors.black,
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
