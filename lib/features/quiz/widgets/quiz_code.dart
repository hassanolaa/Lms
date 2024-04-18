import 'package:flutter/material.dart';
import 'package:lms/features/quiz/colors.dart';


import '../screens/quiz_screen.dart';

class quiz_codee extends StatefulWidget {
  const quiz_codee({super.key});
  

  @override
  State<quiz_codee> createState() => _quiz_codeState();
}

class _quiz_codeState extends State<quiz_codee> {
  String code = "";
  
  @override
  Widget build(BuildContext context) {
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
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                print("hasssan");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => quiz_screen(
                          name: "hassan",
                              quiz_code: code,
                            )));
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
}
