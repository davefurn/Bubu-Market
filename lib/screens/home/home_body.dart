import 'package:bubu_market/screens/main/main_view_model.dart';
import 'package:bubu_market/widgets/general_widgets/permnent_bottom_container.dart';
import 'package:bubu_market/widgets/home_widgets/almost_sold_out.dart';
import 'package:bubu_market/widgets/home_widgets/our_collection.dart';
import 'package:bubu_market/widgets/home_widgets/popular_brands.dart';
import 'package:bubu_market/widgets/home_widgets/recently_viewed_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/home_widgets/add_to_wish_list.dart';
import '../../widgets/home_widgets/back_to_school.dart';
import '../../widgets/home_widgets/carousel_widget.dart';
import '../../widgets/home_widgets/contact_us.dart';
import '../../widgets/home_widgets/deal_of_day.dart';
import '../../widgets/home_widgets/discount_sales.dart';
import '../../widgets/home_widgets/explore_all.dart';
import '../../widgets/home_widgets/interesting_finds.dart';
import '../../widgets/home_widgets/top_categories.dart';

class Home extends ConsumerWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController homeController = ScrollController();

  

   

    return SingleChildScrollView(
      controller: homeController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ContactUs(),
          const TopCatgories(),
          const HomeBannerView(),
          const DealOfDay(),
          Container(
            color: const Color.fromARGB(255, 230, 227, 227),
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          const DiscountSales(),
          Container(
            color: const Color.fromARGB(255, 230, 227, 227),
            height: 16,
          ),
          const SizedBox(
            height: 4,
          ),
          const BackToSchool(),
          const SizedBox(
            height: 4,
          ),
          Container(
            color: const Color.fromARGB(255, 230, 227, 227),
            height: 16,
          ),
          const AddToYourWishList(),
          const SizedBox(
            height: 4,
          ),
          Container(
            color: const Color.fromARGB(255, 230, 227, 227),
            height: 16,
          ),
          const ExploreAll(),
          const SizedBox(
            height: 4,
          ),
          const HomeBannerView(),
          const SizedBox(
            height: 10,
          ),
          const InterestingFinds(),
          const SizedBox(
            height: 10,
          ),
          const OurCollection(),
          const AlmostSoldOut(),
          const PopularBrands(),
          const RecentlyViewedItems(),
          const PermanentBox(),
        ],
      ),
    );
  }
  
}

// class MoveTo{
 

  
//    void selectedItem(int index, WidgetRef ref) {
//     final tabIndexValue = ref.watch(bottomSelectedItemProvider);
//       homeController.animateTo(
//         0.0,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//       if (tabIndexValue == index) {
//       } else {
//         ref.read(tabIndexValueProvider.notifier).state = index;
//       }
//     }
// }