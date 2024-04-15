import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:lms/features/chat/repository/status_repository.dart';
import '../../../const/const.dart';
import '../widgets/navi.dart';

class status extends StatefulWidget {
  const status({super.key});

  @override
  State<status> createState() => _statusState();
}

class _statusState extends State<status> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Scaffold(
            backgroundColor: background,
            body: Column(
              children: [
                SizedBox(
                  height: 70.h,
                ),
                // row "status"and add post icon
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "Status",
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            color: textcolor),
                      ),
                    ),
                    SizedBox(
                      width: 160.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        status_repository.upload_statas_to_storage(1);
                      },
                      child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: backbackground,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 30.sp,
                            color: textcolor,
                          )),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                // row search bar with sort button
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Container(
                        width: 250.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: backbackground,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: textcolor,
                                ),
                                hintText: "Search..",
                                hintStyle: TextStyle(color: textcolor),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CircleAvatar(
                        radius: 20.r,
                        backgroundColor: backbackground,
                        child: Icon(
                          Icons.sort,
                          size: 30.sp,
                          color: textcolor,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                // list of users image horizontally with name
                Container(
                    height: 100.h,
                    child: StreamBuilder(
                      stream: status_repository.get_status(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: color3,
                            ),
                          );
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: GestureDetector(
                                onTap: () {
                                  // context.goNamed('status_view', extra: (
                                  //   snapshot.data!.docs[index]["id"],
                                  //   snapshot.data!.docs[index]["username"],
                                  //   snapshot.data!.docs[index]["url"],
                                  //   snapshot.data!.docs[index]["time"],
                                  //   snapshot.data!.docs[index]["imageUrl"]
                                  // ));
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30.r,
                                      backgroundImage: NetworkImage(snapshot
                                          .data!.docs[index]["imageUrl"]),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]["username"],
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: textcolor),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )),
                // grid view for status
                Expanded(
                  child: StreamBuilder(
                    stream: status_repository.get_status(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: color3,
                          ),
                        );
                      }
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          //childAspectRatio: 0.7,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, right: 10.w, top: 10.h),
                            child: GestureDetector(
                              onTap: () {
                                // context.goNamed('status_view', extra: (
                                //   snapshot.data!.docs[index]["id"],
                                //   snapshot.data!.docs[index]["username"],
                                //   snapshot.data!.docs[index]["url"],
                                //   snapshot.data!.docs[index]["time"],
                                //   snapshot.data!.docs[index]["imageUrl"]
                                // ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: backbackground,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            snapshot.data!.docs[index]["url"]),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.w, top: 10.h),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ).animate(effects: [FadeEffect(duration: Duration(seconds: 1))]),
          )
        : Scaffold(
            backgroundColor: background,
            body: Column(
              children: [
              
                 SizedBox(
                  height: context.height(0.01),
                ),
                // expanded row "massage"and navi widget 
                  Container(
                    height:context.height(0.09) ,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: context.width(0.02)),
                          child: Text(
                            "Status",
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
                            status_repository.upload_statas_to_storage(1);
                          },
                          child: CircleAvatar(
                              radius: ResponsiveValue(
                                context,
                                conditionalValues: [
                                  Condition.equals(name: MOBILE, value: 20.0),
                                  Condition.equals(name: TABLET, value: 20.0),
                                  Condition.equals(name: DESKTOP, value: 30.0),
                                  Condition.equals(name: '4K', value: 40.0)
                                ],
                              ).value,
                              backgroundColor: backbackground,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: context.bigfontsize,
                                color: textcolor,
                              )),
                        ),
                        SizedBox(
                          width: context.width(0.02),
                        ),
                        webnavi(screen: 1,)
                      ],
                    ),
                  ),
                SizedBox(height: context.height(0.1),),
                // row search bar with sort button
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: context.width(0.02)),
                      child: Container(
                        width: context.width(0.35),
                        height: context.height(0.08),
                        decoration: BoxDecoration(
                            color: backbackground,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Padding(
                          padding: EdgeInsets.only(left: context.width(0.01)),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: textcolor,
                                ),
                                hintText: "Search..",
                                hintStyle: TextStyle(color: textcolor),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.width(0.02),
                    ),
                    CircleAvatar(
                        radius: ResponsiveValue(
                          context,
                          conditionalValues: [
                            Condition.equals(name: MOBILE, value: 20.0),
                            Condition.equals(name: TABLET, value: 20.0),
                            Condition.equals(name: DESKTOP, value: 30.0),
                            Condition.equals(name: '4K', value: 40.0)
                          ],
                        ).value,
                        backgroundColor: backbackground,
                        child: Icon(
                          Icons.sort,
                          size: context.smallfontsize,
                          color: textcolor,
                        )),
                  ],
                ),
                SizedBox(
                  height: context.height(0.02),
                ),
                // list of users image horizontally with name
                Container(
                    height: context.height(0.13),
                    child: StreamBuilder(
                      stream: status_repository.get_status(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: color3,
                            ),
                          );
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: GestureDetector(
                                onTap: () {
                                  // context.goNamed('status_view', extra: (
                                  //   snapshot.data!.docs[index]["id"],
                                  //   snapshot.data!.docs[index]["username"],
                                  //   snapshot.data!.docs[index]["url"],
                                  //   snapshot.data!.docs[index]["time"],
                                  //   snapshot.data!.docs[index]["imageUrl"]
                                  // ));
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius:  ResponsiveValue(
                          context,
                          conditionalValues: [
                            Condition.equals(name: MOBILE, value: 20.0),
                            Condition.equals(name: TABLET, value: 20.0),
                            Condition.equals(name: DESKTOP, value: 30.0),
                            Condition.equals(name: '4K', value: 40.0)
                          ],
                        ).value,
                                      backgroundImage: NetworkImage(snapshot
                                          .data!.docs[index]["imageUrl"]),
                                    ),
                                    SizedBox(
                                      height: context.height(0.01),
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]["username"],
                                      style: TextStyle(
                                          fontSize: context.smallfontsize,
                                          fontWeight: FontWeight.bold,
                                          color: textcolor),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )),
                 SizedBox(
                  height: context.height(0.05),
                ),
                // grid view for status
                Expanded(
                  child: StreamBuilder(
                    stream: status_repository.get_status(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: color3,
                          ),
                        );
                      }
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // cross axis count according to screen size
                          crossAxisCount: ResponsiveValue(
                            context,
                            conditionalValues: [
                              Condition.equals(name: MOBILE, value: 2),
                              Condition.equals(name: TABLET, value: 3),
                              Condition.equals(name: DESKTOP, value: 4),
                              Condition.equals(name: '4K', value: 5)
                            ],
                          ).value,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          //childAspectRatio: 0.7,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: context.width(0.01), right: context.width(0.01), top: context.height(0.01)),
                            child: GestureDetector(
                              onTap: () {
                                // context.goNamed('status_view', extra: (
                                //   snapshot.data!.docs[index]["id"],
                                //   snapshot.data!.docs[index]["username"],
                                //   snapshot.data!.docs[index]["url"],
                                //   snapshot.data!.docs[index]["time"],
                                //   snapshot.data!.docs[index]["imageUrl"]
                                // ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: backbackground,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            snapshot.data!.docs[index]["url"]),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.w, top: 10.h),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ).animate(effects: [FadeEffect(duration: Duration(seconds: 1))]),
          );
  }
}
