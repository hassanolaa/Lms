import 'package:flutter/material.dart';
import 'package:lms/core/routing/router.dart';
import 'package:webviewx/webviewx.dart';

class tool extends StatefulWidget {
   tool({super.key
   ,required this.url,
   });
  String url;

  @override
  State<tool> createState() => _toolState();
}

class _toolState extends State<tool> {
  late WebViewXController webviewController;
//late  final WebViewController cotroller;
  //..setJavaScriptMode(JavaScriptMode.disabled)
  //..loadRequest(Uri.parse('https://pub.dev/packages/webview_flutter/example'));

  void _setUrl() {
    webviewController.loadContent(
      url,
      //'https://chataigpt.org/',
      SourceType.URL,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewX(
        initialContent:
           url,
        initialSourceType: SourceType.URL,
        onWebViewCreated: (controller) {
          webviewController = controller;
          _setUrl();
        },
      ),
    );
  }
}
