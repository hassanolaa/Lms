import 'dart:io';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:siri_wave/siri_wave.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ai_converstion extends StatefulWidget {
  const ai_converstion({super.key});

  @override
  State<ai_converstion> createState() => _ai_converstionState();
}

class _ai_converstionState extends State<ai_converstion> {
  final Gemini gemini = Gemini.instance;
  bool showResponse = false;
  String responseText = "";
  bool recording = false;

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
  String question = "";
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
               responseText = message.text;
            print(responseText);
            showResponse = true;

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
              responseText = message.text;
            print(responseText);
            showResponse = true;
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
             speak(message.text);
            responseText = message.text;
            print(responseText);
            showResponse = true;

            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = SiriWaveController(
      speed: 0.05,
    );
    return Scaffold(
        backgroundColor: Colors.black,
        body: Row(
          children: [
            context.width_box(0.2),
            Column(
              children: [
                context.height_box(0.1),
                SiriWave(
                  controller: controller,
                  style: SiriWaveStyle.ios_9,
                  options: SiriWaveOptions(
                    height: context.height(0.3),
                    width: context.width(0.6),
                  ),
                ),
                context.height_box(0.1),
                Container(
                  width: context.width(0.5),
                  child: Text(
                    showResponse ? responseText :
                    _speechToText.isListening
                        ? _lastWords
                        : " Ask me anything...",
                    style: textstyle.subtitle.copyWith(
                      color:showResponse ? Colors.grey[500]:Colors.white,
                      fontSize: context.mediumfontsize,
                    ),
                  ),
                ),
                context.height_box(0.2),
                // circle avatar with mic icon
                GestureDetector(
                  onTap: () {
                    if (_speechToText.isListening) {
                      _stopListening();
                      recording = false;
                    } else {
                      _startListening();
                      showResponse = false;
                      recording = true;
                    }
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor:recording? Colors.white:colors.color3,
                    child:recording?
                    Icon(
                      Icons.stop,
                      color: Colors.black,
                    )
                    : Icon(
                      Icons.mic,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
