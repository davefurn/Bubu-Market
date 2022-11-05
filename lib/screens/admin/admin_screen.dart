import 'package:bubu_market/screens/admin/posts_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
   int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(child: Text('Analytics Page'),),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.colorPrimary,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/black icon + black text.png",
                  width: 150,
                  height: 50,
                ),
              ),
             const Text('Admin', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: GlobalVariables.colorSecondary,
             ),),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        color: GlobalVariables.colorPrimary,
        
        backgroundColor: GlobalVariables.unselectedTransparent,
        onTap: updatePage,
        items:const [
          //for posts
            Icon(
                Icons.home_outlined,
              ),
          
          //for analytics
           Icon(
                Icons.analytics_outlined,
              ),
          //for orders
          Icon(
                Icons.all_inbox_outlined,
              ),
           
         
        ],
      ),
    );
  }
}