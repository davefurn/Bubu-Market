import 'package:bubu_market/screens/home/home_body.dart';
import 'package:flutter/material.dart';

import '../screens/home/category_deals.dart';
import '../screens/favourites/favourite_screen.dart';
import '../screens/main/main_view.dart';

abstract class AppRoutes {
  static const main = '/';
  static const productList = '/product-list';
  static const product = '/product';
  static const categoryList = '/category-list';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          
          switch (settings.name) {
            case main:
              print("moving to home");
              return MainView();

            default:
            
              return const Home();
          }
        });
  }
}

Widget _errorPage() {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Error'),
    ),
    body: const Center(
      child: Text('Error'),
    ),
  );
}
