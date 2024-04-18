import 'package:flutter/material.dart';

class colors {
  static Color backgroundcolor = Color.fromRGBO(6, 0, 71, 1);
  static Color primarycolor =  Color.fromRGBO(233,0, 100, 1);
  static Color secondarycolor = Color.fromRGBO(255, 255, 255, 1);
  static Color shadowcolor = Color.fromRGBO(179, 0, 94, 1);
  static Color fontcolor = Color.fromRGBO(255, 255, 255, 1);
static bool isdark = false;

static setMode() {
  isdark = !isdark;

  isdark ? colors.backgroundcolor = Color.fromRGBO(6, 0, 71, 1): colors.backgroundcolor = Color.fromRGBO(201, 200, 202, 1);

  isdark? colors.fontcolor = Color.fromRGBO(255, 255, 255, 1): colors.fontcolor = Color.fromRGBO(6, 0, 71, 1);

  isdark? colors.primarycolor = Color.fromRGBO(233,0, 100, 1): colors.primarycolor = Colors.white;

  isdark? colors.secondarycolor = Color.fromRGBO(255, 255, 255, 1): colors.secondarycolor = Color.fromRGBO(233,0, 100, 1);

  isdark? colors.shadowcolor = Color.fromRGBO(179, 0, 94, 1): colors.shadowcolor = Color.fromRGBO(6, 0, 71, 1);

 
}
 
}
