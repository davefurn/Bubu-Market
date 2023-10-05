import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/constants/utils.dart';
import 'package:bubu_market/screens/main/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TopCatgories extends ConsumerWidget {
  const TopCatgories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    return Container(
      height: 120,
      constraints: const BoxConstraints(
        minHeight: 120,
        maxHeight: 170,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) => InkWell(
          // onHover: ,
          onTap: () {
            ref.read(tabIndexValueProvider.notifier).state = 3;
          },
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints(
                  minHeight: 70,
                  minWidth: 70,
                  maxHeight: 120,
                  maxWidth: 120,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    GlobalVariables.categoryImages[index]['image']!,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(5)),
              Text(
                GlobalVariables.categoryImages[index]['title']!,
                maxLines: 2,
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
