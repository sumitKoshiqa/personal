import 'package:flutter/material.dart';

class CustomDecoration {


  static BoxDecoration gradientLight = const BoxDecoration(
      borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50),
    topRight: Radius.circular(50),
  ),
    gradient: LinearGradient(
        colors: [
          Color(0xffDDAAB0),
          Color(0xffE6CDCD),
        ],
        begin: FractionalOffset(1.0, 1.0),
        end: FractionalOffset(0.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );



}
