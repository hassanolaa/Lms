import 'package:flutter/material.dart';
import 'package:lms/features/quiz/colors.dart';


import '../models/answer_form.dart';
import '../models/test.dart';
import '../models/true_false.dart';

class true_false_widget extends StatefulWidget {
  true_false_widget({
    super.key,
    required this.Q,
    required this.index
  });
  true_false Q;
  int index;

  @override
  State<true_false_widget> createState() => _true_false_widgetState();
}

class _true_false_widgetState extends State<true_false_widget> {
  Color color1 = colors.backgroundcolor;
  Color color2 = colors.backgroundcolor;
  bool isPressed = false;
  // Color color3 = Colors.white;
  // Color color4 = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      body: Center(
          child: Column(children: <Widget>[
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
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
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colors.primarycolor,
              width: 2,
            ),
          ),
          child: Align(
            alignment: Alignment(0, -0.7),
            child: Text(
              widget.Q.question!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colors.fontcolor,
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                    color1_bool[widget.index] = colors.primarycolor;
                    color2_bool[widget.index] = colors.backgroundcolor;
                answer_list[widget.index]=answer_form(
                    question: widget.Q.question,answer: "true");
                   
                  });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.3,
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
                  color: color1_bool[widget.index],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: colors.primarycolor,
                    width: 2,
                  ),
                ),
                child: Align(
                  alignment: Alignment(-0.9, -0.6),
                  child: Center(
                    child: Text(
                      "true",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors.fontcolor,
                      ),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                
                  setState(() {
                    color2_bool[widget.index] = colors.primarycolor;
                    color1_bool[widget.index] = colors.backgroundcolor;
                answer_list[widget.index]=answer_form(
                    question: widget.Q.question,answer: "false");
                   
                  });
                
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.3,
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
                  color: color2_bool[widget.index],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: colors.primarycolor,
                    width: 2,
                  ),
                ),
                child: Align(
                  alignment: Alignment(-0.9, -0.6),
                  child: Center(
                    child: Text(
                      "false",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors.fontcolor,
                      ),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ])),
    );
  }
}
