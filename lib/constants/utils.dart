import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  String text, {
  Color? color,
  Color? textColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      elevation: 6,
      behavior: SnackBarBehavior.floating,
      //   action: SnackBarAction(
      //     label: 'Undo',
      //     onPressed: () {
      //   // Some code to undo the change.
      // },
      //   ), for cart add adding items
      width: MediaQuery.of(context).size.width * .87,
      content: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    ),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];

  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return images;
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
const String kEmailNullError = 'Please enter your email';
const String kInvalidEmailError = 'Please enter valid email';
const String kPassNullError = 'Please enter your password';
const String kPassNull2Error = 'Please enter a valid password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = 'Please Enter your name';
const String kPhoneNumberNullError = 'Please enter your phone number';
const String kdetailsNullError = 'Your suggestion is empty';
const String kDetailNumberError =
    'Your suggestion should be at least 20 characters';
const String kNotSimilarPasswordError = 'Not Similar Password';
final RegExp passWordalidatorExp = RegExp(r'^.{6,}$');
const String kvalidatePhoneNumber = 'Phone number is not valid';
