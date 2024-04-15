import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lms/features/chat/repository/user_repository/user_repository_firebase.dart';



class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        duration: Duration(seconds: 4),
        //backgroundColor: Appcolors.primaryColor,
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget: SizedBox(
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          child: Image.network("https://i.imgur.com/AWfArZf.gif"),
        ),
        onAnimationEnd: () => debugPrint("On Fade In End"),
       // nextScreen:SplashScreen() ,
        //nextScreen: user_repository.getCurrentUser() != null ? navi() : signUp() ,
      ),
    );
  }
}
