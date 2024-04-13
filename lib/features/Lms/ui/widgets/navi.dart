

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theming/colors.dart';
import 'package:lms/features/Lms/ui/screens/ai_home.dart';
import 'package:lms/features/Lms/ui/screens/courses.dart';
import 'package:lms/features/Lms/ui/screens/home.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../screens/ai.dart';
import '../screens/profile.dart';


List<Widget> _SelectedTab = [
  home(),
  courses(),
 // massages(),
//  status(),
  ai_home(),
  Container(),

  //calls(),
  profile(),
];

class navi extends StatefulWidget {
  const navi({super.key});

  @override
  State<navi> createState() => _naviState();
}

class _naviState extends State<navi> {
  var _selectedTab = _SelectedTab[0];
  int selected = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab[i];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Scaffold(
            body: _selectedTab,
            floatingActionButton: Container(
                height: 70.h,
                margin: EdgeInsets.only(left: 40, right: 20, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [colors.color1, colors.color2],
                  ),
                  // image: DecorationImage(
                  //   image: AssetImage(colors.background_image),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 0;
                          _handleIndexChanged(0);
                        });
                      },
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: selected == 0 ? colors.color1 : Colors.transparent,
                          border: Border.all(color: colors.color1, width: 1),
                        ),
                        child: Icon(
                          Icons.home_outlined,
                          color: colors.color3,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 1;
                          _handleIndexChanged(1);
                        });
                      },
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: selected == 1 ? colors.color1 : Colors.transparent,
                          border: Border.all(color: colors.color1, width: 1),
                        ),
                        child: Icon(
                          CupertinoIcons.book_circle,
                          color: colors.color3,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 2;
                          _handleIndexChanged(2);
                        });
                      },
                      child: CircleAvatar(
                        radius: 35.r,
                        backgroundColor:colors.color3,
                        child: Icon(
                          Icons.auto_fix_high_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 3;
                          _handleIndexChanged(3);
                        });
                      },
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: selected == 3 ? colors.color1 : Colors.transparent,
                          border: Border.all(color: colors.color1, width: 1),
                        ),
                        child: Icon(
                          CupertinoIcons.chat_bubble_2,
                          color: colors.color3,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 4;
                          _handleIndexChanged(4);
                        });
                      },
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: selected == 4 ? colors.color1 : Colors.transparent,
                          border: Border.all(color: colors.color1, width: 1),
                        ),
                        child: Icon(
                          Icons.person_outline_outlined,
                          color: colors.color3,
                        ),
                      ),
                    ),
                  ],
                )
                //  DotNavigationBar(
                //   borderRadius: 20.r,
                //   backgroundColor: Colors.transparent,

                //   currentIndex: _SelectedTab.indexOf(_selectedTab),
                //   onTap: (i) {
                //     _handleIndexChanged(i);
                //   },
                //   // dotIndicatorColor: Colors.black,
                //   items: [
                //     /// Massages
                //     DotNavigationBarItem(
                //       icon: Column(
                //         children: [
                //           Icon(Icons.chat_bubble_outline_outlined),
                //           Text('Massages'),
                //         ],
                //       ),
                //       selectedColor: Colors.purple,
                //     ),

                //     /// Likes
                //     DotNavigationBarItem(
                //        icon: Column(
                //         children: [
                //           Icon(Icons.image_outlined),
                //           Text('Massages'),
                //         ],
                //       ),
                //       selectedColor: Colors.pink,
                //     ),
                //  /// Search
                //     DotNavigationBarItem(
                //       icon:Icon(Icons.add),
                //       selectedColor: Colors.orange,
                //     ),
                //     /// Search
                //     DotNavigationBarItem(
                //       icon: Column(
                //         children: [
                //           Icon(Icons.image_outlined),
                //           Text('Massages'),
                //         ],
                //       ),
                //       selectedColor: Colors.orange,
                //     ),

                //     /// Profile
                //     DotNavigationBarItem(
                //        icon: Column(
                //         children: [
                //           Icon(Icons.image_outlined),
                //           Text('Massages'),
                //         ],
                //       ),
                //       selectedColor: Colors.teal,
                //     ),
                //   ],
                // ),
                ),
          )
        : Scaffold(
            body: Text('Desktop'),
          );
  }
}
