
class Lecture{

 // name , course, description, pdf , video, more,quiz,image
  String? name;
  String? coursename;
  String? description;
  String? pdf;
  String? video;
  String? more;
  String? quiz;
  String? image;

  Lecture({this.name, this.coursename, this.description, this.pdf, this.video, this.more, this.quiz, this.image});

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      name: json['name'],
     coursename: json['course'],
      description: json['description'],
      pdf: json['pdf'],
      video: json['video'],
      more: json['more'],
      quiz: json['quiz'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'course': coursename,
    'description': description,
    'pdf': pdf,
    'video': video,
    'more': more,
    'quiz': quiz,
    'image': image,
  };
 





}