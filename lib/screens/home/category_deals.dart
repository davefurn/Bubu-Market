import 'package:bubu_market/widgets/general_widgets/permnent_bottom_container.dart';
import 'package:bubu_market/widgets/home_widgets/recently_viewed_items.dart';
import 'package:flutter/material.dart';



class CategoryDealsScreen extends StatelessWidget {
  const CategoryDealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
            RecentlyViewedItems(),
            PermanentBox(),
          ],
        ),
      ),
    );
}
