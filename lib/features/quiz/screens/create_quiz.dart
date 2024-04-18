import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lms/features/quiz/colors.dart';
import 'package:lms/features/quiz/screens/welcome_screen.dart';

import '../models/test.dart';
import '../models/uniqe_model.dart';
import 'home_screen.dart';

class create_quiz extends StatefulWidget {
  create_quiz({super.key});

  @override
  State<create_quiz> createState() => _create_quizState();
}

class _create_quizState extends State<create_quiz> {
  SlidingUpPanelController _controller = new SlidingUpPanelController();
  List<Map<String, dynamic>> documents = [];
  String quizname = "";
  bool quiztimer = false;

  get() async {
    print("start");
    await FirebaseFirestore.instance
        .collection("Quizzes")
        .doc("zF8wpAC9UQOic4x4uh42")
        .get()
        .then((value) {
      Map<String, dynamic> models = value.data()!;
      print(models);
      print(models['questions']);
      get_list = models['questions']
          .map((e) => uniqe_model.formJson(e))
          .toList()
          .cast<uniqe_model>();
      print(get_list[0].type);
    });

    // print("start1");

    // List<uniqe_model> getitem = await snapshot.docs
    //     .map((doc) => uniqe_model.formSnapshot(doc))
    //     .toList();
    // print("start2");
    // print(getitem);
  }

  upload() async {
    for (var item in uniqe_list) {
      documents.add({
        'type': item.type,
        'question': item.question,
        'option1': item.option1,
        'option2': item.option2,
        'option3': item.option3,
        'option4': item.option4,
        'image': item.image,
        'mcq_answer': item.mcq_answer,
        'trueorfalse_answer': item.trueorfalse_answer
      });
    }
    await FirebaseFirestore.instance.collection("Quizzes").doc(quizname).set(
      {
        'questions': documents,
        'type': auto ? 'solved' : 'not',
      },
    );
    print("done2");
  }

  // Widget publish_quiz() {
  //   return StatefulBuilder(builder:(context,set){
  //     return Center(
  //     child: Container(
  //         decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: colors.backgroundcolor,
  //       ),
  //       height: MediaQuery.of(context).size.height * 0.6,
  //       width: MediaQuery.of(context).size.width * 0.6,
  //       child: Column(
  //         children: [
  //           SizedBox(height: 20),
  //           Container(
  //             width: MediaQuery.of(context).size.width * 0.5,
  //             height: MediaQuery.of(context).size.height * 0.05,
  //             decoration: BoxDecoration(
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: colors.shadowcolor,
  //                   blurRadius: 10,
  //                   spreadRadius: 5,
  //                   offset: Offset(0, 3),
  //                 )
  //               ],
  //               shape: BoxShape.rectangle,
  //               color: colors.backgroundcolor,
  //               borderRadius: BorderRadius.circular(10),
  //               border: Border.all(
  //                 color: colors.primarycolor,
  //                 width: 2,
  //               ),
  //             ),
  //             child: Align(
  //               alignment: Alignment(0, -0.7),
  //               child: TextField(
  //                 onChanged: (value) {
  //                  setState(() {
  //                     quizname = value;
  //                  });
  //                 },
  //                 maxLines: 3,
  //                 decoration: InputDecoration(
  //                   border: OutlineInputBorder(),
  //                   labelText: 'Enter your quiz name',
  //                   labelStyle: TextStyle(
  //                     color: colors.fontcolor,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 20),
  //          Align(
  //               alignment: Alignment(0, -0.7),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   SizedBox(width: MediaQuery.sizeOf(context).width*0.08,),
  //                   Text("Quiz Time",style: TextStyle(color: colors.fontcolor,fontWeight: FontWeight.bold),),
  //                   SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
  //                   GestureDetector(
  //                     onTap: (){
  //                      Set(){
  //                        set(() {
  //                          quiztimer = !quiztimer;
  //                        });
  //                      }
  //                     },
  //                     child: Container(
  //                       width: MediaQuery.of(context).size.width * 0.025,
  //                       height: MediaQuery.of(context).size.height * 0.04,
  //                       decoration: BoxDecoration(
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: colors.shadowcolor,
  //                             blurRadius: 10,
  //                             spreadRadius: 5,
  //                             offset: Offset(0, 3),
  //                           )
  //                         ],

