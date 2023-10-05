import 'package:bubu_market/screens/accounts/person_view_model.dart';
import 'package:bubu_market/screens/accounts/widgets/profile_widget.dart';
import 'package:bubu_market/screens/accounts/widgets/select_widget.dart';
import 'package:bubu_market/screens/accounts/widgets/selected_widget.dart';
import 'package:bubu_market/widgets/general_widgets/permnent_bottom_container.dart';
import 'package:bubu_market/widgets/home_widgets/recently_viewed_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonScreen extends ConsumerWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(currentTab);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
           const ProfileWidget(),
            const SizedBox(
              height: 50,
            ),
            SelectTabsWidget(tabIndex: tabIndex),
            const SizedBox(
              height: 30,
            ),
            SelectedWidget(tabIndex: tabIndex),
            const RecentlyViewedItems(),
            const PermanentBox(),
          ],
        ),
      ),
    );
  }
}


          
