import 'package:bubu_market/screens/accounts/person_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/Utils.dart';
import 'account_boxes.dart';

class SelectTabsWidget extends ConsumerWidget {
  const SelectTabsWidget({
    Key? key,
    required this.tabIndex,
  }) : super(key: key);

  
  
  
  final int tabIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final tabIndex = ref.watch(currentTab);
    return Container(
      width: getProportionateScreenWidth(350),
      height: getProportionateScreenWidth(280),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        border:
            Border.all(width: .5, style: BorderStyle.solid, color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              ref.read(currentTab.notifier).state = 0;
            },
            child: AccountBoxes(
                color: tabIndex == 0
                    ? Colors.yellow.withOpacity(.5)
                    : Colors.transparent,
                icon: Icons.dashboard_outlined,
                text: 'Dashboard'),
          ),
          GestureDetector(
            onTap: () {
              ref.read(currentTab.notifier).state = 1;
            },
            child: AccountBoxes(
              color: tabIndex == 1
                  ? Colors.yellow.withOpacity(.5)
                  : Colors.transparent,
              icon: Icons.shopping_bag_outlined,
              text: 'Orders',
            ),
          ),
          GestureDetector(
            onTap: () {
              ref.read(currentTab.notifier).state = 2;
            },
            child: AccountBoxes(
              color: tabIndex == 2
                  ? Colors.yellow.withOpacity(.5)
                  : Colors.transparent,
              icon: Icons.home,
              text: 'Addresses',
            ),
          ),
          GestureDetector(
            onTap: () {
              ref.read(currentTab.notifier).state = 3;
            },
            child: AccountBoxes(
              color: tabIndex == 3
                  ? Colors.yellow.withOpacity(.5)
                  : Colors.transparent,
              icon: Icons.person,
              text: 'Update Profile',
            ),
          ),
          InkWell(
            onTap: () {
              ref.read(currentTab.notifier).state = 4;
            },
            child: AccountBoxes(
              color: tabIndex == 4
                  ? Colors.yellow.withOpacity(.5)
                  : Colors.transparent,
              icon: Icons.copy,
              text: 'Change Password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 10,
              top: 10,
              right: 10,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Icons.logout,
                    size: 20,
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Logout",
                    style: GoogleFonts.nunito(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
