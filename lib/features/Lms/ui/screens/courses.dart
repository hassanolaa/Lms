
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/routing/router.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
        ?  Scaffold(
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
    )
        : Scaffold(
            backgroundColor: colors.backbackground,
     body:   SingleChildScrollView(
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
              height: context.height(0.4)*2,
              child: Padding(
                padding:  EdgeInsets.only(left:context.width(0.02),right:context.width(0.02)),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.navigateTo(router.course);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
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