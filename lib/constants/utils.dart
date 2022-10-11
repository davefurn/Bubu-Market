import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 6,
      behavior: SnackBarBehavior.floating,
    //   action: SnackBarAction(
    //     label: 'Undo',
    //     onPressed: () {
    //   // Some code to undo the change.
    // },
    //   ), for cart add adding items
      width: MediaQuery.of(context).size.width * .87,
      content: 
      Text(text),
    ),
  ); 
}
