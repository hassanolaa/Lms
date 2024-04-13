



// TextStyle for the app

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theming/colors.dart';




class textstyle{

 static  TextStyle maintitle = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
    color: colors.textcolor,
  );

 static  TextStyle title = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    color: colors.textcolor,
  );

  static  TextStyle subtitle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle body = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );

  

  

  static const TextStyle buttonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );


  static const TextStyle info = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color:Colors.red,
  );

  static const TextStyle disabled = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  static const TextStyle input = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle inputHint = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static const TextStyle inputError = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.red,
  );

  static const TextStyle inputSuccess = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.green,
  );

  static const TextStyle inputDisabled = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );





}