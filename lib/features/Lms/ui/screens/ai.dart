import 'dart:io';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/core/routing/router.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'home.dart';

class ai_model extends StatefulWidget {
  const ai_model({super.key});

  @override
  State<ai_model> createState() => _ai_modelState();
}

class _ai_modelState extends State<ai_model> {
  final Gemini gemini = Gemini.instance;

  List<Uint8List> fileBytes2 = [];

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
        "https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png",
  );

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  String question="";
  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    _sendMessageVoice(ChatMessage(
      user: currentUser,
      createdAt: DateTime.now(),
      text: _lastWords,
    ));
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
    await flutterTts.setPitch(1.5);
    await flutterTts.speak(text);
  

  }

  Widget _buildUI() {
    return DashChat(
      messageOptions: MessageOptions(
        onPressMessage: (p0) {
          print(p0.text);
          speak(p0.text);
        },
        onLongPressMessage: (p0) {
          print(p0.text);
        },
      ),
      inputOptions: InputOptions(
          inputDecoration: InputDecoration(
            hintText:
                _speechToText.isListening ? _lastWords : " Ask me anything...",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          trailing: [
            IconButton(
              onPressed: _sendMediaMessageWeb,
              icon: Icon(
                Icons.image,
                color: colors.color3,
              ),
            ),
            IconButton(
              onPressed: _speechToText.isNotListening
                  ? _startListening
                  : _stopListening,
              icon: Icon(
                Icons.mic,
                color: colors.color3,
              ),
            )
          ]),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
            },
          );
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            speak(message.text);

            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _sendMessageVoice(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = _lastWords;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
            },
          );
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";

          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );

          setState(() {
            speak(message.text);
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _sendMessageWeb(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      print("sdasda3333");

      if (chatMessage.medias?.isNotEmpty ?? false) {
        print("sdasda666");

        //  images = [
        //   File(chatMessage.medias!.first.url).readAsBytesSync(),
        // ];
        print("sdasda777");
        print(fileBytes2.length);
      }
      gemini
          .streamGenerateContent(
        question,
        images: fileBytes2!,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
            },
          );
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            speak(message.text);

            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      _sendMessage(chatMessage);
    }
  }

  void _sendMediaMessageWeb() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'gif'],
    );
    // ImagePicker picker = ImagePicker();
    // XFile? file = await picker.pickImage(
    //   source: ImageSource.gallery,
    // );
    if (filePickerResult != null) {
      print("sdasda");
      Uint8List? fileBytes = await filePickerResult.files.first.bytes;
      setState(() {
        fileBytes2.add(fileBytes!);
        print(fileBytes2.length);
      });
      print("sdasda3333");

      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
            url: fileBytes.toString(),
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      print("sdasda444");

      _sendMessageWeb(chatMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ResponsiveBreakpoints.of(context).isMobile
          ? Container(
              height: MediaQuery.sizeOf(context).height * 0.08,
              margin: EdgeInsets.only(left: 40, right: 20, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colors.color1, colors.color2],
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
                        context.navigateTo(router.ai_convertion);
                      },
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: colors.backbackground,
                        child: Icon(
                          Icons.spatial_tracking_outlined,
                          size: 22.sp,
                          color: colors.textcolor,
                        ),
                      ),
                    ),
                  ),
                  // send massage

                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Container(
                      width: 165.w,
                      child: TextFormField(
                        onChanged: (value) {
                          question = value;
                        },
                        //    controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: _speechToText.isListening
                              ? _lastWords
                              : " Ask me anything...",
                          hintStyle: TextStyle(
                            color: colors.textcolor,
                            fontSize: 10.sp,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  // send icon

                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: GestureDetector(
                      onTap: () {
                        // send massage
                        _sendMessage(ChatMessage(
                          user: currentUser,
                          createdAt: DateTime.now(),
                          text: question,
                        ));
                      },
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundColor: colors.backbackground,
                        child: Icon(
                          Icons.send,
                          size: 15.sp,
                          color: colors.textcolor,
                        ),
                      ),
                    ),
                  ),

                  // send voice icon

                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: GestureDetector(
                      onTap: 
                      _speechToText.isNotListening
                  ? _startListening
                  : _stopListening,
                      
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundColor: colors.backbackground,
                        child: Icon(
                          Icons.mic,
                          size: 15.sp,
                          color: colors.textcolor,
                        ),
                      ),
                    ),
                  )
                // send image icon

                  ,Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: GestureDetector(
                      onTap: 
                      _sendMediaMessageWeb,
                      
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundColor: colors.backbackground,
                        child: Icon(
                          Icons.image,
                          size: 15.sp,
                          color: colors.textcolor,
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
                  colors: [colors.color1, colors.color2],
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
                        context.navigateTo(router.ai_convertion);

                      },
                      child: CircleAvatar(
                        radius: ResponsiveValue(context, conditionalValues: [
                          Condition.equals(name: MOBILE, value: 10.0),
                          Condition.equals(name: TABLET, value: 10.0),
                          Condition.equals(name: DESKTOP, value: 20.0),
                          Condition.equals(name: '4K', value: 25.0)
                        ]).value,
                        backgroundColor: colors.backbackground,
                        child: Icon(
                          Icons.add,
                          size: context.smallfontsize,
                          color: colors.textcolor,
                        ),
                      ),
                    ),
                  ),
                  // send massage

                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Container(
                      width: context.width(0.7),
                      child: TextFormField(
                        //  controller: massageController,
                        decoration: InputDecoration(
                          hintText: _speechToText.isListening
                              ? _lastWords
                              : " Ask me anything...",
                          hintStyle: TextStyle(
                            color: colors.textcolor,
                            fontSize: context.smallfontsize,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  // send icon

                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: GestureDetector(
                      onTap: () {
                        // send massage
                         _sendMessage(ChatMessage(
                          user: currentUser,
                          createdAt: DateTime.now(),
                          text: question,
                        ));
                      },
                      child: CircleAvatar(
                        radius: ResponsiveValue(context, conditionalValues: [
                          Condition.equals(name: MOBILE, value: 10.0),
                          Condition.equals(name: TABLET, value: 10.0),
                          Condition.equals(name: DESKTOP, value: 20.0),
                          Condition.equals(name: '4K', value: 25.0)
                        ]).value,
                        backgroundColor: colors.backbackground,
                        child: Icon(
                          Icons.send,
                          size: context.smallfontsize,
                          color: colors.textcolor,
                        ),
                      ),
                    ),
                  ),

                  // send voice icon

                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: GestureDetector(
                      onTap:   _speechToText.isNotListening
                  ? _startListening
                  : _stopListening,
                      child: CircleAvatar(
                        radius: ResponsiveValue(context, conditionalValues: [
                          Condition.equals(name: MOBILE, value: 10.0),
                          Condition.equals(name: TABLET, value: 10.0),
                          Condition.equals(name: DESKTOP, value: 20.0),
                          Condition.equals(name: '4K', value: 25.0)
                        ]).value,
                        backgroundColor: colors.backbackground,
                        child: Icon(
                          Icons.mic,
                          size: context.smallfontsize,
                          color: colors.textcolor,
                        ),
                      ),
                    ),
                  )
                  // send image icon

                   ,Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: GestureDetector(
                      onTap:  _sendMediaMessageWeb,
                      child: CircleAvatar(
                        radius: ResponsiveValue(context, conditionalValues: [
                          Condition.equals(name: MOBILE, value: 10.0),
                          Condition.equals(name: TABLET, value: 10.0),
                          Condition.equals(name: DESKTOP, value: 20.0),
                          Condition.equals(name: '4K', value: 25.0)
                        ]).value,
                        backgroundColor: colors.backbackground,
                        child: Icon(
                          Icons.image,
                          size: context.smallfontsize,
                          color: colors.textcolor,
                        ),
                      ),
                    ),
                  )
                 
                
                ],
              ),
            ),
      
      body:
          //_buildUI(),
          SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
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
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: CircleAvatar(
                      backgroundColor: colors.color1,
                      radius: 20,
                      // add person icon
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'Course details',
                    style: textstyle.title.copyWith(color: Colors.white),
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
      
            Container(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return messages[index].user.firstName=="Gemini"? 
                  Padding(
                    padding:  EdgeInsets.only(left: 10.w,right: 100.w,top: 10.h,bottom: 10.h),
                    child: massage(messages[index]),
                  )
                  :Padding(
                    padding:  EdgeInsets.only(left: 100.w,right: 10.w,top: 10.h,bottom: 10.h),
                    child: massage(messages[index]),
                  )
                  ;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


Widget massage(ChatMessage message){
  return ListTile(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    tileColor: Colors.grey[200],
    contentPadding: EdgeInsets.all(10),
    title: Text(message.user.firstName!),
    subtitle: Text(message.text),
  );
}
