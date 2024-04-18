

import 'package:flutter/material.dart';

class indicator extends StatefulWidget {
  const indicator({super.key});

  @override
  State<indicator> createState() => _indicatorState();
}

class _indicatorState extends State<indicator> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}






Widget TaskProsses(int index, int done, int all) {
  Color doneColor = Colors.black;
  int index1=index+1;
  if (index == done) {
    doneColor = Colors.white;
  }
  return Row(
    children: [
      if (index == 0) ...{
        SizedBox(
          width: 7,
        ),
      },
      CircleAvatar(
        child: CircleAvatar(
          radius: 10,
          child: Text(
            '$index1',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 12.5,
                color: doneColor),
          ),
        ),
        radius: 12,
        backgroundColor: doneColor,
      ),
      if (index != all - 1) ...{
        Container(
          width: 10,
          height: 5,
          color: doneColor,
        )
      },
      if (index == all - 1) ...{
        SizedBox(
          width: 7,
        ),
      }
    ],
  );
}


Widget TaskProsses2(int index, int done, int all) {
  Color doneColor = Colors.black;
  int index1=index+1;
  if (index == done) {
    doneColor = Colors.white;
  }
  return Row(
    children: [
     for(int indicator = 0; indicator < all; indicator++)...{
        if (index == 0) ...{
        SizedBox(
          width: 7,
        ),
      },
      CircleAvatar(
        child: CircleAvatar(
          radius: 10,
          child: Text(
            '$index1',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 12.5,
                color: doneColor),
          ),
        ),
        radius: 12,
        backgroundColor: doneColor,
      ),
      if (index != all - 1) ...{
        Container(
          width: 10,
          height: 5,
          color: doneColor,
        )
      },
      if (index == all - 1) ...{
        SizedBox(
          width: 7,
        ),
      }
     }
    ],
  );
}

