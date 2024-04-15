

import 'package:flutter/material.dart';
import 'package:lms/features/Lms/ui/screens/ai_home.dart';
import 'package:lms/features/Lms/ui/screens/signIn.dart';
import 'package:lms/features/Lms/ui/widgets/ai_converstion.dart';
import 'package:lms/features/Lms/ui/widgets/pdf.dart';

import '../../features/Lms/ui/screens/ai.dart';
import '../../features/Lms/ui/screens/course.dart';
import '../../features/Lms/ui/screens/courses.dart';
import '../../features/Lms/ui/screens/lecture.dart';
import '../../features/Lms/ui/screens/signup.dart';
import '../../features/Lms/ui/screens/test.dart';
import '../../features/Lms/ui/widgets/navi.dart';
import '../../features/Lms/ui/widgets/tool.dart';
import '../../features/chat/view/presentation/screens/massages.dart';

extension Router on BuildContext {
  void navigateTo(String routeName, {Map<String, dynamic>? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}

// AppRouter class
class AppRouter {
 Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      
      case router.register:
        return MaterialPageRoute(builder: (_) => signUp());
      case router.login:
        return MaterialPageRoute(builder: (_) => signIn());
      case router.home:
        return MaterialPageRoute(builder: (_) => navi());
      case router.profile:
      //  return MaterialPageRoute(builder: (_) => profileScreen()); 
      case router.products:
       // return MaterialPageRoute(builder: (_) => productsScreen(id: id,));  
      case router.courses:
        return MaterialPageRoute(builder: (_) => courses());
      case router.course:
        return MaterialPageRoute(builder: (_) => course());
      case router.lecture:
        return MaterialPageRoute(builder: (_) => lecture()); 
     // case router.pdf:
     //   return MaterialPageRoute(builder: (_) => pdf_view()); 
      case router.ai:
        return MaterialPageRoute(builder: (_) => ai_model()); 
      case router.test:
        return MaterialPageRoute(builder: (_) => test());
      case router.ai_convertion:
        return MaterialPageRoute(builder: (_) => ai_converstion());
       case router.tools:
        return MaterialPageRoute(builder: (_) => tool(url:url ,));
       case router.signin2:
       // return MaterialPageRoute(builder: (_) => SignIn());
        case router.massages:
        return MaterialPageRoute(builder: (_) => massages());
         
        
              

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}






// router class
class router {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String about = '/about';
  static const String products = '/products';
  static const String courses = '/courses';
  static const String course = '/course';
  static const String lecture = '/lecture';
  static const String pdf = '/pdf';
  static const String ai = '/ai';
  static const String test = '/test';
  static const String ai_convertion = '/ai_convertion';
  static const String tools = '/tools';
  static const String signin2 = '/signin2';



  static const String massages= '/massages';



}

String url="";

