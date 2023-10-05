import 'package:bubu_market/screens/home/home_body.dart';
import 'package:bubu_market/screens/main/main_view.dart';
import 'package:flutter/material.dart';


abstract class AppRoutes {
  static const main = '/';
  static const productList = '/product-list';
  static const product = '/product';
  static const categoryList = '/category-list';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(
        settings: settings,
        builder: (_) {
          switch (settings.name) {
            case main:
              return const MainView();

            default:
              return const Home();
          }
        },
      );
}
