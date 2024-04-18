import 'package:flutter/material.dart';
import 'package:lms/features/quiz/colors.dart';

import '../models/answer_form.dart';
import '../models/article_text.dart';
import '../models/test.dart';

class artical_text_widget extends StatefulWidget {
  artical_text_widget({super.key, required this.Q, required this.index});
  article_text Q;
  int index;

  @override
  State<artical_text_widget> createState() => _artical_text_widgetState();
}

class _artical_text_widgetState extends State<artical_text_widget> {
  String answer = "";
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
                height: MediaQuery.of(context).size.height * 0.4,
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
                height: MediaQuery.of(context).size.height * 0.4,
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
                      setState(() {
                        answer = text;
                      });
                    },
                    maxLines: 100,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your answer',
                      labelStyle: TextStyle(color: colors.fontcolor),
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
                  answer_list[widget.index] =
                      answer_form(question: widget.Q.question, answer: answer);
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
