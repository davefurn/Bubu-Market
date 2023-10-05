import 'package:bubu_market/router/route_generator.dart';

import 'package:bubu_market/themes/themes_constants.dart';
import 'package:bubu_market/themes/themes_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your applicationn
  @override
  Widget build(BuildContext context) {
    final messangerKey = GlobalKey<ScaffoldMessengerState>();
    return MaterialApp(
      scaffoldMessengerKey: messangerKey,
      title: 'BuBu-Market',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      initialRoute: AppRoutes.main,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
