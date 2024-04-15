import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:lms/core/routing/router.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/link.dart';
import 'package:video_player/video_player.dart';

import '../widgets/webtemplete.dart';
import 'home.dart';

class lecture extends StatefulWidget {
  const lecture({super.key});

  @override
  State<lecture> createState() => _lectureState();
}

class _lectureState extends State<lecture> {
  Uri _url1 = Uri.parse(
      'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf');

  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  void initState() {
    // TODO: implement initState
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      //  autoPlay: true,
      allowFullScreen: true,
      autoInitialize: true,
      showControls: true,
      showOptions: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: ClipPath(
                        clipper: ClipPathClass(),
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
                            padding: const EdgeInsets.all(23.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: colors.color1,
                                  radius: 20,
                                  // add person icon
                                  child: Icon(
                                    Icons.arrow_back_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Lecture name',
                                  style: textstyle.title
                                      .copyWith(color: Colors.white),
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  // add person icon
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    context.height_box(0.01),
                    // lecture video
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: context.height(0.3),
                        width: context.width(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AspectRatio(
                          aspectRatio: 100 / 2,
                          child: Chewie(
                            controller: _chewieController,
                          ),
                        ),
                      ),
                    ),
                    context.height_box(0.03),
                    // row of three square boxes with icons and text
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: context.height(0.1),
                            width: context.width(0.2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colors.color3,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.book,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  'Notes',
                                  style: textstyle.title
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.navigateTo(router.ai);
                            },
                            child: Container(
                              height: context.height(0.1),
                              width: context.width(0.2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colors.color3,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.auto_fix_high_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    'Ai',
                                    style: textstyle.title
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Link(
                            uri: _url1,
                            target: LinkTarget.blank,
                            builder: (context, openLink) => GestureDetector(
                              onTap:
                                  //context.navigateTo(router.pdf);
                                  openLink,
                              child: Container(
                                height: context.height(0.1),
                                width: context.width(0.2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colors.color3,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.picture_as_pdf_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      'PDF',
                                      style: textstyle.title
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    context.height_box(0.02),
                    // lecture description
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: context.height(0.2),
                        width: context.width(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
//color: colors.color3,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Lecture Description :',
                                    style: textstyle.title
                                        .copyWith(color: colors.textcolor),
                                  ),
                                ],
                              ),
                              context.height_box(0.02),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Text(
                                    'This is a description of the lecture that is being given. It is a very long description that will be displayed in the box above. This is a description of the lecture that is being given. It is a very long description that will be displayed in the box above.',
                                    style: textstyle.subtitle
                                        .copyWith(color: colors.textcolor),
                                    // overflow: TextOverflow.clip,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    context.height_box(0.015),
                    // button to go to quiz ,button to go to see more
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Go to Quiz',
                              style:
                                  textstyle.title.copyWith(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: colors.color3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'See More',
                              style:
                                  textstyle.title.copyWith(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: colors.color3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : webtemplete(widegt:SingleChildScrollView(
          child: Column(
            children: [
                   context.height_box(0.03),
            // Courses text   
            Container(
              height: context.height(0.1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: colors.background
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'lecture name',
                      style: textstyle.title.copyWith(
                        fontSize: context.fontSize(20),
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
              context.height_box(0.03),
             // screen container
           Container(
            decoration: BoxDecoration(
              color: colors.background,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
           context.height_box(0.03),
               // lecture video
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: context.height(0.35),
                        width: context.width(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AspectRatio(
                          aspectRatio: 100 / 2,
                          child: Chewie(
                            controller: _chewieController,
                          ),
                        ),
                      ),
                    ),
                    context.height_box(0.03),
                    // row of three square boxes with icons and text
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: context.height(0.1),
                            width: context.width(0.06),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colors.color3,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.book,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  'Notes',
                                  style: textstyle.title
                                      .copyWith(color: Colors.white,fontSize: context.fontSize(15)),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.navigateTo(router.ai);
                            },
                            child: Container(
                              height: context.height(0.1),
                              width: context.width(0.06),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colors.color3,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.auto_fix_high_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    'Ai',
                                    style: textstyle.title
                                        .copyWith(color: Colors.white,fontSize: context.fontSize(20)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Link(
                            uri: _url1,
                            target: LinkTarget.blank,
                            builder: (context, openLink) => GestureDetector(
                              onTap:
                                  //context.navigateTo(router.pdf);
                                  openLink,
                              child: Container(
                                height: context.height(0.1),
                                width: context.width(0.06),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colors.color3,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.picture_as_pdf_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      'PDF',
                                      style: textstyle.title
                                          .copyWith(color: Colors.white,fontSize: context.fontSize(20)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    context.height_box(0.02),
                    // lecture description
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: context.height(0.2),
                        width: context.width(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
//color: colors.color3,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Lecture Description :',
                                    style: textstyle.title
                                        .copyWith(color: colors.textcolor,fontSize: context.fontSize(20)),
                                  ),
                                ],
                              ),
                              context.height_box(0.02),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Text(
                                    'This is a description of the lecture that is being given. It is a very long description that will be displayed in the box above. This is a description of the lecture that is being given. It is a very long description that will be displayed in the box above.',
                                    style: textstyle.subtitle
                                        .copyWith(color: colors.textcolor,fontSize: context.fontSize(15),fontWeight: FontWeight.normal),
                                    // overflow: TextOverflow.clip,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    context.height_box(0.015),
                    // button to go to quiz ,button to go to see more
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Go to Quiz',
                              style:
                                  textstyle.title.copyWith(color: Colors.white,fontSize: context.fontSize(20)),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: colors.color3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'See More',
                              style:
                                  textstyle.title.copyWith(color: Colors.white,fontSize: context.fontSize(20)),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: colors.color3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
               
            context.height_box(0.03),
            context.height_box(0.03),



              ],
            ),
           )
      
         
            ],
          ),
        ));
  }
}
