import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/routing/router.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'home.dart';

class ai_home extends StatefulWidget {
  const ai_home({super.key});

  @override
  State<ai_home> createState() => _ai_homeState();
}

class _ai_homeState extends State<ai_home> {
  List<tools> toolsList = [
    tools(
      icon: Icon(Icons.draw,),
      title: 'Whiteboard',
      url: "https://app.ziteboard.com/",
    ),
    tools(
      icon: Icon(Icons.code),
      title: 'Programming compiler',
      url: 'https://www.programiz.com/java-programming/online-compiler/',
    ),
    tools(
      icon: Icon(Icons.electrical_services_sharp),
      title: 'Circuits simulator',
      url: "https://www.falstad.com/circuit/",
    ),
    tools(
      icon: Icon(Icons.calculate_sharp),
      title: 'Math solver',
      url: "https://www.cymath.com/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Scaffold(
            body: SingleChildScrollView(
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
                              'AI Home',
                              style:
                                  textstyle.title.copyWith(color: Colors.white),
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
                  context.height_box(0.03),
                  Row(
                    children: [
                      context.width_box(0.1),
                      Text(
                        'My Tools:',
                        style: textstyle.title.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  context.height_box(0.02),
                  // grid view builder
                  Container(
                    height: context.height(0.3),
                    child: Padding(
                      padding: EdgeInsets.only(right: 90, left: 90),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: toolsList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.4,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                url = toolsList[index].url!;
                                Navigator.of(context).pushNamed(router.tools,
                                    arguments: toolsList[index].url);
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: colors.background,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey[200],
                                    child: toolsList[index].icon,
                                  ),
                                  context.height_box(0.01),
                                  Text(toolsList[index].title!,
                                      style: textstyle.title.copyWith(
                                        color: Colors.black,
                                        fontSize: 11,
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  context.height_box(0.03),
                  // row of text field and 2 buttons
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        context.width_box(0.05),
                        GestureDetector(
                          onTap: () {
                            context.navigateTo(router.ai);
                          },
                          child: Container(
                            height: context.height(0.05),
                            width: context.width(0.5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: colors.color1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("chat with me"),
                            ),
                          ),
                        ),
                        context.width_box(0.02),
                        Container(
                          decoration: BoxDecoration(
                            color: colors.color1,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.voice_chat),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  context.height_box(0.03),
                  Row(
                    children: [
                      context.width_box(0.1),
                      Text(
                        'My service :',
                        style: textstyle.title.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  context.height_box(0.02),
                  // grid view builder of text
                  Container(
                    height: context.height(0.3),
                    child: Padding(
                      padding: EdgeInsets.only(right: 30, left: 30),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: toolsList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1.8,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                url = toolsList[index].url!;
                                Navigator.of(context).pushNamed(router.tools,
                                    arguments: toolsList[index].url);
                              });
                            },
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: colors.background,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Text(toolsList[index].title!,
                                    style: textstyle.title.copyWith(
                                      color: Colors.black,
                                      fontSize: 11,
                                    ))),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                      'Ai Home',
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
                    'My Tools:',
                    style: textstyle.title.copyWith(
                      fontSize: context.fontSize(20),
                    ),
                  ),
                
                ],
              ),
            ),
            context.height_box(0.03),
            // grid view builder for courses
            Container(
              height: context.height(0.4),
              child: Padding(
                padding:  EdgeInsets.only(left:context.width(0.1),right:context.width(0.1)),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: toolsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                            onTap: () {
                              setState(() {
                                url = toolsList[index].url!;
                                Navigator.of(context).pushNamed(router.tools,
                                    arguments: toolsList[index].url);
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: colors.background,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey[200],
                                    child: toolsList[index].icon,
                                  ),
                                  context.height_box(0.01),
                                  Text(toolsList[index].title!,
                                      style: textstyle.title.copyWith(
                                        color: Colors.black,
                                        fontSize: context.fontSize(15),
                                      )),
                                ],
                              ),
                            ),
                          );
                  }
                )
              ),
            ),
            context.height_box(0.03),
            // row of text field and 2 buttons
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  context.width_box(0.15),
                  GestureDetector(
                    onTap: () {
                      context.navigateTo(router.ai);
                    },
                    child: Container(
                      height: context.height(0.05),
                      width: context.width(0.3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: colors.color1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("chat with me"),
                      ),
                    ),
                  ),
                  context.width_box(0.02),
                  Container(
                    decoration: BoxDecoration(
                      color: colors.color1,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.voice_chat),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
            ,context.height_box(0.03),
            // my services text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Services:',
                    style: textstyle.title.copyWith(
                      fontSize: context.fontSize(20),
                    ),
                  ),
                  
                ],
              ),
            ) 


              ],
            ),
           )
            
          ],
        ),
      )
       

        );
  }
}

class tools {
  Icon? icon;
  String? title;
  String? url;
  tools({this.icon, this.title, this.url});
}
