import 'package:flutter/material.dart';

class GlobalVariables {
  static const colorAccent = Colors.yellowAccent;
  static const colorPrimary = Color(0xfff1d100);
  static const colorSecondary = Colors.black;
  static const scaffoldBackGroundColor = Colors.white;
   static const unselectedTransparent = Colors.transparent;
  static const appBarGradient = LinearGradient(colors: [
    Color.fromARGB(255, 29, 201, 192),
    Color.fromARGB(255, 125, 221, 216),
  ]);

   // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images.unsplash.com/photo-1455849318743-b2233052fcff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
    'https://images.unsplash.com/photo-1523800378286-dae1f0dae656?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Electronics',
      'image': 'assets/images/electronics.jpeg',
    },
    {
      'title': 'Phones &\nAccessories',
      'image': 'assets/images/phones and accessories.jpeg',
    },
    {
      'title': 'Clothes',
      'image': 'assets/images/clothes.jpeg',
    },
    {
      'title': 'Footwears',
      'image': 'assets/images/footware.jpeg',
    },
    {
      'title': 'Jewelries',
      'image': 'assets/images/jewelries.jpeg',
    },
    {
      'title': 'Laptops',
      'image': 'assets/images/laptops.jpeg',
    },
    {
      'title': 'Vehicles',
      'image': 'assets/images/vehicles.jpeg',
    },
    {
      'title': 'Home Appliances',
      'image': 'assets/images/home appliances.jpeg',
    },
     {
      'title': 'Sports &\nFitness',
      'image': 'assets/images/Sports and fitness.jpeg',
    },
     {
      'title': 'Beauty &\nHealth',
      'image': 'assets/images/beauty and health.jpeg',
    },
  ];
}
