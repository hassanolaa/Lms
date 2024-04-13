
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/routing/router.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';

import 'home.dart';



class courses extends StatefulWidget {
  const courses({super.key});

  @override
  State<courses> createState() => _coursesState();
}

class _coursesState extends State<courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
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
                  padding: const EdgeInsets.all(13.0),
                  child:
                  Center(
                    child: Text(
                      'Your Courses',
                      style: textstyle.maintitle.copyWith(fontSize: 18.sp, color: Colors.white),
                    ),
                  )
                  
                ),
              ),
            ), 
            context.height_box(0.03),
            // grid view for courses and children 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.navigateTo(router.course);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
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
                                  image: NetworkImage('https://images.unsplash.com/photo-1612838320302-4b3b3b3b3b3b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
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
                                    'Course Name',
                                    style: textstyle.title.copyWith(fontSize: 15.sp),
                                  ),
                                  context.height_box(0.01),
                                  Text(
                                    'Course Description',
                                    style: textstyle.body.copyWith(fontSize: 13.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
           
            ],
          ),
        ),
      )
    );
  }
}