

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
           // context.height_box(0.08),
            ClipPath(
              clipper:
              ClipPathClass(), 
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
                      style: textstyle.title.copyWith(color: Colors.white),
                    ),
                    CircleAvatar(
                      radius: 20,
                      // add person icon
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      )

                    )
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: context.width(0.7),
                    height: context.height(0.2),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Course Title',
                          style: textstyle.subtitle,
                        ),
                        context.height_box(0.01),
                        Text(
                          'Instructor name',
                          style: textstyle.body,
                        ),
                      ],
                    ),
                  );
                },
              ),
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
              height: context.height(0.4)*2,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: context.height(0.2),
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
                                'Course Title',
                                style: textstyle.subtitle,
                              ),
                              context.height_box(0.01),
                              Text(
                                'Instructor name',
                                style: textstyle.body,
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
           
           
           ],),
        ),
      )
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
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}