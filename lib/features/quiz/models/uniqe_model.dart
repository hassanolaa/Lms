import 'package:cloud_firestore/cloud_firestore.dart';

class uniqe_model {
  int? type;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? image;
  String? mcq_answer;
  bool? trueorfalse_answer;

  uniqe_model(
      {this.type,
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.image,
      this.mcq_answer,
      this.trueorfalse_answer});


  factory uniqe_model.formJson(Map<String,dynamic> json  ) {
    return uniqe_model(
      type: json['type'],
      question: json['question'],
      option1: json['option1'],
      option2: json['option2'],
      option3: json['option3'],
      option4: json['option4'],
      image: json['image'],
      mcq_answer: json['mcq_answer'],
      trueorfalse_answer: json['trueorfalse_answer'],
    );
  }

  factory uniqe_model.formSnapshot(QueryDocumentSnapshot snapshot) {
    return uniqe_model(
      type: snapshot['type'],
      question: snapshot['question'],
      option1: snapshot['option1'],
      option2: snapshot['option2'],
      option3: snapshot['option3'],
      option4: snapshot['option4'],
      image: snapshot['image'],
      mcq_answer: snapshot['mcq_answer'],
      trueorfalse_answer: snapshot['trueorfalse_answer'],
    );
  }

}