  //                         color: quiztimer? colors.primarycolor:colors.backgroundcolor,
  //                         borderRadius: BorderRadius.circular(3),
  //                         border: Border.all(
  //                           color:colors.primarycolor,
  //                           width: 2,
  //                         ),
  //                       ),
  //                       child: Icon(Icons.done, color: quiztimer? colors.backgroundcolor:colors.primarycolor,),
  //                     ),
  //                   )
  //                 ],

  //             ),
  //           ),
  //           SizedBox(height: 20),

  //           GestureDetector(
  //             onTap: () {
  //               setState(() {
  //                 upload();
  //                 Navigator.push(context,
  //                     MaterialPageRoute(builder: (context) => welcome_screen()));
  //               });
  //             },
  //             child: Container(
  //               height: MediaQuery.of(context).size.height * 0.05,
  //               width: MediaQuery.of(context).size.width * 0.5,
  //               decoration: BoxDecoration(
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: colors.shadowcolor,
  //                     blurRadius: 10,
  //                     spreadRadius: 5,
  //                     offset: Offset(0, 3),
  //                   )
  //                 ],
  //                 shape: BoxShape.rectangle,
  //                 color: colors.backgroundcolor,
  //                 borderRadius: BorderRadius.circular(10),
  //                 border: Border.all(
  //                   color: colors.primarycolor,
  //                   width: 2,
  //                 ),
  //               ),
  //               child: Center(
  //                 child: Text(
  //                   'Publish',
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold,
  //                     color: colors.fontcolor,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           )

  //       ],),

  //     ),
  //   );

  //   }
  //   );
  //  }

