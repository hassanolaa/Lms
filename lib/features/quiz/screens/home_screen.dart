import 'package:flutter/material.dart';
import 'package:lms/features/quiz/colors.dart';

import '../models/article_text.dart';
import '../models/mcq_image_text.dart';
import '../models/mcq_text.dart';
import '../models/short_answer.dart';
import '../models/test.dart';
import '../models/true_false.dart';
import '../widgets/artical_text_widget.dart';
import '../widgets/indicator.dart';
import '../widgets/mcq_image_text_widget.dart';
import '../widgets/mcq_text_widget.dart';
import '../widgets/short_answer_widget.dart';
import '../widgets/true_false_widget.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: colors.backgroundcolor,
        body: PageView.builder(
      itemCount: uniqe_list.length,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
            child: Column(children: [
               Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: uniqe_list.length,
                  itemBuilder: (context, index) {
                    return TaskProsses(index,index,list.length);
                  },
                )
                ),
          Container(
         
            child: Column(children: [
              
                 if (uniqe_list[index].type == 5) ...{
                   Container(
                height: 1000,
                child:
            artical_text_widget(
              index: index,
              Q: article_text(
               question: uniqe_list[index].question))

                )
            
          } else if (uniqe_list[index].type == 3) ...{
            Container(
                height: 500,
                child: true_false_widget(
                  index: index,
                Q: true_false(
                 question: uniqe_list[index].question,
            answer: uniqe_list[index].trueorfalse_answer)
                ))
          } else if (uniqe_list[index].type==1) ...{
              
            Container(height: 500, child: mcq_text_widget(  
              index: index,
               Q: mcq_text(
                                        question: uniqe_list[index].question,
                                        option1: uniqe_list[index].option1,
                                        option2: uniqe_list[index].option2,
                                        option3: uniqe_list[index].option3,
                                        option4: uniqe_list[index].option4,
                                        correctAnswer:
                                            uniqe_list[index].mcq_answer)))
          } else if (uniqe_list[index].type == 2) ...{
                 Container(
                height: 500,
                child:
                        mcq_image_text_widget(
                          index: index,
                           Q: mcq_image_text(
                                  question: uniqe_list[index].question,
                                  option1: uniqe_list[index].option1,
                                  option2: uniqe_list[index].option2,
                                  option3: uniqe_list[index].option3,
                                  option4: uniqe_list[index].option4,
                                  correctAnswer: uniqe_list[index].mcq_answer,
                                  image: uniqe_list[index].image,
                                ))
                )
          } else if (uniqe_list[index].type == 4) ...{
            Container(
                height: 500,
                child:
            short_answer_widget( 
              index: index,
               Q: short_answer(
                                          question: uniqe_list[index].question))
                    
                )
          } else ...{
            Container()
          }
            ],),
          )
        ]));
      },
    ));
  }
}



 