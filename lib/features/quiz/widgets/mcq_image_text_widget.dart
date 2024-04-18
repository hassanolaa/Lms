import 'package:flutter/material.dart';
import 'package:lms/features/quiz/colors.dart';

import '../models/answer_form.dart';
import '../models/mcq_image_text.dart';
import '../models/test.dart';

class mcq_image_text_widget extends StatefulWidget {
  mcq_image_text_widget({
    super.key,
    required this.Q,
    required this.index
  });
  mcq_image_text Q;
  int index;

  @override
  State<mcq_image_text_widget> createState() => _mcq_image_text_widgetState();
}

class _mcq_image_text_widgetState extends State<mcq_image_text_widget> {
  Color color1 = colors.backgroundcolor;
  Color color2 = colors.backgroundcolor;
  Color color3 = colors.backgroundcolor;
  Color color4 = colors.backgroundcolor;

  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.backgroundcolor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
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
                  color: color1,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: colors.primarycolor,
                    width: 2,
                  ),
                ),
                child: Align(
                  alignment: Alignment(0, -0.8),
                  child: Column(
                    children: [
                      Text(
                        widget.Q.question!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colors.fontcolor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.network(
                        widget.Q.image!,
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  
                    setState(() {
                      
              color1_img[widget.index] = colors.primarycolor;
               color2_img[widget.index] = colors.backgroundcolor;
               color3_img[widget.index] = colors.backgroundcolor;
               color4_img[widget.index] = colors.backgroundcolor;
                         answer_list[widget.index]=answer_form(
                    question: widget.Q.question, answer: widget.Q.option1!);
                    });
                  
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
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
                    color: color1_img[widget.index],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: colors.primarycolor,
                      width: 2,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment(-0.9, -0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              widget.Q.option1!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: colors.fontcolor,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                           
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                
                       setState(() {
                      
              color1_img[widget.index] = colors.backgroundcolor;
               color2_img[widget.index] = colors.primarycolor;
               color3_img[widget.index] = colors.backgroundcolor;
               color4_img[widget.index] = colors.backgroundcolor;
                         answer_list[widget.index]=answer_form(
                    question: widget.Q.question, answer: widget.Q.option2!);
                    });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
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
                    color: color2_img[widget.index],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: colors.primarycolor,
                      width: 2,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment(-0.9, -0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              widget.Q.option2!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: colors.fontcolor,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                          
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                       setState(() {
                      
              color1_img[widget.index] = colors.backgroundcolor;
               color2_img[widget.index] = colors.backgroundcolor;
               color3_img[widget.index] = colors.primarycolor;
               color4_img[widget.index] = colors.backgroundcolor;
                         answer_list[widget.index]=answer_form(
                    question: widget.Q.question, answer: widget.Q.option3!);
                    });
                
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
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
                    color: color3_img[widget.index],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: colors.primarycolor,
                      width: 2,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment(-0.9, -0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              widget.Q.option3!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: colors.fontcolor,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                          
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                       setState(() {
                      
              color1_img[widget.index] = colors.backgroundcolor;
               color2_img[widget.index] = colors.backgroundcolor;
               color3_img[widget.index] = colors.backgroundcolor;
               color4_img[widget.index] = colors.primarycolor;
                         answer_list[widget.index]=answer_form(
                    question: widget.Q.question, answer: widget.Q.option4!);
                    });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
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
                    color: color4_img[widget.index],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: colors.primarycolor,
                      width: 2,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment(-0.9, -0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              widget.Q.option4!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: colors.fontcolor,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                        
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
