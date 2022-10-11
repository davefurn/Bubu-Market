import 'package:bubu_market/screens/auth_screens/authscreen.dart';
import 'package:flutter/material.dart';

import '../screens/auth_screens/login_page.dart';
import '../screens/auth_screens/sign_up.dart';
import '../screens/home/homescreen.dart';
import 'custom_page_builder.dart';

class RouteGenerator {
  static const auth = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const homescreen = '/homescreen';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //getting arguments passed in while calling navigator.pushnamed

    switch (settings.name) {
      case auth:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AuthScreen());
      case login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Login());
       case signup:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignUp());
      case homescreen:
        return customPageBuilder(HomeScreen(),0,-1);
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
        child:  Text('Error'),
      ),
    );
  });
}
