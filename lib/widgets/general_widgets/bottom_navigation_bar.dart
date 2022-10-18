import 'package:badges/badges.dart';
import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/screens/accounts/accounts_screen.dart';
import 'package:bubu_market/screens/home/homescreen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    AccountScreen(),
    const Center(child: Text('Cart Page'),),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.colorPrimary,
        unselectedItemColor: GlobalVariables.colorSecondary,
        backgroundColor: GlobalVariables.scaffoldBackGroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //for home
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.colorPrimary
                        : GlobalVariables.scaffoldBackGroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),
          //for account
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.colorPrimary
                        : GlobalVariables.scaffoldBackGroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person_outline_outlined,
              ),
            ),
            label: '',
          ),
          //for cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.colorPrimary
                        : GlobalVariables.scaffoldBackGroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: Badge(
                  elevation: 0,
                  badgeContent: const Text('2'),
                  badgeColor: GlobalVariables.colorAccent,
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                  )),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
