import 'package:lms/features/chat/repository/massage_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../const/const.dart';

class image_massage extends StatefulWidget {
  image_massage(
      {super.key,
      required this.username,
      required this.time,
      required this.massage,
      required this.imageUrl,
      required this.seen,
      required this.massageid,
      required this.able_to_delete,
      required this.chatid});
  String username;
  String time;
  String massage;
  String imageUrl;
  bool seen;
  String massageid;
  bool able_to_delete;
  String chatid;
  @override
  State<image_massage> createState() => _image_massageState();
}

class _image_massageState extends State<image_massage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? GestureDetector(
            onLongPress: () {
              if (widget.able_to_delete) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: background,
                      title: Text(
                        'Delete',
                        style: TextStyle(color: textcolor),
                      ),
                      content: Text('Do you want to delete this massage?',
                          style: TextStyle(color: textcolor)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            massage_repository.deleteMessage(
                                widget.chatid, widget.massageid);
                          },
                          child:
                              Text('Delete', style: TextStyle(color: color2)),
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
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 90.w,
                            ),
                            Text(
                              widget.time,
                              style: TextStyle(
                                  color: textcolor,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold),
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
                        //image massage
                        Container(
                          width: 210.w,
                          height: 160.h,
                          child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Image(
                                image: NetworkImage(widget.massage),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : GestureDetector(
            onLongPress: () {
              if (widget.able_to_delete) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: background,
                      title: Text(
                        'Delete',
                        style: TextStyle(color: textcolor),
                      ),
                      content: Text('Do you want to delete this massage?',
                          style: TextStyle(color: textcolor)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            massage_repository.deleteMessage(
                                widget.chatid, widget.massageid);
                          },
                          child:
                              Text('Delete', style: TextStyle(color: color2)),
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
                                  fontSize: context.smallfontsize,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                width: context.width(0.05),
                            ),
                            Text(
                              widget.time,
                              style: TextStyle(
                                  color: textcolor,
                                  fontSize: context.smallfontsize,
                                  fontWeight: FontWeight.bold),
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
                        //image massage
                        Container(
                          width: context.width(0.2),
                          height: context.height(0.15),
                          child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Image(
                                image: NetworkImage(widget.massage),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
