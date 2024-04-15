import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:lms/features/chat/repository/user_repository/user_repository_firebase.dart';
import 'package:lms/features/chat/repository/massage_repository.dart';
import '../../../const/const.dart';
import '../widgets/all_users.dart';
import '../widgets/navi.dart';
import 'chat.dart';
import 'package:lms/features/chat/repository/status_repository.dart';


class massages extends StatefulWidget {
  const massages({super.key});

  @override
  State<massages> createState() => _massagesState();
}

class _massagesState extends State<massages> {
  String userimage = "";
  String username = "";
  String chatid = "";
  String search = "";
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    user_repository.userLastSeen();
    super.initState();
  }

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
                // row "massage"and add post icon
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "Messages",
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            color: textcolor),
                      ),
                    ),
                    SizedBox(
                      width: 120.w,
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
                    GestureDetector(
                      onTap: () {
                        WoltModalSheet.show<void>(
                          // pageIndexNotifier: pageIndexNotifier,
                          context: context,
                          pageListBuilder: (modalSheetContext) {
                            return [
                              WoltModalSheetPage(
                                backgroundColor: backbackground,
                                child: all_users(),
                              ),
                            ];
                          },
                        );
                      },
                      child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: backbackground,
                          child: Icon(
                            Icons.add_circle_outline,
                            size: 30.sp,
                            color: textcolor,
                          )),
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
                            style: TextStyle(color: textcolor),
                            // controller: searchController,
                            onChanged: (value) {
                              setState(() {
                                search = value;
                                print(search);
                              });
                            },
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
                      stream: massage_repository
                          .getChatList(user_repository.getCurrentUser()!.uid),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return Center(
                            child: CircularProgressIndicator(
                              color: color3,
                            ),
                          );
                        }
                        else{
                               return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: GestureDetector(
                                onTap: () {
                                  // context.goNamed('chat', extra: (
                                  //   snapshot.data!.docs[index]['chatId'],
                                  //   user_repository.getCurrentUser()!.uid ==
                                  //           snapshot.data!.docs[index]['userId']
                                  //       ? snapshot.data!.docs[index]
                                  //           ['otherUserName']
                                  //       : snapshot.data!.docs[index]
                                  //           ['userName'],
                                  //   user_repository.getCurrentUser()!.uid ==
                                  //           snapshot.data!.docs[index]['userId']
                                  //       ? snapshot.data!.docs[index]
                                  //           ['otherUserImage']
                                  //       : snapshot.data!.docs[index]
                                  //           ['userImage']
                                  // ));
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30.r,
                                      backgroundImage: NetworkImage(
                                          user_repository
                                                      .getCurrentUser()!
                                                      .uid ==
                                                  snapshot.data!.docs[index]
                                                      ['userId']
                                              ? snapshot.data!.docs[index]
                                                  ['otherUserImage']
                                              : snapshot.data!.docs[index]
                                                  ['userImage']),
                                    ),
                                    Text(
                                      user_repository.getCurrentUser()!.uid ==
                                              snapshot.data!.docs[index]
                                                  ['userId']
                                          ? snapshot.data!.docs[index]
                                              ['otherUserName']
                                          : snapshot.data!.docs[index]
                                              ['userName'],
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
                   
                        }
                      },
                    )),
                // list of users image or search result
                search == ""
                    ? Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: massage_repository.getChatList(
                              user_repository.getCurrentUser()!.uid),
                          builder: (context, snapshot) {
                            if(snapshot.connectionState==ConnectionState.waiting){
                              return Center(
                                child: CircularProgressIndicator(
                                  color: color3,
                                ),
                              );
                            }
                            else{
                               if(snapshot.data!.docs.length==0){
                                 return Center(
                                   child: Text("No Chats Found\n let's start a new chat",style: TextStyle(color: textcolor,fontSize: 20.sp),),
                                 );
                               }
                               else{
                                    return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w, right: 20.w, top: 10.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      // context.goNamed('chat', extra: (
                                      //   snapshot.data!.docs[index]['chatId'],
                                      //   user_repository.getCurrentUser()!.uid ==
                                      //           snapshot.data!.docs[index]
                                      //               ['userId']
                                      //       ? snapshot.data!.docs[index]
                                      //           ['otherUserName']
                                      //       : snapshot.data!.docs[index]
                                      //           ['userName'],
                                      //   user_repository.getCurrentUser()!.uid ==
                                      //           snapshot.data!.docs[index]
                                      //               ['userId']
                                      //       ? snapshot.data!.docs[index]
                                      //           ['otherUserImage']
                                      //       : snapshot.data!.docs[index]
                                      //           ['userImage']
                                      // ));
                                    },
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30.r,
                                          backgroundImage: NetworkImage(
                                              user_repository
                                                          .getCurrentUser()!
                                                          .uid ==
                                                      snapshot.data!.docs[index]
                                                          ['userId']
                                                  ? snapshot.data!.docs[index]
                                                      ['otherUserImage']
                                                  : snapshot.data!.docs[index]
                                                      ['userImage']),
                                          //backgroundImage:
                                          // AssetImage("assets/images/user.png"),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              user_repository
                                                          .getCurrentUser()!
                                                          .uid ==
                                                      snapshot.data!.docs[index]
                                                          ['userId']
                                                  ? snapshot.data!.docs[index]
                                                      ['otherUserName']
                                                  : snapshot.data!.docs[index]
                                                      ['userName'],
                                              style: TextStyle(
                                                  color: color4,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                          ['lastmassage'] !=
                                                      null
                                                  ? snapshot.data!.docs[index]
                                                      ['lastmassage']
                                                  : "",
                                              style: TextStyle(
                                                  color: color3,
                                                  fontSize: 15.sp),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            width: 80.w,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data!.docs[index]
                                                      ['lastmassageTime'] !=
                                                  null
                                              ? snapshot.data!.docs[index]
                                                  ['lastmassageTime']
                                              : "",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: textcolor),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                                }
                              }
                          },
                        ),
                      )
                    : Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: massage_repository.searchChat(search),
                          builder: (context, snapshot) {
                           if(snapshot.connectionState==ConnectionState.waiting){
                          return  CircularProgressIndicator(
                              color: color3,
                            );
                           }
                           else{
                            if(snapshot.data!.docs.length==0){
                              return Center(
                                child: Text("No Chats Found\n let's start a new chat",style: TextStyle(color: textcolor,fontSize: 20.sp),),
                              );

                            }
                            else{
                                  return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w, right: 20.w, top: 10.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      // context.goNamed('chat', extra: (
                                      //   snapshot.data!.docs[index]['chatId'],
                                      //   user_repository.getCurrentUser()!.uid ==
                                      //           snapshot.data!.docs[index]
                                      //               ['userId']
                                      //       ? snapshot.data!.docs[index]
                                      //           ['otherUserName']
                                      //       : snapshot.data!.docs[index]
                                      //           ['userName'],
                                      //   user_repository.getCurrentUser()!.uid ==
                                      //           snapshot.data!.docs[index]
                                      //               ['userId']
                                      //       ? snapshot.data!.docs[index]
                                      //           ['otherUserImage']
                                      //       : snapshot.data!.docs[index]
                                      //           ['userImage']
                                      // ));
                                    },
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30.r,
                                          backgroundImage: NetworkImage(
                                              user_repository
                                                          .getCurrentUser()!
                                                          .uid ==
                                                      snapshot.data!.docs[index]
                                                          ['userId']
                                                  ? snapshot.data!.docs[index]
                                                      ['otherUserImage']
                                                  : snapshot.data!.docs[index]
                                                      ['userImage']),
                                          //backgroundImage:
                                          // AssetImage("assets/images/user.png"),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              user_repository
                                                          .getCurrentUser()!
                                                          .uid ==
                                                      snapshot.data!.docs[index]
                                                          ['userId']
                                                  ? snapshot.data!.docs[index]
                                                      ['otherUserName']
                                                  : snapshot.data!.docs[index]
                                                      ['userName'],
                                              style: TextStyle(
                                                  color: color4,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                          ['lastmassage'] !=
                                                      null
                                                  ? snapshot.data!.docs[index]
                                                      ['lastmassage']
                                                  : "",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                color: color3,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            width: 80.w,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data!.docs[index]
                                                      ['lastmassageTime'] !=
                                                  null
                                              ? snapshot.data!.docs[index]
                                                  ['lastmassageTime']
                                              : "",
                                          style: TextStyle(
                                            color: color3,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                        
                            }
                           }
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
                  height: context.height(0.09),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: context.width(0.02)),
                        child: Text(
                          "Messages",
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
                      GestureDetector(
                        onTap: () {
                          WoltModalSheet.show<void>(
                            // pageIndexNotifier: pageIndexNotifier,
                            context: context,
                            pageListBuilder: (modalSheetContext) {
                              return [
                                WoltModalSheetPage(
                                  backgroundColor: backbackground,
                                  child: all_users(),
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
                                Condition.equals(name: DESKTOP, value: 30.0),
                                Condition.equals(name: '4K', value: 40.0)
                              ],
                            ).value,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.add_circle_outline,
                              size: context.bigfontsize,
                              color: textcolor,
                            )),
                      ),
                      webnavi(
                        screen: 0,
                      )
                    ],
                  ),
                ),

                // massages container
                Container(
                  width: context.width(1),
                  height: context.height(0.9),
                  color: backbackground,
                  child: Row(
                    children: [
                      // list of users image and name or search result
                      Container(
                        width: context.width(0.3),
                        color: background,
                        child: Column(
                          children: [
                            SizedBox(
                              height: context.height(0.02),
                            ),
                            // search bar
                            Row(
                              children: [
                                Container(
                                  width: context.width(0.25),
                                  height: context.height(0.05),
                                  decoration: BoxDecoration(
                                      color: backbackground,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: context.width(0.01)),
                                    child: TextField(
                                      style: TextStyle(color: textcolor),
                                      // controller: searchController,
                                      onChanged: (value) {
                                        setState(() {
                                          search = value;
                                          print(search);
                                        });
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: textcolor,
                                          ),
                                          hintText: "Search..",
                                          hintStyle:
                                              TextStyle(color: textcolor),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.width(0.001),
                                ),
                                CircleAvatar(
                                    radius: ResponsiveValue(
                                      context,
                                      conditionalValues: [
                                        Condition.equals(
                                            name: MOBILE, value: 10.0),
                                        Condition.equals(
                                            name: TABLET, value: 10.0),
                                        Condition.equals(
                                            name: DESKTOP, value: 20.0),
                                        Condition.equals(
                                            name: '4K', value: 25.0)
                                      ],
                                    ).value,
                                    backgroundColor: backbackground,
                                    child: Icon(
                                      Icons.sort,
                                      size: ResponsiveValue(
                                        context,
                                        conditionalValues: [
                                          Condition.equals(
                                              name: MOBILE, value: 10.0),
                                          Condition.equals(
                                              name: TABLET, value: 10.0),
                                          Condition.equals(
                                              name: DESKTOP, value: 20.0),
                                          Condition.equals(
                                              name: '4K', value: 25.0)
                                        ],
                                      ).value,
                                      color: textcolor,
                                    )),
                              ],
                            ),
                            // list of users image and name  or search result
                            // list of users image or search result
                            search == ""
                                ? Expanded(
                                    child: StreamBuilder<QuerySnapshot>(
                                      stream: massage_repository.getChatList(
                                          user_repository
                                              .getCurrentUser()!
                                              .uid),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: color3,
                                            ),
                                          );
                                        } else {
                                          if (snapshot.data!.docs.length == 0) {
                                            return Center(
                                              child: Text(
                                                "No Chats Found\n let's start a new chat",
                                                style: TextStyle(
                                                    color: textcolor,
                                                    fontSize: context
                                                        .mediumfontsize),
                                              ),
                                            );
                                          }
                                          else{
                                               return ListView.builder(
                                            itemCount:
                                                snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    left: context.width(0.01),
                                                    right: context.width(0.01),
                                                    top: 10.h),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      chatid = snapshot
                                                              .data!.docs[index]
                                                          ['chatId'];
                                                      username = user_repository
                                                                  .getCurrentUser()!
                                                                  .uid ==
                                                              snapshot.data!
                                                                          .docs[
                                                                      index]
                                                                  ['userId']
                                                          ? snapshot.data!
                                                                  .docs[index]
                                                              ['otherUserName']
                                                          : snapshot.data!
                                                                  .docs[index]
                                                              ['userName'];
                                                      userimage = user_repository
                                                                  .getCurrentUser()!
                                                                  .uid ==
                                                              snapshot.data!
                                                                          .docs[
                                                                      index]
                                                                  ['userId']
                                                          ? snapshot.data!
                                                                  .docs[index]
                                                              ['otherUserImage']
                                                          : snapshot.data!
                                                                  .docs[index]
                                                              ['userImage'];
                                                    });
                                                    // context.goNamed('chat', extra: (
                                                    //   snapshot.data!.docs[index]['chatId'],
                                                    //   user_repository.getCurrentUser()!.uid ==
                                                    //           snapshot.data!.docs[index]
                                                    //               ['userId']
                                                    //       ? snapshot.data!.docs[index]
                                                    //           ['otherUserName']
                                                    //       : snapshot.data!.docs[index]
                                                    //           ['userName'],
                                                    //   user_repository.getCurrentUser()!.uid ==
                                                    //           snapshot.data!.docs[index]
                                                    //               ['userId']
                                                    //       ? snapshot.data!.docs[index]
                                                    //           ['otherUserImage']
                                                    //       : snapshot.data!.docs[index]
                                                    //           ['userImage']
                                                    // ));
                                                  },
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: ResponsiveValue(
                                                          context,
                                                          conditionalValues: [
                                                            Condition.equals(
                                                                name: MOBILE,
                                                                value: 20.0),
                                                            Condition.equals(
                                                                name: TABLET,
                                                                value: 20.0),
                                                            Condition.equals(
                                                                name: DESKTOP,
                                                                value: 30.0),
                                                            Condition.equals(
                                                                name: '4K',
                                                                value: 35.0)
                                                          ],
                                                        ).value,
                                                        backgroundImage: NetworkImage(user_repository
                                                                    .getCurrentUser()!
                                                                    .uid ==
                                                                snapshot.data!
                                                                            .docs[
                                                                        index]
                                                                    ['userId']
                                                            ? snapshot.data!
                                                                    .docs[index]
                                                                [
                                                                'otherUserImage']
                                                            : snapshot.data!
                                                                    .docs[index]
                                                                ['userImage']),
                                                        //backgroundImage:
                                                        // AssetImage("assets/images/user.png"),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            context.width(0.02),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            user_repository
                                                                        .getCurrentUser()!
                                                                        .uid ==
                                                                    snapshot.data!
                                                                            .docs[index]
                                                                        [
                                                                        'userId']
                                                                ? snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    'otherUserName']
                                                                : snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    'userName'],
                                                            style: TextStyle(
                                                                color: color4,
                                                                fontSize: context
                                                                    .smallfontsize,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            snapshot.data!.docs[
                                                                            index]
                                                                        [
                                                                        'lastmassage'] !=
                                                                    null
                                                                ? snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    'lastmassage']
                                                                : "",
                                                            style: TextStyle(
                                                                color: color3,
                                                                fontSize: context
                                                                    .smallfontsize),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: context
                                                              .width(0.05),
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot.data!.docs[
                                                                        index][
                                                                    'lastmassageTime'] !=
                                                                null
                                                            ? snapshot.data!
                                                                    .docs[index]
                                                                [
                                                                'lastmassageTime']
                                                            : "",
                                                        style: TextStyle(
                                                            fontSize: context
                                                                .smallfontsize,
                                                            color: textcolor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                       
                                          }
                                        }
                                      },
                                    ),
                                  )
                                : Expanded(
                                    child: StreamBuilder<QuerySnapshot>(
                                      stream:
                                          massage_repository.searchChat(search),
                                      builder: (context, snapshot) {
                                         if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: color3,
                                            ),
                                          );
                                        } else {
                                          if (snapshot.data!.docs.length == 0) {
                                            return Center(
                                              child: Text(
                                                "No Chats Found\n let's start a new chat",
                                                style: TextStyle(
                                                    color: textcolor,
                                                    fontSize: context
                                                        .mediumfontsize),
                                              ),
                                            );
                                          }
                                          else{
                                               return ListView.builder(
                                            itemCount:
                                                snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    left: context.width(0.01),
                                                    right: context.width(0.01),
                                                    top: 10.h),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      chatid = snapshot
                                                              .data!.docs[index]
                                                          ['chatId'];
                                                      username = user_repository
                                                                  .getCurrentUser()!
                                                                  .uid ==
                                                              snapshot.data!
                                                                          .docs[
                                                                      index]
                                                                  ['userId']
                                                          ? snapshot.data!
                                                                  .docs[index]
                                                              ['otherUserName']
                                                          : snapshot.data!
                                                                  .docs[index]
                                                              ['userName'];
                                                      userimage = user_repository
                                                                  .getCurrentUser()!
                                                                  .uid ==
                                                              snapshot.data!
                                                                          .docs[
                                                                      index]
                                                                  ['userId']
                                                          ? snapshot.data!
                                                                  .docs[index]
                                                              ['otherUserImage']
                                                          : snapshot.data!
                                                                  .docs[index]
                                                              ['userImage'];
                                                    });
                                                    // context.goNamed('chat', extra: (
                                                    //   snapshot.data!.docs[index]['chatId'],
                                                    //   user_repository.getCurrentUser()!.uid ==
                                                    //           snapshot.data!.docs[index]
                                                    //               ['userId']
                                                    //       ? snapshot.data!.docs[index]
                                                    //           ['otherUserName']
                                                    //       : snapshot.data!.docs[index]
                                                    //           ['userName'],
                                                    //   user_repository.getCurrentUser()!.uid ==
                                                    //           snapshot.data!.docs[index]
                                                    //               ['userId']
                                                    //       ? snapshot.data!.docs[index]
                                                    //           ['otherUserImage']
                                                    //       : snapshot.data!.docs[index]
                                                    //           ['userImage']
                                                    // ));
                                                  },
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: ResponsiveValue(
                                                          context,
                                                          conditionalValues: [
                                                            Condition.equals(
                                                                name: MOBILE,
                                                                value: 20.0),
                                                            Condition.equals(
                                                                name: TABLET,
                                                                value: 20.0),
                                                            Condition.equals(
                                                                name: DESKTOP,
                                                                value: 30.0),
                                                            Condition.equals(
                                                                name: '4K',
                                                                value: 35.0)
                                                          ],
                                                        ).value,
                                                        backgroundImage: NetworkImage(user_repository
                                                                    .getCurrentUser()!
                                                                    .uid ==
                                                                snapshot.data!
                                                                            .docs[
                                                                        index]
                                                                    ['userId']
                                                            ? snapshot.data!
                                                                    .docs[index]
                                                                [
                                                                'otherUserImage']
                                                            : snapshot.data!
                                                                    .docs[index]
                                                                ['userImage']),
                                                        //backgroundImage:
                                                        // AssetImage("assets/images/user.png"),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            context.width(0.02),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            user_repository
                                                                        .getCurrentUser()!
                                                                        .uid ==
                                                                    snapshot.data!
                                                                            .docs[index]
                                                                        [
                                                                        'userId']
                                                                ? snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    'otherUserName']
                                                                : snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    'userName'],
                                                            style: TextStyle(
                                                                color: color4,
                                                                fontSize: context
                                                                    .smallfontsize,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            snapshot.data!.docs[
                                                                            index]
                                                                        [
                                                                        'lastmassage'] !=
                                                                    null
                                                                ? snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    'lastmassage']
                                                                : "",
                                                            style: TextStyle(
                                                                color: color3,
                                                                fontSize: context
                                                                    .smallfontsize),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: context
                                                              .width(0.05),
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot.data!.docs[
                                                                        index][
                                                                    'lastmassageTime'] !=
                                                                null
                                                            ? snapshot.data!
                                                                    .docs[index]
                                                                [
                                                                'lastmassageTime']
                                                            : "",
                                                        style: TextStyle(
                                                            fontSize: context
                                                                .smallfontsize,
                                                            color: textcolor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                       
                                          }
                                        }
                                      },
                                    ),
                                  )
                          ],
                        ),
                      ),
                      Container(
                        width: context.width(0.7),
                        color: color3,
                        child: Expanded(
                          child: chatid == ""
                              ? Container(
                                  color: background,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: context.height(0.3),
                                      ),
                                      Icon(
                                        Icons.chat_sharp,
                                        color: textcolor,
                                        size: context.bigfontsize,
                                      ),
                                      SizedBox(
                                        height: context.height(0.05),
                                      ),
                                      Text(
                                        "Select a chat to start messaging",
                                        style: TextStyle(
                                            color: textcolor,
                                            fontSize: context.mediumfontsize),
                                      ),
                                    ],
                                  ),
                                )
                              : chat(
                                  chatid: chatid,
                                  username: username,
                                  userimage: userimage,
                                ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ).animate(effects: [FadeEffect(duration: Duration(seconds: 1))]),
          );
  }
}
