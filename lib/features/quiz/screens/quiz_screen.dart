import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/drag.dart';
import 'package:flutter/src/rendering/viewport_offset.dart';
import 'package:lms/features/quiz/colors.dart';

import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import '../models/answer_form.dart';
import '../models/article_text.dart';
import '../models/mcq_image_text.dart';
import '../models/mcq_text.dart';
import '../models/short_answer.dart';
import '../models/test.dart';
import '../models/true_false.dart';
import '../models/uniqe_model.dart';
import '../widgets/artical_text_widget.dart';
import '../widgets/indicator.dart';
import '../widgets/mcq_image_text_widget.dart';
import '../widgets/mcq_text_widget.dart';
import '../widgets/short_answer_widget.dart';
import '../widgets/true_false_widget.dart';

class quiz_screen extends StatefulWidget {
  quiz_screen({super.key, required this.quiz_code, required this.name});
  String quiz_code;
  String name;

  @override
  State<quiz_screen> createState() => _quiz_screenState();
}

class _quiz_screenState extends State<quiz_screen> {
  List<Map<String, dynamic>> documents = [];
  bool quiztimer = false;
  int quizhour = 1;
  int quizminute = 10;
  bool questiontimer = false;
  int questionmin = 0;
  int questionsec = 0;

  Widget timer() {
    return TimerCountdown(
      format: CountDownTimerFormat.minutesSeconds,
      endTime: DateTime.now().add(
        Duration(
          //  days: 5,
          //  hours: 14,
          minutes: 100,
          // seconds: 34,
        ),
      ),
      onEnd: () {
        print("Timer finished");
      },
    );
  }

  upload() async {
    for (var item in answer_list) {
      documents.add({
        'question': item.question,
        'answer': item.answer,
      });
    }
    await FirebaseFirestore.instance
        .collection("Quizzes")
        .doc(widget.quiz_code)
        .collection('Answers')
        .add(
      {'Answers': documents, 'name': widget.name},
    );
    print("done2");
  }

  get() async {
    print("start");
    await FirebaseFirestore.instance
        .collection("Quizzes")
        .doc(widget.quiz_code)
        .get()
        .then((value) {
      setState(() {
        Map<String, dynamic> models = value.data()!;
        print(models);
        print(models['questions']);
        get_list = models['questions']
            .map((e) => uniqe_model.formJson(e))
            .toList()
            .cast<uniqe_model>();
        quiztimer = models['quiztimer'];
        quizhour = models['quizhour'];
        quizminute = models['quizminute'];
        questiontimer = models['questiontimer'];
        questionmin = models['questionmin'];
        questionsec = models['questionsec'];
        print(quizhour);
        print(quizminute);

        print(get_list[0].type);
      });
    });
    answer_list = List.filled(get_list.length, answer_form());
    color1_text = List.filled(get_list.length, colors.backgroundcolor);
    color2_text = List.filled(get_list.length, colors.backgroundcolor);
    color3_text = List.filled(get_list.length, colors.backgroundcolor);
    color4_text = List.filled(get_list.length, colors.backgroundcolor);
    color1_img = List.filled(get_list.length, colors.backgroundcolor);
    color2_img = List.filled(get_list.length, colors.backgroundcolor);
    color3_img = List.filled(get_list.length, colors.backgroundcolor);
    color4_img = List.filled(get_list.length, colors.backgroundcolor);
    color1_bool = List.filled(get_list.length, colors.backgroundcolor);
    color2_bool = List.filled(get_list.length, colors.backgroundcolor);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.backgroundcolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.2,
                  ),
                  TimerCountdown(
                    timeTextStyle: TextStyle(color: colors.fontcolor),
                    descriptionTextStyle: TextStyle(color: colors.fontcolor),
                    colonsTextStyle: TextStyle(color: colors.fontcolor),
                    format: CountDownTimerFormat.hoursMinutesSeconds,
                    endTime: DateTime.now().add(
                      Duration(
                        //  days: 5,
                        hours: quizhour,
                        minutes: quizminute,
                        // seconds: 34,
                      ),
                    ),
                    onEnd: () {
                      print("Timer finished");
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.2,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        upload();
                      },
                      child: Text("Next")),
                ],
              ),
              Container(
                height: MediaQuery.sizeOf(context).height,
                child: PageView.builder(
                  controller: controller,
                  itemCount: get_list.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                        child: Column(children: [
                      // Container(
                      //   height: 50,
                      //   width: MediaQuery.sizeOf(context).width * 0.8,
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: get_list.length,
                      //     itemBuilder: (context, index) {
                      //       return Row(
                      //         children: [
                      //           TaskProsses(index, index, list.length),
                      //         ],
                      //       );
                      //     },
                      //   ),
                      // ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.1,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                          ),
                          Text(
                            "${index + 1} / " + get_list.length.toString(),
                            style: TextStyle(
                                color: colors.fontcolor, fontSize: 25),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                          ),
                          TimerCountdown(
                            timeTextStyle: TextStyle(color: colors.fontcolor),
                            descriptionTextStyle:
                                TextStyle(color: colors.fontcolor),
                            colonsTextStyle: TextStyle(color: colors.fontcolor),
                            format: CountDownTimerFormat.minutesSeconds,
                            endTime: DateTime.now().add(
                              Duration(
                                //  days: 5,
                                //  hours: 14,
                                minutes: questionmin,
                                seconds: questionsec,
                              ),
                            ),
                            onEnd: () {
                              setState(() {
                                controller.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            if (get_list[index].type == 1) ...{
                              Container(
                                height: MediaQuery.sizeOf(context).height * 1.2,
                                child: mcq_text_widget(
                                    index: index,
                                    Q: mcq_text(
                                        question: get_list[index].question,
                                        option1: get_list[index].option1,
                                        option2: get_list[index].option2,
                                        option3: get_list[index].option3,
                                        option4: get_list[index].option4,
                                        correctAnswer:
                                            get_list[index].mcq_answer)),
                              )
                            } else if (get_list[index].type == 2) ...{
                              Container(
                                height: MediaQuery.sizeOf(context).height * 1.2,
                                child: mcq_image_text_widget(
                                    index: index,
                                    Q: mcq_image_text(
                                      question: get_list[index].question,
                                      option1: get_list[index].option1,
                                      option2: get_list[index].option2,
                                      option3: get_list[index].option3,
                                      option4: get_list[index].option4,
                                      correctAnswer: get_list[index].mcq_answer,
                                      image: get_list[index].image,
                                    )),
                              )
                            } else if (get_list[index].type == 3) ...{
                              Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.2,
                                  child: true_false_widget(
                                      index: index,
                                      Q: true_false(
                                          question: get_list[index].question,
                                          answer: get_list[index]
                                              .trueorfalse_answer)))
                            } else if (get_list[index].type == 4) ...{
                              Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.2,
                                  child: short_answer_widget(
                                      index: index,
                                      Q: short_answer(
                                          question: get_list[index].question)))
                            } else if (get_list[index].type == 5) ...{
                              Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.2,
                                  child: artical_text_widget(
                                      index: index,
                                      Q: article_text(
                                          question: get_list[index].question)))
                            } else ...{
                              Container()
                            }
                          ],
                        ),
                      )
                    ]));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
