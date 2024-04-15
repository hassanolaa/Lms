import 'package:lms/features/chat/repository/massage_repository.dart';
import 'package:lms/features/chat/repository/user_repository/user_repository_firebase.dart';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:lms/features/chat/repository/massage_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/features/chat/view/presentation/widgets/send_options.dart';
import 'package:microphone/microphone.dart';

import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:uuid/uuid.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../const/const.dart';
import 'edit_profile.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class massages_sender extends StatefulWidget {
  massages_sender({super.key, required this.chatid});
  String chatid;

  @override
  State<massages_sender> createState() => _massages_senderState();
}

class _massages_senderState extends State<massages_sender> {
  TextEditingController massageController = TextEditingController();
  final record = AudioRecorder();
  MicrophoneRecorder? _recorder;
  bool isRecording = false;
  String path = "";
  String url = "";
  
  start_record() async {
    print("hiiii00000");
    final location = await getApplicationDocumentsDirectory();
    print("hiiii");
    if (await record.hasPermission()) {
      print("hiiii222");
      await record.start(RecordConfig(),
          path: location.path + Uuid().v4() + 'm4a');
      setState(() {
        isRecording = true;
      });
    }
  }

  stop_record() async {
    String? finalpath = await record.stop();
    setState(() {
      path = finalpath!;
      isRecording = false;
    });
    massage_repository.uploadrecord(widget.chatid, path, 1);
  }

  start_record_web() async {
    print("hiiii00000");
    //final location = await getApplicationDocumentsDirectory();
    print("hiiii");
//     if (await record.hasPermission()) {
//   // Start recording to file
//     print("hiiii222232");
// var encoder = AudioEncoder.aacHe;

//   await record.start(const RecordConfig(), path: encoder == AudioEncoder.opus ? 'test.opus' : 'test.m4a');
//     setState(() {
//         isRecording = true;
//       });
//   // ... or to stream
//  // final stream = await record.startStream(const RecordConfig(AudioEncoder.pcm16bits));
// }

   
    print("hiiii232");
    _recorder!.start();
    print("hiiii222232dsdasfas");
    setState(() {
      print("hiiii222232");
      isRecording = true;
    });
  }

