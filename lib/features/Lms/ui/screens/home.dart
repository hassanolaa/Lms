import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/routing/router.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';
import 'package:lms/features/Lms/data/network/firebase.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../data/models/course.dart';
import '../../data/models/lecture.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Scaffold(
            body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  // context.height_box(0.08),
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
                            Text(
                              'Hello 👋, User',
                              style:
                                  textstyle.title.copyWith(color: Colors.white),
                            ),
                            CircleAvatar(
                                radius: 20,
                                // add person icon
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  context.height_box(0.03),
                  // search bar with search icon and filter button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.search),
                                  context.width_box(0.02),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Search for courses',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        context.width_box(0.02),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.filter_list),
                        ),
                      ],
                    ),
                  ),
                  // banners for notifications in the list view builder
                  context.height_box(0.03),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notifications',
                          style: textstyle.title,
                        ),
                        Text(
                          'View All',
                          style: textstyle.buttonText,
                        ),
                      ],
                    ),
                  ),
                  context.height_box(0.03),
                  // list view builder for notifications
                  Container(
                    height: context.height(0.15),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: context.width(0.4),
                          height: context.height(0.05),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: context.height(0.05),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://images.unsplash.com/photo-1612833944754-0b3b3b3b3b3b',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Notifications Title',
                                      style: textstyle.subtitle.copyWith(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    context.height_box(0.01),
                                    Text(
                                      'Notifications Description',
                                      style: textstyle.body.copyWith(
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  // banners for courses in the list view builder
                  context.height_box(0.03),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Courses',
                          style: textstyle.title,
                        ),
                        Text(
                          'View All',
                          style: textstyle.buttonText,
                        ),
                      ],
                    ),
                  ),
                  context.height_box(0.03),
                  // list view builder for courses
                  Container(
                      height: context.height(0.2),
                      child: StreamBuilder(
                        stream: firebase.getSnapShot("courses"),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return 
                                GestureDetector(
                                  onTap: () {
                                    // navigate to the course page
                                    courseModel = CourseClass(
                                      id: snapshot.data!.docs[index].id,
                                      name: snapshot.data!.docs[index]['name'],
                                      by: snapshot.data!.docs[index]['by'],
                                      about: snapshot.data!.docs[index]['about'],
                                      image: snapshot.data!.docs[index]['image'],
                                      hours: snapshot.data!.docs[index]['hours'],
                                    );
                                    context.navigateTo(router.course);
                                  },
                                  child: Container(
                                    width: context.width(0.7),
                                    height: context.height(0.2),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                    //  color: Colors.grey[200],
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data!.docs[index]['image'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        context.height_box(0.05),
                                
                                        Text(
                                          snapshot.data!.docs[index]['name'] ,
                                          style: textstyle.subtitle.copyWith(
                                               fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize:
                                                            context.fontSize(22),
                                          ),
                                        ),
                                        context.height_box(0.01),
                                        Text(
                                          snapshot.data!.docs[index]['by'],
                                          style: textstyle.body.copyWith(
                                               fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize:
                                                            context.fontSize(13),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        }),
                      )
                      ),
                  // grid view builder for added recently
                  context.height_box(0.03),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recently Added',
                          style: textstyle.title,
                        ),
                        Text(
                          'View All',
                          style: textstyle.buttonText,
                        ),
                      ],
                    ),
                  ),
                  context.height_box(0.03),
                  // grid view builder for recently added
                  Container(
                    height: context.height(0.4) * 2,
                    child: 
                     Padding(
                       padding: EdgeInsets.only(
                                  left: context.width(0.04),
                                  right: context.width(0.04)),
                       child: StreamBuilder(
                                    stream: firebase.getSnapShot("recently"),
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
                                            return recentlyMobile(
                                                lecture: Lecture(
                                              name: snapshot.data!.docs[index]
                                                  ['name'],
                                              coursename: snapshot.data!
                                                  .docs[index]['coursename'],
                                              description: snapshot.data!
                                                  .docs[index]['description '],
                                              pdf: snapshot.data!.docs[index]
                                                  ['pdf'],
                                              video: snapshot.data!.docs[index]
                                                  ['video'],
                                              more: snapshot.data!.docs[index]
                                                  ['more'],
                                              quiz: snapshot.data!.docs[index]
                                                  ['quiz'],
                                              image: snapshot.data!.docs[index]
                                                  ['image'],
                                            ));
                                          },
                                        );
                                      }
                                    }),
                     )
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
                  // search bar with search icon and filter button
                  Container(
                    height: context.height(0.1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colors.background),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Icon(Icons.search),
                                    context.width_box(0.02),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Search for courses',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          context.width_box(0.02),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.filter_list),
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
                        // list view builder for notifications horizontal
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Notifications',
                                style: textstyle.title.copyWith(
                                  fontSize: context.fontSize(20),
                                ),
                              ),
                              Text(
                                'View All',
                                style: textstyle.buttonText.copyWith(
                                  fontSize: context.fontSize(12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        context.height_box(0.03),
                        // list view builder for notifications
                        Container(
                            height: context.height(0.2),
                            child: StreamBuilder(
                                stream: firebase.getSnapShot("upcoming"),
                                builder: (context, snapshat) {
                                  if (snapshat.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshat.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: context.width(0.2),
                                          height: context.height(0.15),
                                          margin: EdgeInsets.only(left: 20),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            children: [
                                              //                                     context.width_box(0.1),
                                              //                               Row(
                                              //   children: [
                                              //     context.width_box(0.01),
                                              //     Container(
                                              //         height: context.height(.035),
                                              //         width: context.width(.06),
                                              //         decoration: BoxDecoration(
                                              //             borderRadius: BorderRadius.circular(20.r),
                                              //             color:colors.color3,),
                                              //         child: Center(
                                              //           child: Text(
                                              //               snapshat.data!.docs[index]['type'],
                                              //             style: textstyle.title.copyWith(
                                              //                 fontSize: context.fontSize(12),
                                              //                 fontWeight: FontWeight.normal),
                                              //           ),
                                              //         ))
                                              //   ],
                                              // ),
                                              //                                 // title , subtitle
                                              //                                     Row(
                                              //   children: [
                                              //     context.width_box(0.01),
                                              //     Text(
                                              //          snapshat.data!.docs[index]['name'],
                                              //       style: textstyle.subtitle.copyWith(
                                              //         fontWeight: FontWeight.bold,
                                              //         color: Colors.white,
                                              //         fontSize: context.fontSize(22),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                              // context.height_box(0.001),
                                              // Row(
                                              //   children: [
                                              //     context.width_box(0.01),
                                              //     Text(
                                              //         snapshat.data!.docs[index]['description'],
                                              //       style: textstyle.body.copyWith(
                                              //         fontWeight: FontWeight.bold,
                                              //         color: Colors.white,
                                              //         fontSize: context.fontSize(13),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                })),
                        context.height_box(0.03),
                        // list view builder for courses horizontal
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Courses',
                                style: textstyle.title.copyWith(
                                  fontSize: context.fontSize(20),
                                ),
                              ),
                              Text(
                                'View All',
                                style: textstyle.buttonText.copyWith(
                                  fontSize: context.fontSize(12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        context.height_box(0.03),
                        // list view builder for courses
                        Container(
                            height: context.height(0.3),
                            child: StreamBuilder(
                              stream: firebase.getSnapShot("courses"),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          // navigate to the course page
                                          courseModel = CourseClass(
                                            id: snapshot.data!.docs[index].id,
                                            name: snapshot.data!.docs[index]
                                                ['name'],
                                            by: snapshot.data!.docs[index]
                                                ['by'],
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
                                          width: context.width(0.4),
                                          height: context.height(0.15),
                                          margin: EdgeInsets.only(left: 20),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                snapshot.data!.docs[index]
                                                    ['image'],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            // color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            children: [
                                              context.height_box(0.2),
                                              Row(
                                                children: [
                                                  context.width_box(0.01),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                        ['name'],
                                                    style: textstyle.subtitle
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize:
                                                          context.fontSize(22),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              context.height_box(0.001),
                                              Row(
                                                children: [
                                                  context.width_box(0.01),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                        ['by'],
                                                    style:
                                                        textstyle.body.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize:
                                                          context.fontSize(13),
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
                              }),
                            )),
                        context.height_box(0.03),
                        // grid view builder for recently added
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recently Added',
                                style: textstyle.title.copyWith(
                                  fontSize: context.fontSize(20),
                                ),
                              ),
                              Text(
                                'View All',
                                style: textstyle.buttonText.copyWith(
                                  fontSize: context.fontSize(12),
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
                                  stream: firebase.getSnapShot("recently"),
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
                                          return recently(
                                              lecture: Lecture(
                                            name: snapshot.data!.docs[index]
                                                ['name'],
                                            coursename: snapshot.data!
                                                .docs[index]['coursename'],
                                            description: snapshot.data!
                                                .docs[index]['description '],
                                            pdf: snapshot.data!.docs[index]
                                                ['pdf'],
                                            video: snapshot.data!.docs[index]
                                                ['video'],
                                            more: snapshot.data!.docs[index]
                                                ['more'],
                                            quiz: snapshot.data!.docs[index]
                                                ['quiz'],
                                            image: snapshot.data!.docs[index]
                                                ['image'],
                                          ));
                                        },
                                      );
                                    }
                                  })),
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

class recently extends StatelessWidget {
  recently({
    super.key,
    required this.lecture,
  });
  Lecture lecture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigate to the lecture page
        lectureModel = lecture;
        context.navigateTo(router.lecture);
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              // low opacity at the end of the image

              image: NetworkImage(lecture.image!),
            ),
            //  borderRadius: BorderRadius.circular(20),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            context.height_box(0.18),
            Row(
              children: [
                context.width_box(0.01),
                Text(
                  lecture.name!,
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
                  lecture.coursename!,
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
  }
}



class recentlyMobile extends StatelessWidget {
  recentlyMobile({
    super.key,
    required this.lecture,
  });
  Lecture lecture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigate to the lecture page
        lectureModel = lecture;
        context.navigateTo(router.lecture);
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              // low opacity at the end of the image

              image: NetworkImage(lecture.image!),
            ),
            //  borderRadius: BorderRadius.circular(20),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            context.height_box(0.1),
            Row(
              children: [
                context.width_box(0.02),
                Text(
                  lecture.name!,
                  style: textstyle.subtitle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: context.fontSize(19),
                  ),
                ),
              ],
            ),
            context.height_box(0.001),
            Row(
              children: [
                context.width_box(0.02),
                Text(
                  lecture.coursename!,
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
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(0, size.height, 50, size.height);
    path.lineTo(size.width - 50, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