  Widget create_mcq_textt({
    String? q,
    String? o1,
    String? o2,
    String? o3,
    String? o4,
    bool? edit,
    int? index,
  }) {
    TextEditingController questionController = TextEditingController();
    TextEditingController option1Controller = TextEditingController();
    TextEditingController option2Controller = TextEditingController();
    TextEditingController option3Controller = TextEditingController();
    TextEditingController option4Controller = TextEditingController();

    questionController.text = q ?? '';
    option1Controller.text = o1 ?? '';
    option2Controller.text = o2 ?? '';
    option3Controller.text = o3 ?? '';
    option4Controller.text = o4 ?? '';
    String answer = "";

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.backgroundcolor,
        ),
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.2,
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
                child: TextField(
                  style: TextStyle(
                    color: colors.fontcolor,
                  ),
                  controller: questionController,
                  maxLines: 7,
                  decoration: InputDecoration(  
                    border: OutlineInputBorder(),
                    labelText: 'Enter question',
                    labelStyle: TextStyle(
                      color: colors.fontcolor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
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
                color: colors.backgroundcolor,
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
                      child: TextField(
                         style: TextStyle(
                    color: colors.fontcolor,
                  ),
                        controller: option1Controller,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter option 1',
                          labelStyle: TextStyle(
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
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
                color: colors.backgroundcolor,
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
                      child: TextField(
                         style: TextStyle(
                    color: colors.fontcolor,
                  ),
                        controller: option2Controller,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter option 2',
                          labelStyle: TextStyle(
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
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
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
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
                color: colors.backgroundcolor,
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
                      child: TextField(
                         style: TextStyle(
                    color: colors.fontcolor,
                  ),
                        controller: option3Controller,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter option 3',
                          labelStyle: TextStyle(
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
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
                color: colors.backgroundcolor,
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
                      child: TextField(
                         style: TextStyle(
                    color: colors.fontcolor,
                  ),
                        controller: option4Controller,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter option 4',
                          labelStyle: TextStyle(
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (edit == false) ...{
              if (auto == false) ...{
                GestureDetector(
                  onTap: () {
                    setState(() {
                      uniqe_list.add(uniqe_model(
                        type: 1,
                        question: questionController.text,
                        option1: option1Controller.text,
                        option2: option2Controller.text,
                        option3: option3Controller.text,
                        option4: option4Controller.text,
                        image: "",
                        mcq_answer: "",
                        trueorfalse_answer: false,
                      ));
                      SmartDialog.dismiss();
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.7,
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
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colors.fontcolor,
                        ),
                      ),
                    ),
                  ),
                )
              } else ...{
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          List<String> answers = [
                            option1Controller.text,
                            option2Controller.text,
                            option3Controller.text,
                            option4Controller.text
                          ];

                          SmartDialog.show(builder: (context) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
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
                                child: ListView.builder(
                                    itemBuilder: (context, index) => ListTile(
                                        title: Expanded(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              answers[index],
                                              overflow: TextOverflow.visible,
                                              style: TextStyle(
                                                color: colors.fontcolor,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.done,
                                            color: colors.fontcolor,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              answer = answers[index];
                                              SmartDialog.dismiss();
                                            });
                                          },
                                        )),
                                    itemCount: answers.length),
                              ),
                            );
                          });
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.08,
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
                          alignment: Alignment(-0.9, -0.6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Answer',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: colors.fontcolor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          uniqe_list.add(uniqe_model(
                            type: 1,
                            question: questionController.text,
                            option1: option1Controller.text,
                            option2: option2Controller.text,
                            option3: option3Controller.text,
                            option4: option4Controller.text,
                            image: "",
                            mcq_answer: answer,
                            trueorfalse_answer: false,
                          ));
                          SmartDialog.dismiss();
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.35,
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
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: colors.fontcolor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              }
            } else ...{
              Row(
                children: [
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        uniqe_list[index!] = uniqe_model(
                          type: 1,
                          question: questionController.text,
                          option1: option1Controller.text,
                          option2: option2Controller.text,
                          option3: option3Controller.text,
                          option4: option4Controller.text,
                          image: "",
                          mcq_answer: "",
                          trueorfalse_answer: false,
                        );
                        print(uniqe_list[0].question);
                        print(uniqe_list[0].type);

                        // list.add(mcq_text(
                        //   question: questionController.text,
                        //   option1: option1Controller.text,
                        //   option2: option2Controller.text,
                        //   option3: option3Controller.text,
                        //   option4: option4Controller.text,
                        // ));
                        // print(list[0].question);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) =>home_screen()));
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
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
                      child: Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        uniqe_list.removeAt(index!);

                        // list.add(mcq_text(
                        //   question: questionController.text,
                        //   option1: option1Controller.text,
                        //   option2: option2Controller.text,
                        //   option3: option3Controller.text,
                        //   option4: option4Controller.text,
                        // ));
                        // print(list[0].question);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) =>home_screen()));
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.35,
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
                      child: Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            }
          ]),
        ),
      ),
    );
  }

