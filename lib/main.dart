import 'package:bubu_market/router/route_generator.dart';
import 'package:bubu_market/themes/themes_constants.dart';
import 'package:bubu_market/themes/themes_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuBu-Market Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      initialRoute: RouteGenerator.auth,
       onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

