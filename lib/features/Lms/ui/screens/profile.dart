


  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';

import 'package:lms/features/Lms/ui/screens/home.dart';

class profile extends StatefulWidget {
    const profile({super.key});
  
    @override
    State<profile> createState() => _profileState();
  }
  
  class _profileState extends State<profile> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:Column(
          children: [
                ClipPath(
              clipper:
              ClipPathClass(), 
              child: Container(
                height: context.height(0.1),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [colors.color1, colors.color2],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child:
                  Center(
                    child: Text(
                      'Profile',
                      style: textstyle.maintitle.copyWith(fontSize: 18.sp, color: Colors.white),
                    ),
                  )
                  
                ),
              ),
            ), 
            context.height_box(0.03),
            Container(
              height: context.height(0.2),
              width: context.width(0.2),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colors.color1, colors.color2],
                ),
                shape: BoxShape.circle,
                // image: DecorationImage(
                //   image: AssetImage('assets/images/profile.jpg'),
                //   fit: BoxFit.cover,
                // ),
                
              ),
              child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
            ),
            context.height_box(0.01),
            Text(
              'Name',
              style: textstyle.title.copyWith(fontSize: 18.sp),
            ),
            context.height_box(0.01),
            Text(
              'Email',
              style: textstyle.subtitle.copyWith(fontWeight: FontWeight.w400, fontSize: 12.sp),
            ),
            context.height_box(0.04),
            // list tile of edit profile , logout , language , dark mode 
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: Colors.grey[200],
                title: Text('Edit Profile',style: textstyle.subtitle.copyWith(fontSize:15.sp, fontWeight: FontWeight.w400),),
                leading: CircleAvatar(
                  radius: 15.r,
                  child: Icon(Icons.edit)),
                onTap: (){},
              ),
            ),
            context.height_box(0.02),
           
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: ListTile(
                tileColor: Colors.grey[200],
shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text('Language',style: textstyle.subtitle.copyWith(fontSize:15.sp, fontWeight: FontWeight.w400),),
                leading: CircleAvatar(
                  radius: 15.r,
                  child: Icon(Icons.language)),
                onTap: (){},
              ),
            ),
            context.height_box(0.02),
            
            Padding(
          padding: const EdgeInsets.only(right: 30, left: 30),

              child: ListTile(
                tileColor: Colors.grey[200],
shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text('Dark Mode',style: textstyle.subtitle.copyWith(fontSize:15.sp, fontWeight: FontWeight.w400),),
                leading: CircleAvatar(
                  radius: 15.r,
                  child: Icon(Icons.dark_mode)),
                onTap: (){},
              ),
            ),
            context.height_box(0.02),

          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: ListTile(
              tileColor: Colors.grey[200],
shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text('Logout',style: textstyle.subtitle.copyWith(fontSize:15.sp, fontWeight: FontWeight.w400),),
                leading: CircleAvatar(
                  radius: 15.r,
                  child: Icon(Icons.logout)),
                onTap: (){},
              ),
          ),

           


          ]
        )
      );
    }
  }