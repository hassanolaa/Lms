import 'package:flutter/material.dart';
import 'package:lms/core/routing/router.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';

import 'home.dart';

class course extends StatefulWidget {
  const course({super.key});

  @override
  State<course> createState() => _courseState();
}

class _courseState extends State<course> {
  int view = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          style: textstyle.title.copyWith(color: Colors.white),
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
                    style: textstyle.title.copyWith(color: colors.textcolor),
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
                        style:
                            textstyle.subtitle.copyWith(color: colors.color3),
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
                    style: textstyle.subtitle.copyWith(color: colors.textcolor),
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
                        color: view == 0 ? colors.color3 : colors.background,
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
                        color: view == 1 ? colors.color3 : colors.background,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: colors.color3),
                      ),
                      child: Center(
                          child: Text(
                        'Announcements',
                        style: textstyle.subtitle.copyWith(
                            color: view == 1 ? Colors.white : colors.color3),
                      )),
                    ),
                  ),
                ],
              ),
              context.height_box(0.03),
              // list view builder of lectures as list tile
              view == 0
                  ? Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
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
                                    borderRadius: BorderRadius.circular(15)),
                                tileColor: Colors.grey[200],
                                leading: CircleAvatar(
                                  backgroundColor: colors.color3,
                                  child: Text('${index + 1}'),
                                ),
                                title: Text('Lecture ${index + 1}'),
                                subtitle:
                                    Text('Lecture ${index + 1} description'),
                                trailing: Icon(Icons.play_circle_fill),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              tileColor: Colors.grey[200],
                              // leading: CircleAvatar(
                              //   backgroundColor: colors.color3,
                              //   child: Text('${index + 1}'),
                              // ),
                              title: Text('Announcement ${index + 1}'),
                              subtitle:
                                  Text('Announcement ${index + 1} description'),
                              trailing:
                                  Icon(Icons.notifications_active_rounded),
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
    );
  }
}
