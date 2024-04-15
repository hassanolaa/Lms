import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:lms/features/chat/repository/massage_repository.dart';

import '../../../const/const.dart';

class file_massage extends StatefulWidget {
  file_massage(
      {super.key,
      required this.username,
      required this.time,
      required this.massage,
      required this.imageUrl,
      required this.seen,
      required this.massageid,
      required this.able_to_delete,
      required this.chatid
      });
  String username;
  String time;
  String massage;
  String imageUrl;
  bool seen;
 String massageid;
  bool able_to_delete;
  String chatid;

  @override
  State<file_massage> createState() => _file_massageState();
}

class _file_massageState extends State<file_massage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
    ? GestureDetector(
      onTap: () {
     //   context.goNamed( 'view',extra: (widget.massage));
      },
      child: GestureDetector(
        onLongPress: () {
          if (widget.able_to_delete) {
            showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: background,
                title: Text('Delete',style: TextStyle(color: textcolor),),
                content: Text('Do you want to delete this massage?',style: TextStyle(color: textcolor)),
                actions: [
                  TextButton(
                    onPressed: () {
                      massage_repository.deleteMessage(
                          widget.chatid, widget.massageid);
                    },
                    child: Text('Delete',style: TextStyle(color: color2)),
                  ),
                ],
              );
            },
          );
          }
        },
        child: Container(
          // text massage with user image and name and time
          width: 70.w,
          // height: 80.h,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              //user image
              Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(widget.imageUrl),
                ),
              ),
              //user name and time
              Padding(
                padding: EdgeInsets.only(left: 2.w, top: 8.w),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.username,
                          style: TextStyle(
                            color: textcolor,
                              fontSize: 10.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                        width: 90.w,
                      ),
                      Text(
                        widget.time,
                        style: TextStyle(
                            color: textcolor,
                            fontSize: 8.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      widget.seen
                          ? Icon(
                              Icons.done_all,
                              size: 15.sp,
                              color: color3,
                            )
                          : Icon(
                              Icons.done,
                              size: 15.sp,
                              color: textcolor,
                            ),
                      ],
                    ),
                    //file massage
                    Container(
                      width: 190.w,
                      height: 40.h,
                      child: Padding(
                          padding: EdgeInsets.only(left: 40.w),
                          child: Row(
                            children: [
                              Text("Pdf",style: TextStyle(color: Colors.black),),
                              SizedBox(
                                width: 30.w,
                              ),
                              Icon(
                                Icons.file_copy,
                                size: 30.sp,
                                color: textcolor,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
    :
    GestureDetector(
      onTap: () {
     //   context.goNamed( 'view',extra: (widget.massage));
      },
      child: GestureDetector(
        onLongPress: () {
          if (widget.able_to_delete) {
            showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: background,
                title: Text('Delete',style: TextStyle(color: textcolor),),
                content: Text('Do you want to delete this massage?',style: TextStyle(color: textcolor)),
                actions: [
                  TextButton(
                    onPressed: () {
                      massage_repository.deleteMessage(
                          widget.chatid, widget.massageid);
                    },
                    child: Text('Delete',style: TextStyle(color: color2)),
                  ),
                ],
              );
            },
          );
          }
        },
        child: Container(
          // text massage with user image and name and time
          width: 70.w,
          // height: 80.h,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              //user image
              Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: CircleAvatar(
                  radius: ResponsiveValue(
                                      context,
                                      conditionalValues: [
                                        Condition.equals(name: MOBILE, value: 10.0),
                                        Condition.equals(name: TABLET, value: 10.0),
                                        Condition.equals(name: DESKTOP, value: 20.0),
                                        Condition.equals(name: '4K', value: 25.0)
                                      ],
                                    ).value,
                  backgroundImage: NetworkImage(widget.imageUrl),
                ),
              ),
              //user name and time
              Padding(
                padding: EdgeInsets.only(left: 2.w, top: context.height(0.01)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.username,
                          style: TextStyle(
                            color: textcolor,
                              fontSize: context.smallfontsize, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                       width: context.width(0.05),
                      ),
                      Text(
                        widget.time,
                        style: TextStyle(
                            color: textcolor,
                            fontSize:context.smallfontsize, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                       width: context.width(0.01),
                      ),
                      widget.seen
                          ? Icon(
                              Icons.done_all,
                              size: context.smallfontsize,
                              color: color3,
                            )
                          : Icon(
                              Icons.done,
                              size: context.smallfontsize,
                              color: textcolor,
                            ),
                      ],
                    ),
                    //file massage
                    Container(
                      width: context.width(0.2),
                      height: context.height(0.05),
                      child: Padding(
                          padding: EdgeInsets.only(left: context.width(0.05)),
                          child: Row(
                            children: [
                              Text("file",style: TextStyle(color: Colors.black,fontSize: context.mediumfontsize ),),
                              SizedBox(
                                width: context.width(0.03),
                              ),
                              Icon(
                                Icons.file_copy,
                                size: context.smallfontsize,
                                color: textcolor,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