  Widget create_mcq_image({
    String? q,
    String? o1,
    String? o2,
    String? o3,
    String? o4,
    String? img,
    bool? edit,
    int? index,
  }) {
    TextEditingController questionController = TextEditingController();
    TextEditingController option1Controller = TextEditingController();
    TextEditingController option2Controller = TextEditingController();
    TextEditingController option3Controller = TextEditingController();
    TextEditingController option4Controller = TextEditingController();
    questionController.text = q ?? '';
    option1Controller.text = o1 ?? '';
    option2Controller.text = o2 ?? '';
    option3Controller.text = o3 ?? '';
    option4Controller.text = o4 ?? '';
    String answer = "";

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.backgroundcolor,
        ),
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.2,
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
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0, -0.7),
                    child: TextField(
                       style: TextStyle(
                    color: colors.fontcolor,),
                      controller: questionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your question',
                        labelStyle: TextStyle(
                          color: colors.fontcolor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.3,
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
                    child: Center(
                      child: Text(
                        'Upload image',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colors.fontcolor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
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
                color: colors.backgroundcolor,
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
                      child: TextField(
                            style: TextStyle(
                    color: colors.fontcolor,),
                        controller: option1Controller,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter option 1',
                          labelStyle: TextStyle(
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
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
                color: colors.backgroundcolor,
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
                      child: TextField(
                            style: TextStyle(
                    color: colors.fontcolor,),
                        controller: option2Controller,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter option 2',
                          labelStyle: TextStyle(
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
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
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
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
                color: colors.backgroundcolor,
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
                      child: TextField(
                            style: TextStyle(
                    color: colors.fontcolor,),
                        controller: option3Controller,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter option 3',
                          labelStyle: TextStyle(
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
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
                color: colors.backgroundcolor,
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
                      child: TextField(
                            style: TextStyle(
                    color: colors.fontcolor,),
                        controller: option4Controller,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter option 4',
                          labelStyle: TextStyle(
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (edit == false) ...{
              if (auto == false) ...{
                GestureDetector(
                  onTap: () {
                    setState(() {
                      uniqe_list.add(uniqe_model(
                          type: 2,
                          question: questionController.text,
                          option1: option1Controller.text,
                          option2: option2Controller.text,
                          option3: option3Controller.text,
                          option4: option4Controller.text,
                          image: img,
                          mcq_answer: "",
                          trueorfalse_answer: false));
                    });
                    SmartDialog.dismiss();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.7,
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
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colors.fontcolor,
                        ),
                      ),
                    ),
                  ),
                )
              } else ...{
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          List<String> answers = [
                            option1Controller.text,
                            option2Controller.text,
                            option3Controller.text,
                            option4Controller.text
                          ];

                          SmartDialog.show(builder: (context) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
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
                                child: ListView.builder(
                                    itemBuilder: (context, index) => ListTile(
                                        title: Expanded(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              answers[index],
                                              overflow: TextOverflow.visible,
                                              style: TextStyle(
                                                color: colors.fontcolor,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.done,
                                            color: colors.fontcolor,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              answer = answers[index];
                                              SmartDialog.dismiss();
                                            });
                                          },
                                        )),
                                    itemCount: answers.length),
                              ),
                            );
                          });
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.08,
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
                          alignment: Alignment(-0.9, -0.6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Answer',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: colors.fontcolor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          uniqe_list.add(uniqe_model(
                              type: 2,
                              question: questionController.text,
                              option1: option1Controller.text,
                              option2: option2Controller.text,
                              option3: option3Controller.text,
                              option4: option4Controller.text,
                              image: img,
                              mcq_answer: answer,
                              trueorfalse_answer: false));
                        });
                        SmartDialog.dismiss();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.35,
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
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: colors.fontcolor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              }
            } else ...{
              Row(
                children: [
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        uniqe_list[index!] = uniqe_model(
                            type: 2,
                            question: questionController.text,
                            option1: option1Controller.text,
                            option2: option2Controller.text,
                            option3: option3Controller.text,
                            option4: option4Controller.text,
                            image: img,
                            mcq_answer: "",
                            trueorfalse_answer: false);
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
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
                      child: Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        uniqe_list.removeAt(index!);
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.35,
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
                      child: Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            }
          ]),
        ),
      ),
    );
  }

  Widget create_trueorfalse({
    String? q,
    bool? edit,
    int? index,
  }) {
    TextEditingController questionController = TextEditingController();
    questionController.text = q ?? "";
    String answer = "";

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.backgroundcolor,
        ),
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.2,
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
                child: TextField(
                      style: TextStyle(
                    color: colors.fontcolor,),
                  controller: questionController,
                  maxLines: 7,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your question',
                    labelStyle: TextStyle(
                      color: colors.fontcolor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
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
                      color: colors.backgroundcolor,
                      borderRadius: BorderRadius.circular(10),
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
                      color: colors.backgroundcolor,
                      borderRadius: BorderRadius.circular(10),
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
            SizedBox(height: 50),
            if (edit == false) ...{
              if (auto == false) ...{
                GestureDetector(
                  onTap: () {
                    setState(() {
                      uniqe_list.add(uniqe_model(
                        type: 3,
                        question: questionController.text,
                        option1: "",
                        option2: "",
                        option3: "",
                        option4: "",
                        image: "",
                        mcq_answer: "",
                        trueorfalse_answer: false,
                      ));
                      SmartDialog.dismiss();
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.7,
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
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colors.fontcolor,
                        ),
                      ),
                    ),
                  ),
                )
              } else ...{
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          List<String> answers = ["true", "false"];

                          SmartDialog.show(builder: (context) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
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
                                child: ListView.builder(
                                    itemBuilder: (context, index) => ListTile(
                                        title: Expanded(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              answers[index],
                                              overflow: TextOverflow.visible,
                                              style: TextStyle(
                                                color: colors.fontcolor,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.done,
                                            color: colors.fontcolor,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              answer = answers[index];
                                              SmartDialog.dismiss();
                                            });
                                          },
                                        )),
                                    itemCount: answers.length),
                              ),
                            );
                          });
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.08,
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
                          alignment: Alignment(-0.9, -0.6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Answer',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: colors.fontcolor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          uniqe_list.add(uniqe_model(
                            type: 3,
                            question: questionController.text,
                            option1: "",
                            option2: "",
                            option3: "",
                            option4: "",
                            image: "",
                            mcq_answer: answer,
                            trueorfalse_answer: false,
                          ));
                          SmartDialog.dismiss();
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.35,
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
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: colors.fontcolor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              }
            } else ...{
              Row(
                children: [
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        uniqe_list[index!] = uniqe_model(
                          type: 3,
                          question: questionController.text,
                          option1: "",
                          option2: "",
                          option3: "",
                          option4: "",
                          image: "",
                          mcq_answer: "",
                          trueorfalse_answer: false,
                        );
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
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
                      child: Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        uniqe_list.removeAt(index!);
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.35,
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
                      child: Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            }
          ]),
        ),
      ),
    );
  }

  Widget create_shortanswer({
    String? q,
    bool? edit,
    int? index,
  }) {
    TextEditingController questionController = TextEditingController();
    questionController.text = q ?? "";

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.backgroundcolor,
        ),
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.2,
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
                child: TextField(
                      style: TextStyle(
                    color: colors.fontcolor,),
                  controller: questionController,
                  maxLines: 7,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your question',
                    labelStyle: TextStyle(
                      color: colors.fontcolor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.2,
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
                child: Text(
                  'Answer will be here',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colors.fontcolor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (edit == false) ...{
              GestureDetector(
                onTap: () {
                  setState(() {
                    uniqe_list.add(uniqe_model(
                      type: 4,
                      question: questionController.text,
                      option1: "",
                      option2: "",
                      option3: "",
                      option4: "",
                      image: "",
                      mcq_answer: "",
                      trueorfalse_answer: false,
                    ));
                    SmartDialog.dismiss();
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.7,
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
                  child: Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors.fontcolor,
                      ),
                    ),
                  ),
                ),
              )
            } else ...{
              Row(
                children: [
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        uniqe_list[index!] = uniqe_model(
                          type: 4,
                          question: questionController.text,
                          option1: "",
                          option2: "",
                          option3: "",
                          option4: "",
                          image: "",
                          mcq_answer: "",
                          trueorfalse_answer: false,
                        );
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
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
                      child: Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        uniqe_list.removeAt(index!);
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.35,
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
                      child: Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            }
          ]),
        ),
      ),
    );
  }

  Widget create_longanswer({
    String? q,
    bool? edit,
    int? index,
  }) {
    TextEditingController questionController = TextEditingController();
    questionController.text = q ?? "";
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.backgroundcolor,
        ),
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.2,
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
                child: TextField(
                      style: TextStyle(
                    color: colors.fontcolor,),
                  controller: questionController,
                  maxLines: 7,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your question',
                    labelStyle: TextStyle(
                      color: colors.fontcolor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.7,
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
                alignment: const Alignment(0, -0.7),
                child: Text(
                  'Answer will be here',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colors.fontcolor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (edit == false) ...{
              GestureDetector(
                onTap: () {
                  setState(() {
                    uniqe_list.add(uniqe_model(
                      type: 5,
                      question: questionController.text,
                      option1: "",
                      option2: "",
                      option3: "",
                      option4: "",
                      image: "",
                      mcq_answer: "",
                      trueorfalse_answer: false,
                    ));
                    SmartDialog.dismiss();
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.7,
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
                  child: Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors.fontcolor,
                      ),
                    ),
                  ),
                ),
              )
            } else ...{
              Row(
                children: [
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        uniqe_list[index!] = uniqe_model(
                          type: 5,
                          question: questionController.text,
                          option1: "",
                          option2: "",
                          option3: "",
                          option4: "",
                          image: "",
                          mcq_answer: "",
                          trueorfalse_answer: false,
                        );
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
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
                      child: Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        uniqe_list.removeAt(index!);
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.35,
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
                      child: Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.fontcolor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            }
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ListTile> questions = [];
    questions.add(ListTile(
      leading: Icon(Icons.circle_outlined),
      title: Text("MCQ Text Question"),
      onTap: () {
        print("hassab");
        setState(() {
          SmartDialog.show(builder: (context) {
            return create_mcq_textt(edit: false);
          });
        });
      },
    ));
    questions.add(ListTile(
      leading: Icon(Icons.image),
      title: Text("MCQ Image Question"),
      onTap: () {
        setState(() {
          SmartDialog.show(builder: (context) {
            return create_mcq_image(edit: false);
          });
        });
      },
    ));
    questions.add(ListTile(
      leading: Icon(CupertinoIcons.question_circle),
      title: Text("True or False Question"),
      onTap: () {
        setState(() {
          SmartDialog.show(builder: (context) {
            return create_trueorfalse(edit: false);
          });
        });
      },
    ));
    questions.add(ListTile(
      leading: Icon(Icons.article_outlined),
      title: Text("Long Answer Question"),
      onTap: () {
        setState(() {
          SmartDialog.show(builder: (context) {
            return create_longanswer(edit: false);
          });
        });
      },
    ));
    questions.add(ListTile(
      leading: Icon(Icons.short_text),
      title: Text("Short Answer Question"),
      onTap: () {
        setState(() {
          SmartDialog.show(builder: (context) {
            return create_shortanswer(edit: false);
          });
        });
      },
    ));
    List<ListTile> auto_quiz = [];
    auto_quiz.add(ListTile(
      leading: Icon(Icons.circle_outlined),
      title: Text("MCQ Text Question"),
      onTap: () {
        print("hassab");
        setState(() {
          SmartDialog.show(builder: (context) {
            return create_mcq_textt(edit: false);
          });
        });
      },
    ));
    auto_quiz.add(ListTile(
      leading: Icon(Icons.image),
      title: Text("MCQ Image Question"),
      onTap: () {
        setState(() {
          SmartDialog.show(builder: (context) {
            return create_mcq_image(edit: false);
          });
        });
      },
    ));
    auto_quiz.add(ListTile(
      leading: Icon(CupertinoIcons.question_circle),
      title: Text("True or False Question"),
      onTap: () {
        setState(() {
          SmartDialog.show(builder: (context) {
            return create_trueorfalse(edit: false);
          });
        });
      },
    ));
    return Scaffold(
        backgroundColor: colors.backgroundcolor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  if (uniqe_list.isEmpty) ...{
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.2,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.add,
                                    size: 50.sp,
                                    color: colors.fontcolor,
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "there is no questions..\nplease add at lest one",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: colors.fontcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                    )
                  } else ...{
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: colors.primarycolor,
                              onPrimary: colors.secondarycolor,
                              shadowColor: colors.shadowcolor,
                              elevation: 5,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => home_screen()),
                              );
                            },
                            child: Text("Review"),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.05,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: colors.primarycolor,
                              onPrimary: colors.secondarycolor,
                              shadowColor: colors.shadowcolor,
                              elevation: 5,
                            ),
                            onPressed: () {
                              setState(() {
                                SmartDialog.show(builder: (context) {
                                  return testtt();
                                });
                              });
                              try {
                                // upload();
                                print("done");
                              } catch (e) {
                                print(e.toString());
                              }
                            },
                            child: Text("Publish"),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: uniqe_list.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              if (uniqe_list[index].type == 1) ...{
                                create_mcq_textt(
                                  q: uniqe_list[index].question,
                                  o1: uniqe_list[index].option1,
                                  o2: uniqe_list[index].option2,
                                  o3: uniqe_list[index].option3,
                                  o4: uniqe_list[index].option4,
                                  edit: true,
                                  index: index,
                                )
                              } else if (uniqe_list[index].type == 2) ...{
                                create_mcq_image(
                                  q: uniqe_list[index].question,
                                  o1: uniqe_list[index].option1,
                                  o2: uniqe_list[index].option2,
                                  o3: uniqe_list[index].option3,
                                  o4: uniqe_list[index].option4,
                                  img: uniqe_list[index].image,
                                  edit: true,
                                  index: index,
                                )
                              } else if (uniqe_list[index].type == 3) ...{
                                create_trueorfalse(
                                  q: uniqe_list[index].question,
                                  edit: true,
                                  index: index,
                                )
                              } else if (uniqe_list[index].type == 4) ...{
                                create_shortanswer(
                                  q: uniqe_list[index].question,
                                  edit: true,
                                  index: index,
                                )
                              } else if (uniqe_list[index].type == 5) ...{
                                create_longanswer(
                                  q: uniqe_list[index].question,
                                  edit: true,
                                  index: index,
                                )
                              }
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Center(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              height: MediaQuery.sizeOf(context).height * 0.05,
                              color: Colors.grey,
                              child: Center(
                                child: Text("Question ${index + 2}"),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  }
                ],
              ),
              if (auto == false) ...{
                SlidingUpPanelWidget(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: const Offset(0, 3),
                        )
                      ],
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 5,
                                offset: const Offset(0, 3),
                              )
                            ],
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_upward_outlined,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8.0,
                                ),
                              ),
                              Text(
                                'Add a new question',
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        Divider(
                          height: 0.5,
                          color: Colors.grey[300],
                        ),
                        Flexible(
                          child: Container(
                            child: ListView.separated(
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: questions[index].leading,
                                  title: questions[index].title,
                                  onTap: questions[index].onTap,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 0.5,
                                );
                              },
                              shrinkWrap: true,
                              itemCount: questions.length,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                  controlHeight: 50.0,
                  anchor: 0.4,
                  panelController: _controller,
                ),
              } else ...{
                SlidingUpPanelWidget(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: const Offset(0, 3),
                        )
                      ],
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 5,
                                offset: const Offset(0, 3),
                              )
                            ],
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_upward_outlined,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8.0,
                                ),
                              ),
                              Text(
                                'Add a new question',
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        Divider(
                          height: 0.5,
                          color: Colors.grey[300],
                        ),
                        Flexible(
                          child: Container(
                            child: ListView.separated(
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: auto_quiz[index].leading,
                                  title: auto_quiz[index].title,
                                  onTap: auto_quiz[index].onTap,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 0.5,
                                );
                              },
                              shrinkWrap: true,
                              itemCount: auto_quiz.length,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                  controlHeight: 50.0,
                  anchor: 0.4,
                  panelController: _controller,
                ),
              }
            ],
          ),
        )

        //  Container(

        //   height: MediaQuery.of(context).size.height,
        //   color: Colors.amber,
        //   child: mcq_text_widget(Q: mcq_text(question: "Q1. What is the capital of France?",
        //   option1: "Q2. What is the capital of France",
        //   option2: "Q3. What is the capital of France",
        //   option3: "Q4. What is the capital of France",
        //   option4: "Q5. What is the capital of France",

        //   ),
        //   ),
        // ),
        );
  }
}

