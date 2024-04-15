import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/routing/router.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';
import 'package:lms/features/Lms/ui/widgets/webtemplete.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../chat/view/presentation/screens/profile.dart';
import '../../../chat/view/presentation/screens/signIn.dart';
import '../widgets/navi.dart';
import 'ai_home.dart';
import 'courses.dart';
import 'home.dart';

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

class course extends StatefulWidget {
  const course({super.key});

  @override
  State<course> createState() => _courseState();
}

class _courseState extends State<course> {
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

  int view = 0;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    ClipPath(
                      clipper: ClipPathClass(),
                      child: Container(
                        height: context.height(0.1),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [colors.color1, colors.color2],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(23.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.pop();
                                },
                                child: CircleAvatar(
                                  backgroundColor: colors.color1,
                                  radius: 20,
                                  // add person icon
                                  child: Icon(
                                    Icons.arrow_back_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                'Course details',
                                style: textstyle.title
                                    .copyWith(color: Colors.white),
                              ),
                              CircleAvatar(
                                radius: 20,
                                // add person icon
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    context.height_box(0.01),
                    // add course image
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: context.height(0.3),
                        width: context.width(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(colors.background_image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    context.height_box(0.03),
                    // add course title
                    Row(
                      children: [
                        context.width_box(0.06),
                        Text(
                          'Course Title',
                          style:
                              textstyle.title.copyWith(color: colors.textcolor),
                        ),
                      ],
                    ),
                    context.height_box(0.03),
                    // course hours and instructor name and hours icon
                    Row(
                      children: [
                        context.width_box(0.06),
                        // course hours and instructor name and hours icon
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: colors.color3,
                            ),
                            context.width_box(0.02),
                            Text(
                              '2 hours',
                              style: textstyle.subtitle
                                  .copyWith(color: colors.color3),
                            ),
                          ],
                        ),
                        context.width_box(0.15),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: colors.textcolor,
                            ),
                            context.width_box(0.02),
                            Text(
                              'Instructor Name',
                              style: textstyle.subtitle
                                  .copyWith(color: colors.textcolor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    context.height_box(0.02),
                    Row(
                      children: [
                        context.width_box(0.06),
                        Container(
                          height: 1,
                          width: context.width(0.8),
                          color: colors.textcolor,
                        ),
                      ],
                    ),
                    context.height_box(0.03),
                    // add course description
                    Row(
                      children: [
                        context.width_box(0.06),
                        Text(
                          'About this course',
                          style: textstyle.subtitle
                              .copyWith(color: colors.textcolor),
                        ),
                      ],
                    ),
                    context.height_box(0.02),
                    Row(
                      children: [
                        context.width_box(0.06),
                        Text(
                          'About this course dsjkhgdskhghidsghuid\nshguidshgiudshgisdghisdgis',
                          style: textstyle.subtitle.copyWith(
                              overflow: TextOverflow.ellipsis,
                              color: colors.textcolor,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    context.height_box(0.03),
                    // two buttons for enroll and start course
                    Row(
                      children: [
                        context.width_box(0.04),
                        GestureDetector(
                          onTap: () {
                            // add function to enroll in course
                            setState(() {
                              view = 0;
                            });
                          },
                          child: Container(
                            width: context.width(0.45),
                            height: context.height(0.08),
                            decoration: BoxDecoration(
                              color:
                                  view == 0 ? colors.color3 : colors.background,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: colors.color3),
                            ),
                            child: Center(
                                child: Text(
                              'Lectures',
                              style: textstyle.subtitle.copyWith(
                                  color: view == 0
                                      ? colors.textmassagecolor
                                      : colors.color3),
                            )),
                          ),
                        ),
                        context.width_box(0.01),
                        GestureDetector(
                          onTap: () {
                            // add function to start course
                            setState(() {
                              view = 1;
                            });
                          },
                          child: Container(
                            width: context.width(0.45),
                            height: context.height(0.08),
                            decoration: BoxDecoration(
                              color:
                                  view == 1 ? colors.color3 : colors.background,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: colors.color3),
                            ),
                            child: Center(
                                child: Text(
                              'Announcements',
                              style: textstyle.subtitle.copyWith(
                                  color:
                                      view == 1 ? Colors.white : colors.color3),
                            )),
                          ),
                        ),
                      ],
                    ),
                    context.height_box(0.03),
                    // list view builder of lectures as list tile
                    view == 0
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      // add function to start lecture
                                      context.navigateTo(router.lecture);
                                    },
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      tileColor: Colors.grey[200],
                                      leading: CircleAvatar(
                                        backgroundColor: colors.color3,
                                        child: Text('${index + 1}'),
                                      ),
                                      title: Text('Lecture ${index + 1}'),
                                      subtitle: Text(
                                          'Lecture ${index + 1} description'),
                                      trailing: Icon(Icons.play_circle_fill),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    tileColor: Colors.grey[200],
                                    // leading: CircleAvatar(
                                    //   backgroundColor: colors.color3,
                                    //   child: Text('${index + 1}'),
                                    // ),
                                    title: Text('Announcement ${index + 1}'),
                                    subtitle: Text(
                                        'Announcement ${index + 1} description'),
                                    trailing: Icon(
                                        Icons.notifications_active_rounded),
                                  ),
                                );
                              },
                            ),
                          ),
                    context.height_box(0.03),
                  ],
                ),
              ),
            ),
          )
        : webtemplete(widegt:
        SingleChildScrollView(
          child: Column(
            children: [
               context.height_box(0.03),
            // Courses text   
            Container(
              height: context.height(0.1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: colors.background
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Course name',
                      style: textstyle.title.copyWith(
                        fontSize: context.fontSize(20),
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
              context.height_box(0.03),
           // screen container
           Container(
            decoration: BoxDecoration(
              color: colors.background,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
           context.height_box(0.03),
             // add course image
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: context.height(0.35),
                        width: context.width(0.95),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colors.backbackground,
                      //    image: DecorationImage(
                        //    image: AssetImage(colors.background_image),
                         //   fit: BoxFit.cover,
                        //  ),
                        ),
                      ),
                    ),
                    context.height_box(0.03),
                    // add course title
                    Row(
                      children: [
                        context.width_box(0.06),
                        Text(
                          'Course Title',
                          style:
                              textstyle.title.copyWith(color: colors.textcolor ,fontSize: context.fontSize(30)),
                        ),
                      ],
                    ),
                    context.height_box(0.03),
                    // course hours and instructor name and hours icon
                    Row(
                      children: [
                        context.width_box(0.06),
                        // course hours and instructor name and hours icon
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: colors.color3,
                              size: context.fontSize(20)
                            ),
                            context.width_box(0.01),
                            Text(
                              '2 hours',
                              style: textstyle.subtitle
                                  .copyWith(color: colors.color3 , fontSize: context.fontSize(15)),
                            ),
                          ],
                        ),
                        context.width_box(0.1),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: colors.textcolor,
                              size: context.fontSize(20)
                            ),
                            context.width_box(0.01),
                            Text(
                              'Instructor Name',
                              style: textstyle.subtitle
                                  .copyWith(color: colors.textcolor,fontSize: context.fontSize(15)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    context.height_box(0.02),
                    Row(
                      children: [
                        context.width_box(0.06),
                        Container(
                          height: 1,
                          width: context.width(0.5),
                          color: colors.textcolor,
                        ),
                      ],
                    ),
                    context.height_box(0.03),
                    // add course description
                    Row(
                      children: [
                        context.width_box(0.06),
                        Text(
                          'About this course',
                          style: textstyle.subtitle
                              .copyWith(color: colors.textcolor ,fontSize: context.fontSize(20)),
                        ),
                      ],
                    ),
                    context.height_box(0.02),
                    Row(
                      children: [
                        context.width_box(0.06),
                        Text(
                          'About this course dsjkhgdskhghidsghuid\nshguidshgiudshgisdghisdgis',
                          style: textstyle.subtitle.copyWith(
                              overflow: TextOverflow.ellipsis,
                              color: colors.textcolor,
                              fontSize: context.fontSize(15),
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    context.height_box(0.03),
                    // two buttons for enroll and start course
                    Row(
                      children: [
                        context.width_box(0.06),
                        GestureDetector(
                          onTap: () {
                            // add function to enroll in course
                            setState(() {
                              view = 0;
                            });
                          },
                          child: Container(
                            width: context.width(0.2),
                            height: context.height(0.07),
                            decoration: BoxDecoration(
                              color:
                                  view == 0 ? colors.color3 : colors.background,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: colors.color3),
                            ),
                            child: Center(
                                child: Text(
                              'Lectures',
                              style: textstyle.subtitle.copyWith(
                                fontSize: context.fontSize(20),
                                  color: view == 0
                                      ? colors.textmassagecolor
                                      : colors.color3),
                            )),
                          ),
                        ),
                        context.width_box(0.01),
                        GestureDetector(
                          onTap: () {
                            // add function to start course
                            setState(() {
                              view = 1;
                            });
                          },
                          child: Container(
                            width: context.width(0.20),
                            height: context.height(0.07),
                            decoration: BoxDecoration(
                              color:
                                  view == 1 ? colors.color3 : colors.background,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: colors.color3),
                            ),
                            child: Center(
                                child: Text(
                              'Announcements',
                              style: textstyle.subtitle.copyWith(
                                fontSize: context.fontSize(20),
                                  color:
                                      view == 1 ? Colors.white : colors.color3),
                            )),
                          ),
                        ),
                      ],
                    ),
                    context.height_box(0.03),
                    // list view builder of lectures as list tile
                    view == 0
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 60.0, right: 60.0),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      // add function to start lecture
                                      context.navigateTo(router.lecture);
                                    },
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      tileColor: Colors.grey[200],
                                      leading: CircleAvatar(
                                        backgroundColor: colors.color3,
                                        child: Text('${index + 1}'),
                                      ),
                                      title: Text('Lecture ${index + 1}'),
                                      subtitle: Text(
                                          'Lecture ${index + 1} description'),
                                      trailing: Icon(Icons.play_circle_fill),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.only(left:60.0, right: 60.0),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    tileColor: Colors.grey[200],
                                    // leading: CircleAvatar(
                                    //   backgroundColor: colors.color3,
                                    //   child: Text('${index + 1}'),
                                    // ),
                                    title: Text('Announcement ${index + 1}'),
                                    subtitle: Text(
                                        'Announcement ${index + 1} description'),
                                    trailing: Icon(
                                        Icons.notifications_active_rounded),
                                  ),
                                );
                              },
                            ),
                          ),
                    context.height_box(0.03),
            context.height_box(0.03),
            context.height_box(0.03),



              ],
            ),
           )
      
            ],
          ),
        )
        
        
        
        );
  }
}
