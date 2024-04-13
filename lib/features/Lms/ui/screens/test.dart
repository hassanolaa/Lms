
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:webviewx/webviewx.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
 SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
    if(textEditingController.text.isNotEmpty){
      speak(textEditingController.text);
    }
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
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

    final FlutterTts flutterTts=FlutterTts();
  final TextEditingController textEditingController=TextEditingController();


speak(String text) async{
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1.5);
  await flutterTts.speak(text);
}
  // i want it speak the text in the text field automatically without pressing the button
  
  late WebViewXController webviewController;
//late  final WebViewController cotroller;
  //..setJavaScriptMode(JavaScriptMode.disabled)
  //..loadRequest(Uri.parse('https://pub.dev/packages/webview_flutter/example'));

  void _setUrl() {
    webviewController.loadContent(
      'https://www.programiz.com/java-programming/online-compiler/',
      //'https://chataigpt.org/',
      SourceType.URL,
    );
  }
  // https://app.ziteboard.com/
  // https://www.cymath.com/
  // https://www.circuitlab.com/editor/#?id=7pq5wm&from=homepage
  // https://www.falstad.com/circuit/
  // https://www.programiz.com/java-programming/online-compiler/


  @override
  void dispose() {
    // TODO: implement dispose
    webviewController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech Demo'),
      ),
      body:
       WebViewX(
        initialContent: 'https://www.programiz.com/java-programming/online-compiler/',
        initialSourceType: SourceType.URL,
        onWebViewCreated: (controller) {
          webviewController = controller;
          _setUrl();
        },
      ), 
    //  Center(child:
    //     Container(alignment:
    //       Alignment.center,
    //     child: Padding(
    //       padding: const EdgeInsets.all(32.0),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min ,
    //         children:<Widget>[
    //           Text('Enter your text',style: TextStyle(color: Colors.teal,fontSize: 30,fontWeight: FontWeight.bold),),
    //           TextFormField(
    //             controller: textEditingController,
    //           ),
    //           SizedBox(height: 12,),
    //           ElevatedButton(onPressed: ()=>speak(textEditingController.text)
    //               , child: Text('speech'),style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 131, 255, 243)),),
    //          SizedBox(height: 70,),
    //           Text("in case it doesn't work please download google services for text-to-speech from your store "
    //           ,style: TextStyle(color: Colors.teal,fontSize: 20),
    //           )
    //         ],
    //       ),
    //     ),
    //     )
    //     ,),


      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Container(
      //         padding: EdgeInsets.all(16),
      //         child: Text(
      //           'Recognized words:',
      //           style: TextStyle(fontSize: 20.0),
      //         ),
      //       ),
      //       Expanded(
      //         child: Container(
      //           padding: EdgeInsets.all(16),
      //           child: Text(
      //             // If listening is active show the recognized words
      //             _speechToText.isListening
      //                 ? '$_lastWords'
      //                 // If listening isn't active but could be tell the user
      //                 // how to start it, otherwise indicate that speech
      //                 // recognition is not yet ready or not supported on
      //                 // the target device
      //                 : _speechEnabled
      //                     ? 'Tap the microphone to start listening...'
      //                     : 'Speech not available',
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            // If not yet listening for speech start, otherwise stop
            _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}