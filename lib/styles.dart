import 'package:flutter/material.dart';

abstract class Styles {
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.blue,
    fontSize: 18,
  );
  static const BorderRadius bottomSheetBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  );

  static const Color clearColor = Color(0xFF737373);
//  static const TextStyle productRowItemName = TextStyle(
//    color: Color.fromRGBO(0, 0, 0, 0.8),
//    fontSize: 18,
//    fontStyle: FontStyle.normal,
//    fontWeight: FontWeight.normal,
//  );
//
//  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);
}
