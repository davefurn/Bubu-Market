import 'package:bubu_market/constants/utils.dart';
import 'package:bubu_market/screens/home/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bubu_market/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/collection_list.dart';

class HomeBannerView extends ConsumerWidget {
  const HomeBannerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    final collectionList = ref.watch(homeBannerListProvider);
    final indicator = ref.watch(homeBannerIndicator);
      print("running homebannerview consumer widget");

      print( "collectionList: ${collectionList.toString()}");

    return collectionList.when(
      data: (list) => Column(
        children: [
          CarouselSlider(
            items: list.map((e) {
              print("$e");
              return HomeBannerItemView(
                collection: e!,
              );
            }).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              height: 300,
              onPageChanged: (index, reason) {
                ref.read(homeBannerIndicator.notifier).state = index;
              },
            ),
          ),
           Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list.asMap().entries.map((entry) {
                    return Container(
                      width: 9,
                      height: 9,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: GlobalVariables.scaffoldBackGroundColor
                              .withOpacity(indicator == entry.key ? 1 : 0.3)),
                    );
                  }).toList(),
                ),
        ],
        
      ),
      error: (e, s) => Text("$e"),
      loading: () => const SizedBox(
        height: 300,
        child: Center(
          child: CircularProgressIndicator(
            color: GlobalVariables.colorSecondary,
          ),
        ),
      ),
    );
  }
}

class HomeBannerItemView extends StatelessWidget {
  const HomeBannerItemView({required this.collection, Key? key})
      : super(key: key);
  final Billboards collection;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   AppRoutes.productList,
        //   arguments: collection,
        // );
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Stack(
          children: [
            CachedNetworkImage(
                imageUrl: collection.banner.toString(),
                imageBuilder: (context, imageProvider) {
                  print (collection.banner.toString());
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  );
                }),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  collection.owner!.id.toString(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
