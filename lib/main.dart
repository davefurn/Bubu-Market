import 'package:bubu_market/router/route_generator.dart';

import 'package:bubu_market/themes/themes_constants.dart';
import 'package:bubu_market/themes/themes_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/network/api_client.dart';
import 'data/respository/api_respository.dart';
import 'data/sharedpref/shared_preferences_helper.dart';

final sharedPreferences =
    FutureProvider((_) async => await SharedPreferences.getInstance());

final sharedPreferencesHelper = Provider(
    (ref) => SharedPreferencesHelper(ref.watch(sharedPreferences).maybeWhen(
          data: (value) => value,
          orElse: () => null,
        )));

final apiService =
    Provider((ref) => ApiService(ref.read(sharedPreferencesHelper)));

final apiRepository = Provider((ref) => ApiRepository(
    apiService: ref.read(apiService),
    preferencesHelper: ref.read(sharedPreferencesHelper)));







void main() {
  runApp(const ProviderScope(child: MyApp()));
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
