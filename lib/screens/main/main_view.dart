import 'package:badges/badges.dart';
import 'package:bubu_market/constants/utils.dart';
import 'package:bubu_market/screens/favourites/favourite_screen.dart';
import 'package:bubu_market/screens/home/category_deals.dart';
import 'package:bubu_market/screens/home/home_body.dart';
import 'package:bubu_market/screens/accounts/person_screen.dart';

import 'package:bubu_market/screens/main/main_view_model.dart';

import 'package:bubu_market/widgets/home_widgets/search_box.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  List<Menu> data = [];
  

  @override
  void initState() {
    for (var element in dataList) {
      data.add(Menu.fromJson(element));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSelectedItem = ref.watch(bottomSelectedItemProvider);
    final tabIndexValue = ref.watch(tabIndexValueProvider);
    

    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
              title: GestureDetector(
                onTap: () {
                  ref.read(tabIndexValueProvider.notifier).state = 0;
                  ref.read(bottomSelectedItemProvider.notifier).state = 0;
                },
                child: Image.asset(
                  'assets/images/logo-on-white.8352d7ab.png',
                  width: 150,
                  height: 150,
                ),
              ),
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Badge(
                    padding: const EdgeInsets.all(8),
                    elevation: 0,
                    badgeContent: Text(
                      "4",
                      style: GoogleFonts.nunito(
                        fontSize: 17,
                        decorationStyle: TextDecorationStyle.wavy,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    badgeColor: Colors.transparent,
                    child: const Icon(
                      Icons.shopping_cart_checkout_outlined,
                      size: 30,
                    ),
                  ),
                ),
              ],
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffEEEEEE),
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(42),
                child: SearchBox(),
              )),
          drawer: Drawer(
            child: _buildDrawer(),
          ),
          bottomNavigationBar: BottomNavigationBar(
              iconSize: 30,
              onTap: (index) {
                ref.read(bottomSelectedItemProvider.notifier).state = index;
                ref.read(tabIndexValueProvider.notifier).state = index;
                
              },
              currentIndex: bottomSelectedItem,
              elevation: 10,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              backgroundColor: const Color(0xffF4DC51),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      bottomSelectedItem == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      color: Colors.black,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      bottomSelectedItem == 1
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.black,
                    ),
                    label: 'Favourite'),
                BottomNavigationBarItem(
                    icon: Icon(
                      bottomSelectedItem == 2
                          ? Icons.person
                          : Icons.person_outline,
                      color: Colors.black,
                    ),
                    label: 'Contact'),
                // BottomNavigationBarItem(

                //     icon: Icon(
                //       _currentIndex == 3 ? Icons.notifications : Icons.notifications_outlined,
                //       color: Colors.black,
                //     ),
                //     label: 'Notifications'),
              ]),
          body: IndexedStack(
            index: tabIndexValue,
            children: const [
              Home(),
              FavouriteScreen(),
              PersonScreen(),
              CategoryDealsScreen(),
            ],
          )),
    );
  }

  Widget _buildDrawer() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildDrawerHeader(data[index]);
        }
        return _buildMenuList(data[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 0.5,
        thickness: 1,
      ),
      itemCount: data.length,
    );
  }

  Widget _buildDrawerHeader(Menu headItem) {
    return SizedBox(
      height: 45,
      child: DrawerHeader(
          padding: const EdgeInsets.only(
            top: 10,
            left: 15,
            right: 15,
            bottom: 0,
          ),
          margin: const EdgeInsets.only(bottom: 0),
          decoration: const BoxDecoration(
            color: Color(0xfff4dc51),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BUBU ",
                style: GoogleFonts.nunito(color: Colors.black, fontSize: 23),
              ),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.black,
                    size: 30,
                  )),
            ],
          )),
    );
  }

  Widget _buildMenuList(Menu menuItem) {
    //build the expansion tile
    double lp = 0; //left padding
    double fontSize = 20;
    if (menuItem.level == 1) {
      lp = 20;
      fontSize = 12;
    }
    if (menuItem.level == 2) {
      lp = 30;
      fontSize = 10;
    }

    if (menuItem.children.isEmpty) {
      return Builder(builder: (context) {
        return InkWell(
          child: Padding(
            padding: EdgeInsets.only(left: lp),
            child: ListTile(
              // leading: Icon(menuItem.icon),
              title: Text(
                menuItem.title,
                style: GoogleFonts.nunito(fontSize: 14),
              ),
            ),
          ),
          // onTap: () {
          //   // Close the drawer
          //   Navigator.pop(context);

          //   //Then direct user to a position on home screen

          // },
        );
      });
    }

    return Padding(
      padding: EdgeInsets.only(left: lp),
      child: ExpansionTile(
        initiallyExpanded: true,
        iconColor: const Color(0xfff4dc51),
        collapsedIconColor: Colors.black,
        title: Text(
          menuItem.title,
          style: GoogleFonts.nunito(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: Colors.red),
        ),
        children: menuItem.children.map(_buildMenuList).toList(),
      ),
    );
  }
}

