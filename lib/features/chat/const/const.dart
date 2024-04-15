import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

final Color color1 = Color(0xff41ffee);
final Color color2 = Color(0xff1144a7);
final Color color3 = Color(0xffff1581);
final Color color4 = Color(0xff1d5ad0);
Color backbackground = Color(0xff161616); // Color(0xffe6e6e6);
Color background = Colors.black; //Color.fromARGB(255, 255, 255, 255);
Color textcolor = Color(0xffff1581); //Color(0xff000000);
Color textmassagecolor = Colors.white;
String background_image = 'assets/back2.gif';

changetheme() {
  if (background_image == 'assets/back2.gif') {
    background_image = 'assets/back1.gif';
  } else {
    background_image = 'assets/back2.gif';
  }
  if (backbackground == Color(0xff161616)) {
    backbackground = Color(0xffe6e6e6);
  } else {
    backbackground = Color(0xff161616);
  }
  if (background == Colors.black) {
    background = Color.fromARGB(255, 255, 255, 255);
  }else{
    background = Colors.black;
  }
  if (textcolor == Color(0xffff1581)) {
    textcolor = Color(0xff000000);
  } else {
    textcolor = Color(0xffff1581);
  }
  if (textmassagecolor == Colors.white) {
    textmassagecolor = Colors.black;
  } else {
    textmassagecolor = Colors.white;
  }
}

// extension from buildcontext

extension responsiveContext on BuildContext {
  double get bigfontsize => ResponsiveValue(
        this,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 30.0),
          Condition.equals(name: TABLET, value: 30.0),
          Condition.equals(name: DESKTOP, value: 40.0),
          Condition.equals(name: '4K', value: 50.0)
        ],
      ).value;

  double get mediumfontsize => ResponsiveValue(
        this,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 20.0),
          Condition.equals(name: TABLET, value: 20.0),
          Condition.equals(name: DESKTOP, value: 30.0),
          Condition.equals(name: '4K', value: 40.0)
        ],
      ).value;
  // small font size
  double get smallfontsize => ResponsiveValue(
        this,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 10.0),
          Condition.equals(name: TABLET, value: 10.0),
          Condition.equals(name: DESKTOP, value: 20.0),
          Condition.equals(name: '4K', value: 30.0)
        ],
      ).value;
  // tiny font size
  double get tinyfontsize => ResponsiveValue(
        this,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 8.0),
          Condition.equals(name: TABLET, value: 8.0),
          Condition.equals(name: DESKTOP, value: 15.0),
          Condition.equals(name: '4K', value: 25.0)
        ],
      ).value;    

  //  height using MediaQuery
  double height(double heightsize) =>
      MediaQuery.of(this).size.height * heightsize;
  // width using MediaQuery
  double width(double widthsize) => MediaQuery.of(this).size.width * widthsize;
}
