import 'package:flutter/material.dart';
import 'package:lms/features/Lms/ui/widgets/webtemplete.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class pdf_view extends StatefulWidget {
  const pdf_view({super.key});

  @override
  State<pdf_view> createState() => _pdf_viewState();
}

class _pdf_viewState extends State<pdf_view> {
 
 late WebViewXController webviewController;
//late  final WebViewController cotroller;
  //..setJavaScriptMode(JavaScriptMode.disabled)
  //..loadRequest(Uri.parse('https://pub.dev/packages/webview_flutter/example'));

  void _setUrl() {
    webviewController.loadContent(
      '''
      <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Embedded PDF</title>
</head>
<body>

    <embed src="https://www.utstat.toronto.edu/mikevans/jeffrosenthal/book.pdf" type="application/pdf" width="100%" height="600px" />

</body>
</html>
      ''',
      //'https://chataigpt.org/',
      SourceType.HTML,
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
      appBar: AppBar(
        title: Text('Pdf View'),
      
      ),
        body:
    
   
        webtemplete(widegt:  WebViewX(
        initialContent:
          '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Embedded PDF</title>
</head>
<body>

    <embed src="https://www.utstat.toronto.edu/mikevans/jeffrosenthal/book.pdf" type="application/pdf" width="100%" height="600px" />

</body>
</html>
''',
        initialSourceType: SourceType.HTML,
        onWebViewCreated: (controller) {
          webviewController = controller;
          _setUrl();
        },
      ),
        )
      );
  }
}
 