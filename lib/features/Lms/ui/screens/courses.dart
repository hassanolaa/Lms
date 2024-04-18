import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/routing/router.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';
import 'package:lms/features/Lms/data/network/firebase.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../data/models/course.dart';
import 'home.dart';

class courses extends StatefulWidget {
  const courses({super.key});

  @override
  State<courses> createState() => _coursesState();
}

class _coursesState extends State<courses> {
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
                          padding: const EdgeInsets.all(13.0),
                          child: Center(
                            child: Text(
                              'Your Courses',
                              style: textstyle.maintitle.copyWith(
                                  fontSize: 18.sp, color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                  context.height_box(0.03),
                  // grid view for courses and children
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: context.height(0.4) * 2,
                      child:
                       Padding(
                        padding: EdgeInsets.only(
                                  left: context.width(0.02),
                                  right: context.width(0.02)),
                         child: StreamBuilder(
                                  stream: firebase.getSnapShot("courses"),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: 1.5,
                                        ),
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                                courseModel = CourseClass(
                                              id: snapshot.data!.docs[index].id,
                                              name: snapshot.data!.docs[index]
                                                  ['name'],
                                              by: snapshot.data!.docs[index]['by'],
                                              about: snapshot.data!.docs[index]
                                                  ['about'],
                                              image: snapshot.data!.docs[index]
                                                  ['image'],
                                                  hours: snapshot.data!.docs[index]
                                                  ['hours'],
                                            );
                                              context.navigateTo(router.course);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      snapshot.data!.docs[index]
                                                          ['image']),
                                                  fit: BoxFit.cover,
                                                ),
                                               // color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                children: [
                                                    context.height_box(0.13),
                                   Row(
                                     children: [
                                       context.width_box(0.02),
                                       Text(
                                         snapshot.data!.docs[index]['name'],
                                         style: textstyle.subtitle.copyWith(
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white,
                                           fontSize: context.fontSize(15),
                                         ),
                                       ),
                                     ],
                                   ),
                                   context.height_box(0.001),
                                   Row(
                                     children: [
                                       context.width_box(0.02),
                                       Text(
                                         snapshot.data!.docs[index]['by'],
                                         style: textstyle.body.copyWith(
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white,
                                           fontSize: context.fontSize(13),
                                         ),
                                       ),
                                     ],
                                   ),
                                
                                                  
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                       )
                    ),
                  ),
                ],
              ),
            ),
          ))
        : Scaffold(
            backgroundColor: colors.backbackground,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  context.height_box(0.03),
                  // Courses text
                  Container(
                    height: context.height(0.1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colors.background),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Courses',
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
                        // grid view builder for courses
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '2nd level courses - 2nd semester',
                                style: textstyle.title.copyWith(
                                  fontSize: context.fontSize(20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        context.height_box(0.03),
                        // grid view builder for recently added
                        Container(
                          height: context.height(0.4) * 2,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: context.width(0.02),
                                  right: context.width(0.02)),
                              child: StreamBuilder(
                                stream: firebase.getSnapShot("courses"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 1.5,
                                      ),
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                              courseModel = CourseClass(
                                            id: snapshot.data!.docs[index].id,
                                            name: snapshot.data!.docs[index]
                                                ['name'],
                                            by: snapshot.data!.docs[index]['by'],
                                            about: snapshot.data!.docs[index]
                                                ['about'],
                                            image: snapshot.data!.docs[index]
                                                ['image'],
                                                hours: snapshot.data!.docs[index]
                                                ['hours'],
                                          );
                                            context.navigateTo(router.course);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    snapshot.data!.docs[index]
                                                        ['image']),
                                                fit: BoxFit.cover,
                                              ),
                                             // color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                  context.height_box(0.18),
            Row(
              children: [
                context.width_box(0.01),
                Text(
                  snapshot.data!.docs[index]['name'],
                  style: textstyle.subtitle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: context.fontSize(22),
                  ),
                ),
              ],
            ),
            context.height_box(0.001),
            Row(
              children: [
                context.width_box(0.01),
                Text(
                  snapshot.data!.docs[index]['by'],
                  style: textstyle.body.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: context.fontSize(13),
                  ),
                ),
              ],
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
                        ),
                        context.height_box(0.03),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