class testtt extends StatefulWidget {
  const testtt({super.key});

  @override
  State<testtt> createState() => _testttState();
}

class _testttState extends State<testtt> {
  List<Map<String, dynamic>> documents = [];
  String quizname = "zezoo";
  bool quiztimer = false;
  int quizhour = 0;
  int quizminute = 0;
  bool questiontimer = false;
  int questionmin = 0;
  int questionsec = 0;

  get() async {
    print("start");
    await FirebaseFirestore.instance
        .collection("Quizzes")
        .doc("zF8wpAC9UQOic4x4uh42")
        .get()
        .then((value) {
      Map<String, dynamic> models = value.data()!;
      print(models);
      print(models['questions']);
      get_list = models['questions']
          .map((e) => uniqe_model.formJson(e))
          .toList()
          .cast<uniqe_model>();
      print(get_list[0].type);
    });

    // print("start1");

    // List<uniqe_model> getitem = await snapshot.docs
    //     .map((doc) => uniqe_model.formSnapshot(doc))
    //     .toList();
    // print("start2");
    // print(getitem);
  }

  upload() async {
    for (var item in uniqe_list) {
      documents.add({
        'type': item.type,
        'question': item.question,
        'option1': item.option1,
        'option2': item.option2,
        'option3': item.option3,
        'option4': item.option4,
        'image': item.image,
        'mcq_answer': item.mcq_answer,
        'trueorfalse_answer': item.trueorfalse_answer
      });
    }
    await FirebaseFirestore.instance.collection("Quizzes").doc(quizname).set(
      {
        'questions': documents,
        'type': auto ? 'solved' : 'not',
        'quiztimer': quiztimer,
        'questiontimer': questiontimer,
        'quizhour': quizhour,
        'quizminute': quizminute,
        'questionmin': questionmin,
        'questionsec': questionsec,
      },
    );
    print("done2");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.backgroundcolor,
        ),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
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
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      quizname = value;
                    });
                  },
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your quiz name',
                    labelStyle: TextStyle(
                      color: colors.fontcolor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment(0, -0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.06,
                  ),
                  Text(
                    "Quiz Time",
                    style: TextStyle(
                        color: colors.fontcolor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.02,
                  ),
                  Switch(
                    value: quiztimer,
                    onChanged: (value) {
                      setState(() {
                        quiztimer = value;
                      });
                    },
                    activeColor: colors.primarycolor,
                  ),
                  if (quiztimer == true) ...{
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.height * 0.05,
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
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              quizhour = int.parse(value);
                            });
                          },
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'hr',
                            labelStyle: TextStyle(
                              color: colors.fontcolor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: MediaQuery.of(context).size.height * 0.05,
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
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              quizminute = int.parse(value);
                            });
                          },
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'min',
                            labelStyle: TextStyle(
                              color: colors.fontcolor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  }
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment(0, -0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.06,
                  ),
                  Text(
                    "Question Time",
                    style: TextStyle(
                        color: colors.fontcolor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.0005,
                  ),
                  Switch(
                    value: questiontimer,
                    onChanged: (value) {
                      setState(() {
                        questiontimer = value;
                      });
                    },
                    activeColor: colors.primarycolor,
                  ),
                  if (questiontimer == true) ...{
                    Container(
                      width: MediaQuery.of(context).size.width * 0.11,
                      height: MediaQuery.of(context).size.height * 0.05,
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
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              questionmin = int.parse(value);
                            });
                          },
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'min',
                            labelStyle: TextStyle(
                              color: colors.fontcolor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.005,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: MediaQuery.of(context).size.height * 0.05,
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
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              questionsec = int.parse(value);
                            });
                          },
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'sec',
                            labelStyle: TextStyle(
                              color: colors.fontcolor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  }
                ],
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () async {
              
                  try {
                await    upload();
                  } catch (e) {
                    print(e);
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => welcome_screen()));
                
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.5,
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
                child: Center(
                  child: Text(
                    'Publish',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: colors.fontcolor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



     //   GestureDetector(
                  //     onTap: (){
                  //     setState(() {
                  //       quiztimer = !quiztimer;
                  //     });
                  //     },
                  //     child: Container(
                  //       width: MediaQuery.of(context).size.width * 0.025,
                  //       height: MediaQuery.of(context).size.height * 0.04,
                  //       decoration: BoxDecoration(
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: colors.shadowcolor,
                  //             blurRadius: 10,
                  //             spreadRadius: 5,
                  //             offset: Offset(0, 3),
                  //           )
                  //         ],
                          
                  //         color: quiztimer? colors.primarycolor:colors.backgroundcolor,
                  //         borderRadius: BorderRadius.circular(3),
                  //         border: Border.all(
                  //           color:colors.primarycolor,
                  //           width: 2,
                  //         ),
                  //       ),
                  //       child: Icon(Icons.done, color: quiztimer? colors.backgroundcolor:colors.primarycolor,),
                  //     ),
                  //   )
                  


bool auto = false;
