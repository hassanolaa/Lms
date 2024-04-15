import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theming/colors.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/features/Lms/data/firebase.dart';
import 'package:lms/features/Lms/ui/screens/ai_home.dart';
import 'package:lms/features/Lms/ui/screens/courses.dart';
import 'package:lms/features/Lms/ui/screens/home.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:lms/features/chat/view/presentation/widgets/navi.dart';
import '../../../chat/view/presentation/screens/massages.dart';
import '../../../chat/view/presentation/screens/signIn.dart';
import '../../../chat/view/presentation/screens/signup.dart';
import '../screens/ai.dart';
import '../screens/profile.dart';

List<Widget> _SelectedTab = [
  home(),
  courses(),
  // massages(),
//  status(),
  ai_home(),
// Container(),
  signIn(),
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
                          color: selected == 0
                              ? colors.color1
                              : Colors.transparent,
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
                          color: selected == 1
                              ? colors.color1
                              : Colors.transparent,
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
                        backgroundColor: colors.color3,
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
                          color: selected == 3
                              ? colors.color1
                              : Colors.transparent,
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
                          color: selected == 4
                              ? colors.color1
                              : Colors.transparent,
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
            backgroundColor: colors.backbackground,
            body: Stack(
              children: [
                Row(children: [
                  // web navi
                  Row(
                    children: [
                      context.width_box(.015),
                      Padding(
                        padding: EdgeInsets.only(
                            top: context.height(0.03),
                            bottom: context.height(.03)),
                        child: Container(
                          width: context.width(.06),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: colors.background,
                          ),
                          child: Column(children: [
                            SizedBox(
                              height: context.height(.2),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = 0;
                                  _handleIndexChanged(0);
                                });
                              },
                              child: Container(
                                height: context.height(.08),
                                width: context.width(.05),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: selected == 0
                                      ? colors.color2
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: colors.color2, width: 1),
                                ),
                                child: Icon(
                                  Icons.home_outlined,
                                  color: colors.color3,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.height(.02),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = 1;
                                  _handleIndexChanged(1);
                                });
                              },
                              child: Container(
                                height: context.height(.08),
                                width: context.width(.05),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: selected == 1
                                      ? colors.color2
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: colors.color2, width: 1),
                                ),
                                child: Icon(
                                  CupertinoIcons.book_circle,
                                  color: colors.color3,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.height(.02),
                            ),
                            // circle avatar with icon
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = 2;
                                  _handleIndexChanged(2);
                                });
                              },
                              child: Container(
                                height: context.height(.11),
                                width: context.width(.08),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selected == 2
                                      ? colors.color2
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: colors.color2, width: 1),
                                ),
                                child: Icon(
                                  Icons.auto_fix_high_outlined,
                                  color: colors.color3,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: context.height(.02),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected = 3;
                                    _handleIndexChanged(3);
                                  });
                                },
                                child: Container(
                                  height: context.height(.08),
                                  width: context.width(.05),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: selected == 3
                                        ? colors.color2
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: colors.color2, width: 1),
                                  ),
                                  child: Icon(
                                    CupertinoIcons.chat_bubble_2,
                                    color: colors.color3,
                                  ),
                                )),

                            SizedBox(
                              height: context.height(.02),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = 4;
                                  _handleIndexChanged(4);
                                });
                              },
                              child: Container(
                                height: context.height(.08),
                                width: context.width(.05),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: selected == 4
                                      ? colors.color2
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: colors.color2, width: 1),
                                ),
                                child: Icon(
                                  Icons.person_outline_outlined,
                                  color: colors.color3,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.height(.14),
                            ),

                            //
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected = 3;
                                    _handleIndexChanged(3);
                                  });
                                },
                                child: Container(
                                  height: context.height(.08),
                                  width: context.width(.05),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: selected == 3
                                        ? colors.color2
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: colors.color2, width: 1),
                                  ),
                                  child: Icon(
                                    Icons.logout_outlined,
                                    color: colors.color3,
                                  ),
                                ))
                          ]),
                        ),
                      ),
                      context.width_box(.015),
                    ],
                  ),
                  Expanded(
                    child: _selectedTab,
                  ),
                  // container include person icon , name ,email and list of upcoming events
                  Row(
                    children: [
                      context.width_box(.015),
                      Container(
                        width: context.width(.2),
                        child: Column(
                          children: [
                            context.height_box(.03),
                            Container(
                              height: context.height(.1),
                              width: context.width(.2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                color: colors.background,
                              ),
                              child: Row(
                                children: [
                                  context.width_box(.02),
                                  CircleAvatar(
                                    radius: 25.r,
                                    child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Icon(
                                          Icons.notifications,
                                          size: context.fontSize(20),
                                        )),
                                  ),
                                  context.width_box(.01),
                                  CircleAvatar(
                                    radius: 25.r,
                                    child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Icon(
                                          Icons.dark_mode,
                                          size: context.fontSize(20),
                                        )),
                                  ),
                                  context.width_box(.03),
                                  CircleAvatar(
                                    radius: 31.r,
                                    child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Icon(
                                          Icons.person,
                                          size: context.fontSize(30),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            context.height_box(.02),
                            // upcoming events
                            Row(
                              children: [
                                //  Icon(Icons.calendar_today),
                                Text(
                                  'Upcoming Events',
                                  style: textstyle.title.copyWith(
                                      fontSize: context.fontSize(15),
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Expanded(
                                child: StreamBuilder(
                                    stream: firebase.getSnapShot("upcoming"),
                                    builder: ((context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator();
                                      } else {
                                        return ListView.builder(
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: event(
                                                eventtype: snapshot.data!.docs[index]['type'],
                                                eventname: snapshot.data!.docs[index]['name'],
                                                eventdate:snapshot.data!.docs[index]['date'],
                                                eventdescription:
                                                   snapshot.data!.docs[index]['description'],
                                                eventduration:snapshot.data!.docs[index]['time'],
                                                evnetmarks: snapshot.data!.docs[index]['marks'],
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    }))),
                          ],
                        ),
                      ),
                      context.width_box(.015),
                    ],
                  ),
                ]),
                Positioned(
                  top: context.height(.87),
                  left: context.width(.9),
                  child: Container(
                    height: context.height(.1),
                    width: context.width(.1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.color1,
                    ),
                  ),
                ),
              ],
            ));
  }
}

class event extends StatelessWidget {
  event({
    super.key,
    required this.eventtype,
    required this.eventname,
    required this.eventdate,
    required this.eventdescription,
    required this.eventduration,
    required this.evnetmarks,
  });
  String eventtype;
  String eventname;
  String eventdate;
  String eventdescription;
  String eventduration;
  String evnetmarks;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height(.3),
        width: context.width(.2),
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            context.height_box(0.02),
            Row(
              children: [
                context.width_box(0.01),
                Container(
                    height: context.height(.035),
                    width: context.width(.06),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: colors.color1),
                    child: Center(
                      child: Text(
                        eventtype,
                        style: textstyle.title.copyWith(
                            fontSize: context.fontSize(12),
                            fontWeight: FontWeight.normal),
                      ),
                    ))
              ],
            ),
            context.height_box(0.02),
            Padding(
              padding: EdgeInsets.only(
                  left: context.width(.02), right: context.width(.02)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //context.width_box(0.01),
                  Text(
                    eventname,
                    style: textstyle.title.copyWith(
                        fontSize: context.fontSize(14),
                        fontWeight: FontWeight.normal),
                  ),
                  // event date
                  Text(
                    eventdate,
                    style: textstyle.title.copyWith(
                        fontSize: context.fontSize(10),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            context.height_box(0.02),
            // event description
            Padding(
              padding: EdgeInsets.only(
                  left: context.width(.02), right: context.width(.02)),
              child: Text(
                eventdescription,
                style: textstyle.title.copyWith(
                    fontSize: context.fontSize(12),
                    fontWeight: FontWeight.normal),
              ),
            ),
            context.height_box(0.02),
            // row for quiz duration and marks
            Padding(
              padding: EdgeInsets.only(
                  left: context.width(.02), right: context.width(.02)),
              child: Row(
                children: [
                  // quiz duration
                  // icon
                  Icon(
                    Icons.timer,
                    size: context.fontSize(15),
                  ),
                  Text(
                    eventduration,
                    style: textstyle.title.copyWith(
                        fontSize: context.fontSize(10),
                        fontWeight: FontWeight.normal),
                  ),
                  context.width_box(0.03),
                  // icon
                  Icon(
                    Icons.assignment_turned_in_outlined,
                    size: context.fontSize(15),
                  ),
                  // quiz marks
                  Text(
                    evnetmarks,
                    style: textstyle.title.copyWith(
                        fontSize: context.fontSize(10),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            context.height_box(0.01),
            Container(
              width: context.width(.15),
              height: context.height(.001),
              color: colors.color1,
            ),
            // notify me button
            context.height_box(0.02),
            Padding(
              padding: EdgeInsets.only(
                  left: context.width(.07), right: context.width(.02)),
              child: Container(
                height: context.height(.04),
                width: context.width(.1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: colors.color3),
                child: Center(
                  child: Text(
                    'Notify Me',
                    style: textstyle.title.copyWith(
                        fontSize: context.fontSize(12),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
