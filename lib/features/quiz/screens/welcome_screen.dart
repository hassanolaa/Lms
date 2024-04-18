import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lms/features/quiz/colors.dart';
import 'package:lms/features/quiz/screens/quiz_screen.dart';
import 'dart:html' as html;
import 'create_quiz.dart';

class welcome_screen extends StatefulWidget {
  const welcome_screen({super.key});

  @override
  State<welcome_screen> createState() => _welcome_screenState();
}

class _welcome_screenState extends State<welcome_screen> {
  String quiz_code = "";
  String code = "";
  String name = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    html.document.documentElement!.requestFullscreen();
    print(isFullscreen());
   // myFunction();
  }

  bool _isInFullscreen = true; // Assuming initial fullscreen state
  Timer? _fullscreenCheckTimer;
  @override
  void dispose() {
    _fullscreenCheckTimer?.cancel(); // Clean up timer on widget disposal
    super.dispose();
  }

  bool isFullscreen() {
    return html.document.fullscreenElement != null;
  }

  void myFunction() {
    // Your code to be executed every 5 seconds
    print('This function is called every 5 seconds');
    if (isFullscreen() == false) {
      print('go to full screen mode');
    }
    // Schedule the next execution after 5 seconds
    Future.delayed(Duration(seconds: 5)).then((_) => myFunction());
  }

  Widget quiz_note() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: MediaQuery.sizeOf(context).width * 0.7,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: colors.shadowcolor,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(0, 3),
            )
          ],
          shape: BoxShape.rectangle,
          color: colors.backgroundcolor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colors.primarycolor, width: 2)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          Text(
            "Note",
            style: TextStyle(color: colors.fontcolor, fontSize: 20),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          Text(
            "Note",
            style: TextStyle(color: colors.fontcolor, fontSize: 20),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                auto = true;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => create_quiz()));
              });
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width * 0.3,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: colors.shadowcolor,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                  shape: BoxShape.rectangle,
                  color: colors.backgroundcolor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colors.primarycolor, width: 2)),
              child: Center(
                  child: Text(
                "Create",
                style: TextStyle(color: colors.fontcolor, fontSize: 20),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget quiz_type() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: MediaQuery.sizeOf(context).width * 0.7,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: colors.shadowcolor,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(0, 3),
            )
          ],
          shape: BoxShape.rectangle,
          color: colors.backgroundcolor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colors.primarycolor, width: 2)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          Text(
            "Quiz Scoring",
            style: TextStyle(color: colors.fontcolor, fontSize: 20),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                auto = false;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => create_quiz()));
              });
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width * 0.3,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: colors.shadowcolor,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                  shape: BoxShape.rectangle,
                  color: colors.backgroundcolor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colors.primarycolor, width: 2)),
              child: Center(
                  child: Text(
                "Manual",
                style: TextStyle(color: colors.fontcolor, fontSize: 20),
              )),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                SmartDialog.show(builder: (context) {
                  return quiz_note();
                });
              });
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width * 0.3,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: colors.shadowcolor,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                  shape: BoxShape.rectangle,
                  color: colors.backgroundcolor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colors.primarycolor, width: 2)),
              child: Center(
                  child: Text(
                "Auto",
                style: TextStyle(color: colors.fontcolor, fontSize: 20),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget code_widget() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: MediaQuery.sizeOf(context).width * 0.7,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: colors.shadowcolor,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(0, 3),
            )
          ],
          shape: BoxShape.rectangle,
          color: colors.backgroundcolor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colors.primarycolor, width: 2)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.3,
            child: TextField(
              onChanged: (value) {
                code = value;
              },
              decoration: InputDecoration(
                  hintText: " Quiz Code",
                  hintStyle: TextStyle(color: colors.fontcolor, fontSize: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: colors.primarycolor, width: 2))),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.3,
            child: TextField(
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                  hintText: " Your Name",
                  hintStyle: TextStyle(color: colors.fontcolor, fontSize: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: colors.primarycolor, width: 2))),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (name != "" || code != "") {
                  print("hasssan");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => quiz_screen(
                                name: name,
                                quiz_code: code,
                              )));
                } else {
                  SnackBar(
                    content: Text("Please Enter Name and Quiz Code"),
                    backgroundColor: colors.primarycolor,
                  );
                }
              });
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: colors.shadowcolor,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                  shape: BoxShape.rectangle,
                  color: colors.backgroundcolor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colors.primarycolor, width: 2)),
              child: Center(
                  child: Text(
                "Enter",
                style: TextStyle(color: colors.fontcolor, fontSize: 20),
              )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.backgroundcolor,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          colors.setMode();
                        });
                      },
                      icon: Icon(
                        Icons.settings,
                        color: colors.primarycolor,
                        size: 30,
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.2,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    SmartDialog.show(builder: (context) {
                      return code_widget();
                    });
                  });
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: colors.shadowcolor,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ],
                      shape: BoxShape.rectangle,
                      color: colors.backgroundcolor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colors.primarycolor, width: 2)),
                  child: Center(
                      child: Text(
                    "Join Quiz",
                    style: TextStyle(color: colors.fontcolor, fontSize: 20),
                  )),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.07,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    SmartDialog.show(builder: (context) {
                      return quiz_type();
                    });
                  });

                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>create_quiz()));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: colors.shadowcolor,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ],
                      shape: BoxShape.rectangle,
                      color: colors.backgroundcolor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colors.primarycolor, width: 2)),
                  child: Center(
                      child: Text(
                    "Create Quiz",
                    style: TextStyle(color: colors.fontcolor, fontSize: 20),
                  )),
                ),
              ),
            ],
          ),
        ));
  }
}
