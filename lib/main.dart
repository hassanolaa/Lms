import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/routing/router.dart';
import 'firebase_options.dart';

// AIzaSyBdLTlDPzseibSNQqdn6Eiikhi37eZW0Oc
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(
    apiKey: "AIzaSyBdLTlDPzseibSNQqdn6Eiikhi37eZW0Oc",
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
      //  DevicePreview(
      //  enabled: !kReleaseMode,
      //   builder: (context) =>
      MyApp()
      // )
      );
}

//flutter run --web-renderer html

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Lms',
        useInheritedMediaQuery: true,
        //  locale: DevicePreview.locale(context),
        //  builder: DevicePreview.appBuilder,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 500, name: MOBILE),
            const Breakpoint(start: 501, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: child!,
        ),
        initialRoute: router.home,
        onGenerateRoute: AppRouter().generateRoute,
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
