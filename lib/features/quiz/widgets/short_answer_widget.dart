import 'package:flutter/material.dart';
import 'package:lms/features/quiz/colors.dart';

import '../models/answer_form.dart';
import '../models/short_answer.dart';
import '../models/test.dart';

class short_answer_widget extends StatefulWidget {
  short_answer_widget({super.key, required this.Q,required this.index});
  short_answer Q;
  int index;
  @override
  State<short_answer_widget> createState() => _short_answer_widgetState();
}

class _short_answer_widgetState extends State<short_answer_widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: colors.shadowcolor,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: const Offset(0, 3),
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
                  alignment: const Alignment(0, -0.8),
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
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: colors.shadowcolor,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: const Offset(0, 3),
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
                  alignment: const Alignment(0, -0.7),
                  child: TextFormField(
                        style: TextStyle(
                    color: colors.fontcolor,),
                    onChanged: (text) {
                      widget.Q.answer = text;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your answer',
                      labelStyle: TextStyle(
                        color: colors.fontcolor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colors.primarycolor,
                  onPrimary: colors.secondarycolor,
                  shadowColor: colors.shadowcolor,
                  elevation: 5,
                ),
                onPressed: () {
                   answer_list[widget.index]=answer_form(
                    question: widget.Q.question, answer: widget.Q.answer);
                },
                child: const Text('Next Question'),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