  stop_record_web() async {
    //  String? finalpath = await record.stop();
    await _recorder!.stop();
   // final recordingUrl = _recorder!.value.recording!.url;
    // Process recorded audio here (e.g., convert to bytes)
     final recordedBytes = await _recorder!.toBytes();
    setState(() {
      //  path = finalpath!;
      isRecording = false;
    });
  //  print("Recording URL: $recordingUrl");
    if(kIsWeb){
    massage_repository.uploadrecord(widget.chatid, "", 0,file:recordedBytes );

    }
  }

  
  void initState() {
    super.initState();
    _recorder = MicrophoneRecorder()..init()..addListener(() { setState(() {}); });
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? Container(
            height: MediaQuery.sizeOf(context).height * 0.08,
            margin: EdgeInsets.only(left: 40, right: 20, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color1, color2],
              ),
              // image: DecorationImage(
              //   image: AssetImage('assets/back.gif'),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Row(
              children: [
                // additional icon
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: GestureDetector(
                    onTap: () {
                      print('add icon');
                      WoltModalSheet.show<void>(
                        // pageIndexNotifier: pageIndexNotifier,
                        context: context,
                        pageListBuilder: (modalSheetContext) {
                          return [
                            WoltModalSheetPage(
                              backgroundColor: backbackground,
                              child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.35,
                                  child: send_options(
                                    chatid: widget.chatid,
                                  )),
                            ),
                          ];
                        },
                      );
                    },
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: backbackground,
                      child: Icon(
                        Icons.add,
                        size: 22.sp,
                        color: textcolor,
                      ),
                    ),
                  ),
                ),
                // send massage
                isRecording == false
                    ? Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Container(
                          width: 165.w,
                          child: TextFormField(
                            controller: massageController,
                            decoration: InputDecoration(
                              hintText: 'Type a message',
                              hintStyle: TextStyle(
                                color: textcolor,
                                fontSize: 15.sp,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Text("Recording..."),
                          SizedBox(
                            width: 100.w,
                          )
                        ],
                      ),
                // send icon
                isRecording == false
                    ? Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: GestureDetector(
                          onTap: () {
                            // send massage
                            massage_repository.sendMessage(
                                widget.chatid, massageController.text, 0);
                            massageController.clear();
                          },
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.send,
                              size: 15.sp,
                              color: textcolor,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                // emoji icon
                isRecording == false
                    ? Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: GestureDetector(
                          onTap: () {
                            ElegantNotification.info(
                              title: Text("Sorry"),
                              description: Text("This feature coming soon !"),
                            ).show(context);
                          },
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.emoji_emotions,
                              size: 15.sp,
                              color: textcolor,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),

                // send voice icon
                isRecording == false
                    ? Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              start_record_web();
                            });
                          },
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.mic,
                              size: 15.sp,
                              color: textcolor,
                            ),
                          ),
                        ),
                      )
                    :
                    // stop icon
                    Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              stop_record_web();
                            });
                          },
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.stop,
                              size: 15.sp,
                              color: textcolor,
                            ),
                          ),
                        ),
                      )
              ],
            ),
          )
        : Container(
            height: MediaQuery.sizeOf(context).height * 0.08,
            margin: EdgeInsets.only(left: 40, right: 20, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color1, color2],
              ),
              // image: DecorationImage(
              //   image: AssetImage('assets/back.gif'),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Row(
              children: [
                // additional icon
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: GestureDetector(
                    onTap: () {
                      print('add icon');
                      WoltModalSheet.show<void>(
                        // pageIndexNotifier: pageIndexNotifier,
                        context: context,
                        pageListBuilder: (modalSheetContext) {
                          return [
                            WoltModalSheetPage(
                              backgroundColor: backbackground,
                              child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.35,
                                  child: send_options(
                                    chatid: widget.chatid,
                                  )),
                            ),
                          ];
                        },
                      );
                    },
                    child: CircleAvatar(
                      radius: ResponsiveValue(context, conditionalValues: [
                        Condition.equals(name: MOBILE, value: 10.0),
                        Condition.equals(name: TABLET, value: 10.0),
                        Condition.equals(name: DESKTOP, value: 20.0),
                        Condition.equals(name: '4K', value: 25.0)
                      ]).value,
                      backgroundColor: backbackground,
                      child: Icon(
                        Icons.add,
                        size: context.smallfontsize,
                        color: textcolor,
                      ),
                    ),
                  ),
                ),
                // send massage
                isRecording == false
                    ? Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Container(
                          width: context.width(0.4),
                          child: TextFormField(
                            controller: massageController,
                            decoration: InputDecoration(
                              hintText: 'Type a message',
                              hintStyle: TextStyle(
                                color: textcolor,
                                fontSize: context.smallfontsize,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Text(
                            "Recording...",
                            style: TextStyle(
                              color: textcolor,
                              fontSize: context.smallfontsize,
                            ),
                          ),
                          SizedBox(
                            width: context.width(0.3),
                          )
                        ],
                      ),
                // send icon
                isRecording == false
                    ? Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: GestureDetector(
                          onTap: () {
                            // send massage
                            massage_repository.sendMessage(
                                widget.chatid, massageController.text, 0);
                            massageController.clear();
                          },
                          child: CircleAvatar(
                            radius:
                                ResponsiveValue(context, conditionalValues: [
                              Condition.equals(name: MOBILE, value: 10.0),
                              Condition.equals(name: TABLET, value: 10.0),
                              Condition.equals(name: DESKTOP, value: 20.0),
                              Condition.equals(name: '4K', value: 25.0)
                            ]).value,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.send,
                              size: context.smallfontsize,
                              color: textcolor,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                // emoji icon
                isRecording == false
                    ? Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: GestureDetector(
                          onTap: () {
                            ElegantNotification.info(
                              title: Text("Sorry"),
                              description: Text("This feature coming soon !"),
                            ).show(context);
                          },
                          child: CircleAvatar(
                            radius:
                                ResponsiveValue(context, conditionalValues: [
                              Condition.equals(name: MOBILE, value: 10.0),
                              Condition.equals(name: TABLET, value: 10.0),
                              Condition.equals(name: DESKTOP, value: 20.0),
                              Condition.equals(name: '4K', value: 25.0)
                            ]).value,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.emoji_emotions,
                              size: context.smallfontsize,
                              color: textcolor,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),

                // send voice icon
                isRecording == false
                    ? Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // isRecording = true;
                              //start_record();
                              start_record_web();
                            });
                          },
                          child: CircleAvatar(
                            radius:
                                ResponsiveValue(context, conditionalValues: [
                              Condition.equals(name: MOBILE, value: 10.0),
                              Condition.equals(name: TABLET, value: 10.0),
                              Condition.equals(name: DESKTOP, value: 20.0),
                              Condition.equals(name: '4K', value: 25.0)
                            ]).value,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.mic,
                              size: context.smallfontsize,
                              color: textcolor,
                            ),
                          ),
                        ),
                      )
                    :
                    // stop icon
                    Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: GestureDetector(
                          onTap: () {
                            // stop_record();
                            setState(() {
                              stop_record_web();
                            });
                          },
                          child: CircleAvatar(
                            radius:
                                ResponsiveValue(context, conditionalValues: [
                              Condition.equals(name: MOBILE, value: 10.0),
                              Condition.equals(name: TABLET, value: 10.0),
                              Condition.equals(name: DESKTOP, value: 20.0),
                              Condition.equals(name: '4K', value: 25.0)
                            ]).value,
                            backgroundColor: backbackground,
                            child: Icon(
                              Icons.stop,
                              size: context.smallfontsize,
                              color: textcolor,
                            ),
                          ),
                        ),
                      )
              ],
            ),
          );
  }
}
