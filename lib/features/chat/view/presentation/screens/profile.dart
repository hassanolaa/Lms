import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../const/const.dart';
import '../../../model/user.dart';
import '../widgets/edit_profile.dart';
import '../widgets/navi.dart';
import 'package:lms/features/chat/repository/user_repository/user_repository_firebase.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  user? userr;
  bool loaded = false;

  @override
  void initState() {
    // TODO: implement initState
    //get();

    user_repository.getUserInfo().then((user) => {
          setState(() {
            userr = user;
            print(userr!.username);
            loaded = true;
          }),
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Scaffold(
            backgroundColor: background,
            body: loaded == false
                ? Center(
                    child: CircularProgressIndicator(
                    color: color3,
                  ))
                : Column(children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    // row "profile"and add post icon
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color: textcolor),
                          ),
                        ),
                        SizedBox(
                          width: 100.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            print(2222);
                            // SmartDialog.show(builder: (_) {
                            //   return edit_profile();
                            // });
                            WoltModalSheet.show<void>(
                              // pageIndexNotifier: pageIndexNotifier,
                              context: context,
                              pageListBuilder: (modalSheetContext) {
                                return [
                                  WoltModalSheetPage(
                                    child: edit_profile(),
                                  ),
                                ];
                              },
                            );

                            //
                          },
                          child: CircleAvatar(
                              radius: 20.r,
                              backgroundColor: backbackground,
                              child: Icon(
                                Icons.edit,
                                size: 30.sp,
                                color: textcolor,
                              )),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                            radius: 20.r,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.settings,
                              size: 30.sp,
                              color: textcolor,
                            )),
                        SizedBox(
                          width: 20.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            user_repository.signOut();
                           // GoRouter.of(context).go("/signin");
                          },
                          child: CircleAvatar(
                              radius: 20.r,
                              backgroundColor: backbackground,
                              child: Icon(
                                Icons.logout,
                                size: 30.sp,
                                color: textcolor,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // profile image
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 50.r,
                            backgroundImage: NetworkImage(userr!.imageUrl!),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            children: [
                              Text(
                                userr!.username!,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: textcolor),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Active",
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // about text
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 50.w),
                          child: Text(
                            "About",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: textcolor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // about text
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Text(
                        userr!.bio!,
                        // "I am a software engineer and I love to code",
                        style: TextStyle(fontSize: 15.sp, color: textcolor),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // phone number text
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 50.w),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: textcolor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // phone number text
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40.w, right: 20.w),
                          child: Text(
                            userr!.phone!,
                            // "+9234567890",
                            style: TextStyle(fontSize: 15.sp, color: textcolor),
                          ),
                        ),
                      ],
                    )
                  ]
                        // )
                        )
                    .animate(
                        effects: [FadeEffect(duration: Duration(seconds: 1))]),
          )
        : Scaffold(
            backgroundColor: background,
            body: loaded == false
                ? Center(
                    child: CircularProgressIndicator(
                    color: color3,
                  ))
                : Column(children: [
                    SizedBox(
                      height: context.height(0.01),
                    ),
                    // expanded row "profile"and navi widget
                    Container(
                      height: context.height(0.09),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: context.width(0.02)),
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: context.bigfontsize,
                                  fontWeight: FontWeight.bold,
                                  color: textcolor),
                            ),
                          ),
                          SizedBox(
                            width: context.width(0.02),
                          ),
                          GestureDetector(
                            onTap: () {
                              WoltModalSheet.show<void>(
                                // pageIndexNotifier: pageIndexNotifier,
                                context: context,
                                pageListBuilder: (modalSheetContext) {
                                  return [
                                    WoltModalSheetPage(
                                      child: edit_profile(),
                                    ),
                                  ];
                                },
                              );
                            },
                            child: CircleAvatar(
                                radius: ResponsiveValue(
                                  context,
                                  conditionalValues: [
                                    Condition.equals(name: MOBILE, value: 20.0),
                                    Condition.equals(name: TABLET, value: 20.0),
                                    Condition.equals(
                                        name: DESKTOP, value: 30.0),
                                    Condition.equals(name: '4K', value: 40.0)
                                  ],
                                ).value,
                                backgroundColor: backbackground,
                                child: Icon(
                                  Icons.edit,
                                  size: context.bigfontsize,
                                  color: textcolor,
                                )),
                          ),
                          SizedBox(
                            width: context.width(0.02),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                changetheme();
                              });
                            },
                            child: CircleAvatar(
                                radius: ResponsiveValue(
                                  context,
                                  conditionalValues: [
                                    Condition.equals(name: MOBILE, value: 20.0),
                                    Condition.equals(name: TABLET, value: 20.0),
                                    Condition.equals(
                                        name: DESKTOP, value: 30.0),
                                    Condition.equals(name: '4K', value: 40.0)
                                  ],
                                ).value,
                                backgroundColor: backbackground,
                                child: Icon(
                                  Icons.settings,
                                  size: context.bigfontsize,
                                  color: textcolor,
                                )),
                          ),
                          SizedBox(
                            width: context.width(0.02),
                          ),
                          GestureDetector(
                            onTap: () {
                              user_repository.signOut();
                      //        GoRouter.of(context).go("/signin");
                            },
                            child: CircleAvatar(
                                radius: ResponsiveValue(
                                  context,
                                  conditionalValues: [
                                    Condition.equals(name: MOBILE, value: 20.0),
                                    Condition.equals(name: TABLET, value: 20.0),
                                    Condition.equals(
                                        name: DESKTOP, value: 30.0),
                                    Condition.equals(name: '4K', value: 40.0)
                                  ],
                                ).value,
                                backgroundColor: backbackground,
                                child: Icon(
                                  Icons.logout,
                                  size: context.bigfontsize,
                                  color: textcolor,
                                )),
                          ),
                          webnavi(
                            screen: 4,
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: context.height(0.01),
                    ),
                    // profile image
                    Padding(
                      padding: EdgeInsets.only(left: context.width(0.02)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: ResponsiveValue(
                              context,
                              conditionalValues: [
                                Condition.equals(name: MOBILE, value: 30.0),
                                Condition.equals(name: TABLET, value: 30.0),
                                Condition.equals(name: DESKTOP, value: 40.0),
                                Condition.equals(name: '4K', value: 50.0)
                              ],
                            ).value,
                            backgroundImage: NetworkImage(userr!.imageUrl!),
                          ),
                          SizedBox(
                            width: context.width(0.01),
                          ),
                          Column(
                            children: [
                              Text(
                                userr!.username!,
                                style: TextStyle(
                                    fontSize: context.mediumfontsize,
                                    fontWeight: FontWeight.bold,
                                    color: textcolor),
                              ),
                              SizedBox(
                                height: context.height(0.01),
                              ),
                              Text(
                                "Active",
                                style: TextStyle(
                                    fontSize: context.smallfontsize,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height(0.02),
                    ),
                    // about text
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: context.width(0.05)),
                          child: Text(
                            "About",
                            style: TextStyle(
                                fontSize: context.mediumfontsize,
                                fontWeight: FontWeight.bold,
                                color: textcolor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height(0.02),
                    ),
                    // about text
                    Padding(
                      padding: EdgeInsets.only(
                          left: context.width(0.02),
                          right: context.width(0.02)),
                      child: Text(
                        userr!.bio!,
                        // "I am a software engineer and I love to code",
                        style: TextStyle(
                            fontSize: context.smallfontsize, color: textcolor),
                      ),
                    ),
                    SizedBox(
                      height: context.height(0.02),
                    ),
                    // phone number text
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: context.width(0.05)),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                                fontSize: context.mediumfontsize,
                                fontWeight: FontWeight.bold,
                                color: textcolor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // phone number text
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: context.width(0.04),
                              right: context.width(0.03)),
                          child: Text(
                            userr!.phone!,
                            // "+9234567890",
                            style: TextStyle(
                                fontSize: context.smallfontsize,
                                color: textcolor),
                          ),
                        ),
                      ],
                    )
                  ]
                        // )
                        )
                    .animate(
                        effects: [FadeEffect(duration: Duration(seconds: 1))]),
          );
  }
}