//The Menu Model
class Menu {
  int level = 0;
  IconData icon = Icons.drive_file_rename_outline;
  String title = "";
  List<Menu> children = [];
  //default constructor
  Menu(this.level, this.icon, this.title, this.children);

  //one method for  Json data
  Menu.fromJson(Map<String, dynamic> json) {
    //level
    if (json["level"] != null) {
      level = json["level"];
    }
    //icon
    if (json["icon"] != null) {
      icon = json["icon"];
    }
    //title
    title = json['title'];
    //children
    if (json['children'] != null) {
      children.clear();
      //for each entry from json children add to the Node children
      json['children'].forEach((v) {
        children.add(Menu.fromJson(v));
      });
    }
  }
}

//menu data list
List dataList = [
  //menu data item
  {
    "level": 0,
    "icon": Icons.account_circle_rounded,
    "title": " ",
  },

  //menu data item
  {
    "level": 0,
    "icon": Icons.verified_outlined,
    "title": "My Bubu Account",
    "children": [
      {
        "level": 1,
        "icon": Icons.lock_outlined,
        "title": "Logout",
        // "children":[
        //   {"title": "Change username",},
        //   {"title": "Reset Username"},
        //   {"title": "History Of change"},
        // ],
      },
      {
        "level": 1,
        "icon": Icons.lock,
        "title": "How To Sell",
      },
      {
        "level": 1,
        "icon": Icons.delete_forever,
        "title": "Our Affliate Program"
      },
      {
        "level": 1,
        "icon": Icons.delete_forever,
        "title": "Invite new users and get a discount"
      },
      {"level": 1, "icon": Icons.delete_forever, "title": "Coupons"},
      {"level": 1, "icon": Icons.delete_forever, "title": "Contact Us"},
    ]
  },

  //menu data item
  {
    "level": 0,
    "icon": Icons.payments,
    "title": "Categories",
    "children": [
      {
        "level": 1,
        "icon": Icons.paypal,
        "title": "Electronics",
      },
      {
        "level": 1,
        "icon": Icons.credit_card,
        "title": "Phones & Accessories",
      },
      {"level": 1, "icon": Icons.credit_card, "title": "Clothes"},
      {"level": 1, "icon": Icons.credit_card, "title": "Footwears"},
      {"level": 1, "icon": Icons.credit_card, "title": "Jewelries"},
      {"level": 1, "icon": Icons.credit_card, "title": "Laptops"},
      {"level": 1, "icon": Icons.credit_card, "title": "Vehicles"},
      {"level": 1, "icon": Icons.credit_card, "title": "Home Appliances"},
      {"level": 1, "icon": Icons.credit_card, "title": "Sports & Fitness"},
      {"level": 1, "icon": Icons.credit_card, "title": "Beauty & Health"},
    ]
  },

  //menu data item
  {
    "level": 0,
    "icon": Icons.travel_explore,
    "title": "Services",
    "children": [
      {
        "level": 1,
        "icon": Icons.calendar_month,
        "title": "Contact Us",
        // "children":[
        //   { "icon":Icons.calendar_view_day,
        //     "title": "15th, 9:30 AM",
        //   },
        //   { "icon":Icons.calendar_view_day,
        //     "title": "30th, 9:30 AM",
        //   },
        // ],
      },
      {
        "level": 1,
        "icon": Icons.calendar_month,
        "title": "Faq",
        // "children":[
        //   { "icon":Icons.calendar_view_day,
        //     "title": "16th, 10:45 AM",
        //   },
        //   { "icon":Icons.calendar_view_day,
        //     "title": "29th, 10:45 AM",
        //   },
        // ],
      },
      // {
      //   "level":1,
      //   "icon": Icons.calendar_month,
      //   "title": "November",
      //   "children":[
      //     { "icon":Icons.calendar_view_day,
      //       "title": "20th, 10:50 AM",
      //     },
      //   ],
      // },
    ]
  },
];
