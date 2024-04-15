

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/colors.dart';
import 'package:lms/core/theming/style.dart';
import '../../../chat/view/presentation/screens/profile.dart';
import '../../../chat/view/presentation/screens/signIn.dart';
import '../screens/ai_home.dart';
import '../screens/courses.dart';
import '../screens/home.dart';
import 'navi.dart';
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
class webtemplete extends StatefulWidget {
    webtemplete({super.key
    , required this.widegt
    });
   Widget widegt;
 
   @override
   State<webtemplete> createState() => _webtempleteState();
 }
 
 class _webtempleteState extends State<webtemplete> {
  var _selectedTab = _SelectedTab[0];
  int selected = 5;

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
     return Scaffold(
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
                            top: context.height(0.03), bottom: context.height(.03)),
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
                                  border:
                                      Border.all(color: colors.color2, width: 1),
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
                                  border:
                                      Border.all(color: colors.color2, width: 1),
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
                                  border:
                                      Border.all(color: colors.color2, width: 1),
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
                                    border:
                                        Border.all(color: colors.color2, width: 1),
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
                                  border:
                                      Border.all(color: colors.color2, width: 1),
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
                                    border:
                                        Border.all(color: colors.color2, width: 1),
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
                    child:selected!=5? _selectedTab:widget.widegt,
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
                              width:context.width(.2),
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
                                      child: Icon(Icons.notifications ,size: context.fontSize(20),)),
                                    
                                    
                                  ),
                                  context.width_box(.01),

                                CircleAvatar(
                                    radius: 25.r,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Icon(Icons.dark_mode ,size: context.fontSize(20),)),
                                    
                                  ),
                                  context.width_box(.03),
                                  CircleAvatar(
                                    radius: 31.r,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Icon(Icons.person ,size: context.fontSize(30),)),
                                    
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
                              child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: event(
                                      eventtype: 'Quiz',
                                      eventname: 'Quiz 1',
                                      eventdate: '12/12/2021',
                                      eventdescription: 'Quiz 1 description',
                                      eventduration: ' 30 min',
                                      evnetmarks: ' 10 marks',
                                    ),
                                  );
                                },
                              ),
                            ),
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
                    height:context.height(.1),
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