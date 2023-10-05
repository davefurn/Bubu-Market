import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/models/state_provider_model.dart';
import 'package:bubu_market/widgets/home_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardType2 extends ConsumerWidget {
  const ProductCardType2({
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
    final counter = ref.watch(stateProviderInteger2);
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 1,
        child: Column(
          children: [
            Expanded(
              flex: counter == 0 ? 7 : 5,
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
              flex: counter == 0 ? 3 : 2,
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
                            'description ashvdhdv fsanfvsdsds hvfhwvewhfb jbew',
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
                    if (counter == 0) CustomButton(
                            text: 'Add To Cart',
                            onpressed: () => ref
                                .read(stateProviderInteger2.notifier)
                                .state++,
                            thickLine: 1,
                            color: const Color(0xfff4dc51),
                            textcolor: Colors.black,
                          ) else Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(30),
                                      elevation: 1,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(30),
                                        onTap: () => ref
                                            .read(
                                              stateProviderInteger2.notifier,
                                            )
                                            .state--,
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Color.fromARGB(
                                              255,
                                              183,
                                              39,
                                              28,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    '$counter',
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Material(
                                  borderRadius: BorderRadius.circular(30),
                                  elevation: 1,
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () => ref
                                          .read(stateProviderInteger2.notifier)
                                          .state++,
                                      child: const Icon(
                                        Icons.add,
                                        color: Color.fromARGB(255, 53, 120, 55),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
