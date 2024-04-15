import 'package:lms/features/chat/repository/user_repository/user_repository_firebase.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../const/const.dart';

import '../../../model/status.dart';
import '../../../model/status_typedet.dart';
import '../widgets/status_reply.dart';

class status_view extends StatefulWidget {
  status_view({super.key, required this.status});
  // status_model? status;
  status_route? status;

  @override
  State<status_view> createState() => _status_viewState();
}

class _status_viewState extends State<status_view> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Scaffold(
            backgroundColor: backbackground,
            floatingActionButton:
                user_repository.getCurrentUser()!.uid != widget.status!.$1
                    ? status_reply(
                        status: status_model(
                            imageUrl: widget.status!.$5,
                            username: widget.status!.$2,
                            id: widget.status!.$1),
                        id: widget.status!.$1,
                      )
                    : SizedBox(),
            body: Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Colors.blue,
                //     Colors.purple,
                //   ],
                // ),
                image: DecorationImage(
                  image: NetworkImage(widget.status!.$3),
                  fit: BoxFit.none,
                ),
              ),
              child: Column(children: [
                // status view screen
                SizedBox(
                  height: 50.h,
                ),
                // row containing userimage , username and time
                Row(
                  children: [
                    // backarrow
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: GestureDetector(
                        onTap: () {
                     //     GoRouter.of(context).go('/navi');
                        },
                        child: CircleAvatar(
                            radius: 15.r,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20.sp,
                              color: textcolor,
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundImage: NetworkImage(widget.status!.$5),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.status!.$2!,
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: textcolor),
                        ),
                        Text(
                          widget.status!.$4!,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: textcolor),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            ).animate(effects: [FadeEffect(duration: Duration(seconds: 1))]),
          )
        : Scaffold(
            backgroundColor: backbackground,
            floatingActionButton:
                user_repository.getCurrentUser()!.uid != widget.status!.$1
                    ? status_reply(
                        status: status_model(
                            imageUrl: widget.status!.$5,
                            username: widget.status!.$2,
                            id: widget.status!.$1),
                        id: widget.status!.$1,
                      )
                    : SizedBox(),
            body: Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Colors.blue,
                //     Colors.purple,
                //   ],
                // ),
                image: DecorationImage(
                  image: NetworkImage(widget.status!.$3),
                  fit: BoxFit.none,
                ),
              ),
              child: Column(children: [
                // status view screen
                SizedBox(
                  height: 50.h,
                ),
                // row containing userimage , username and time
                Row(
                  children: [
                    // backarrow
                    Padding(
                      padding: EdgeInsets.only(left: context.width(0.01)),
                      child: GestureDetector(
                        onTap: () {
                       //   GoRouter.of(context).go('/navi');
                        },
                        child: CircleAvatar(
                            radius: ResponsiveValue(
                          context,
                          conditionalValues: [
                            Condition.equals(name: MOBILE, value: 15.0),
                            Condition.equals(name: TABLET, value: 15.0),
                            Condition.equals(name: DESKTOP, value: 20.0),
                            Condition.equals(name: '4K', value: 30.0)
                          ],
                        ).value,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: context.smallfontsize,
                              color: textcolor,
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: CircleAvatar(
                        radius: ResponsiveValue(
                          context,
                          conditionalValues: [
                            Condition.equals(name: MOBILE, value: 30.0),
                            Condition.equals(name: TABLET, value: 30.0),
                            Condition.equals(name: DESKTOP, value: 40.0),
                            Condition.equals(name: '4K', value: 45.0)
                          ],
                        ).value,
                        backgroundImage: NetworkImage(widget.status!.$5),
                      ),
                    ),
                    SizedBox(
                      width: context.width(0.01),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.status!.$2!,
                          style: TextStyle(
                              fontSize: context.mediumfontsize,
                              fontWeight: FontWeight.bold,
                              color: textcolor),
                        ),
                        Text(
                          widget.status!.$4!,
                          style: TextStyle(
                              fontSize: context.smallfontsize,
                              fontWeight: FontWeight.bold,
                              color: textcolor),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            ).animate(effects: [FadeEffect(duration: Duration(seconds: 1))]),
          );
  }
}
