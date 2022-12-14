import 'package:bubu_market/screens/admin/add_products_screen.dart';
import 'package:bubu_market/screens/auth_screens/authscreen.dart';
import 'package:bubu_market/widgets/general_widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../screens/admin/posts_screen.dart';
import '../screens/auth_screens/login_page.dart';
import '../screens/auth_screens/sign_up.dart';
import '../screens/home/homescreen.dart';
import 'custom_page_builder.dart';

class RouteGenerator {
  static const auth = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const homescreen = '/homescreen';
  static const actualHomeBar = '/actual-home-bar';
  static const addPostsScreen = '/add-Post-Screen';
  static const postsScreen = '/Post-Screen';
 
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //getting arguments passed in while calling navigator.pushnamed

    switch (settings.name) {
      case actualHomeBar:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const BottomBar());
      case addPostsScreen:
        return customPageBuilder(const AddPRoductsScreen(), 1, 0);
      case auth:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AuthScreen());
      case login:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Login());
      case signup:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignUp());
      case homescreen:
        return customPageBuilder(HomeScreen(), 0, -1);
      case postsScreen:
        return customPageBuilder(const PostsScreen(), -1, 0);
      default:
        return _errorPage(settings);
    }
  }
}

Route<dynamic> _errorPage(settings) {
  return MaterialPageRoute(
      settings: settings,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Error'),
          ),
        );
      });
}
