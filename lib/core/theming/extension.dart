import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

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

  SizedBox height_box(double height) =>
      SizedBox(height: MediaQuery.of(this).size.height * height);
  SizedBox width_box(double width) =>
      SizedBox(width: MediaQuery.of(this).size.width * width);



  double fontSize(double fontsize) {
    double fontFactor = scaleFactor();
    double responsiveFont = fontsize * fontFactor;
    double lowerlimit = fontsize * .8  , upperlimit = fontsize * 1.2;
    return responsiveFont.clamp(lowerlimit, upperlimit);
  }

  double scaleFactor() {
    double width = MediaQuery.of(this).size.width;
    if (width < 600) {
      return width / 400;
    } else if (width < 900) {
      return width / 700;
    } else {
      return width / 1000;
    }
  }
}
