import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/routing/router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:lms/features/chat/repository/user_repository/user_repository_firebase.dart';

import '../../../const/const.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: backbackground,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(background_image),
                  fit: BoxFit.cover,
                  // opacity: 0.5,
                ),
              ),
              child: Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.76,
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: textcolor),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: TextField(
                          style: TextStyle(color: textcolor),
                          key: _formKey,
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(color: textcolor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: textcolor, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: TextField(
                          style: TextStyle(color: textcolor),
                          key: _formKey,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Password",
                            hintStyle: TextStyle(color: textcolor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: textcolor, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),

                      SizedBox(
                        height: 5.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                            user_repository.signUp(
                              emailController.text, passwordController.text);
                          //user_repository.signUp("hassan000@nnn.com", "123456");
                        
                          if (user_repository.getCurrentUser() != null) {
                            //     GoRouter.of(context).go("/user-info");
                            print("user is created");
                          //  context.navigateTo(router.massages);
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: background, fontSize: 20.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: color3,
                          padding: EdgeInsets.symmetric(
                              horizontal: 100.w, vertical: 10.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "----Or----",
                        style: TextStyle(fontSize: 20.sp, color: textcolor),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      // google
                      ElevatedButton.icon(
                        onPressed: () async {
                          //todo: this is google sign in
                          await user_repository.signInWithGoogle();
                          if (user_repository.getCurrentUser() != null) {
//GoRouter.of(context).go("/navi");
                          }
                        },
                        icon: Icon(Icons.g_mobiledata,
                            size: 40.sp, color: background),
                        label: Text(
                          "Sign Up with Google",
                          style: TextStyle(color: background, fontSize: 15.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: color4,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.w, vertical: 10.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 15.sp, color: textcolor),
                          ),
                          TextButton(
                            onPressed: () {
                              //   GoRouter.of(context).go("/signin");
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(fontSize: 15.sp, color: color3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ).animate(effects: [FadeEffect(duration: Duration(seconds: 1))]),
            ),
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: backbackground,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(background_image),
                  fit: BoxFit.cover,
                  // opacity: 0.5,
                ),
              ),
              child: Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.86,
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: context.height(0.05)),
                      Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: context.bigfontsize,
                            fontWeight: FontWeight.bold,
                            color: textcolor),
                      ),
                      SizedBox(
                        height: context.height(0.05),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: TextField(
                          style: TextStyle(color: textcolor),
                          key: _formKey,
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(color: textcolor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: textcolor, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.height(0.05),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Password",
                            hintStyle: TextStyle(color: textcolor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: textcolor, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.height(0.008),
                      ),

                      SizedBox(
                        height: context.height(0.008),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          user_repository.signUp(
                              emailController.text, passwordController.text);
                          // user_repository.signUp("hassan1234@nnn.com", "123456");

                          if (user_repository.getCurrentUser() != null) {
                            //    GoRouter.of(context).go("/user-info");
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: background,
                              fontSize: context.mediumfontsize),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: color3,
                          padding: EdgeInsets.symmetric(
                              horizontal: context.width(0.3),
                              vertical: context.height(0.03)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "----Or----",
                        style: TextStyle(
                            fontSize: context.smallfontsize, color: textcolor),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      // google
                      ElevatedButton.icon(
                        onPressed: () async {
                          //todo: this is google sign in
                          await user_repository.signInWithGoogle();
                          if (user_repository.getCurrentUser() != null) {
                            //  GoRouter.of(context).go("/navi");
                          }
                        },
                        icon: Icon(Icons.g_mobiledata,
                            size: context.bigfontsize, color: background),
                        label: Text(
                          "Sign Up with Google",
                          style: TextStyle(
                              color: background,
                              fontSize: context.mediumfontsize),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: color4,
                          fixedSize:
                              Size(context.width(0.68), context.height(0.1)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.height(0.02),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                fontSize: context.smallfontsize,
                                color: textcolor),
                          ),
                          TextButton(
                            onPressed: () {
//GoRouter.of(context).go("/signin");
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: context.mediumfontsize,
                                  color: color3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ).animate(effects: [FadeEffect(duration: Duration(seconds: 1))]),
            ),
          );
  }
}
