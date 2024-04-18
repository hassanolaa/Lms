import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lms/features/quiz/colors.dart';
import 'package:lms/features/quiz/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
          backgroundColor: colors.backgroundcolor,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: SizedBox(
            height:MediaQuery.sizeOf(context).height*0.5,
            width: MediaQuery.sizeOf(context).width*0.5,
            child: Image.network("https://i.imgur.com/864Ivj8.png"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: welcome_screen()
        ),
    );
  }
}