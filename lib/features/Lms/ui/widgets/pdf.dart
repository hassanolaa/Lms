import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

// import 'package:flutter/material.dart';

// class pdf_view extends StatefulWidget {
//   const pdf_view({super.key});

//   @override
//   State<pdf_view> createState() => _pdf_viewState();
// }

// class _pdf_viewState extends State<pdf_view> {
//  late final WebViewController _controller;  
 
// @override
//   void initState() {
//     super.initState();

//     // #docregion platform_features
//     late final PlatformWebViewControllerCreationParams params;
   
  
//       params = const PlatformWebViewControllerCreationParams();
  

//     final WebViewController controller =
//         WebViewController.fromPlatformCreationParams(params);
//     // #enddocregion platform_features

//     controller
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             debugPrint('WebView is loading (progress : $progress%)');
//           },
//           onPageStarted: (String url) {
//             debugPrint('Page started loading: $url');
//           },
//           onPageFinished: (String url) {
//             debugPrint('Page finished loading: $url');
//           },
//           onWebResourceError: (WebResourceError error) {
//             debugPrint('''
// Page resource error:
//   code: ${error.errorCode}
//   description: ${error.description}
//   errorType: ${error.errorType}
//   isForMainFrame: ${error.isForMainFrame}
//           ''');
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               debugPrint('blocking navigation to ${request.url}');
//               return NavigationDecision.prevent;
//             }
//             debugPrint('allowing navigation to ${request.url}');
//             return NavigationDecision.navigate;
//           },
//           onUrlChange: (UrlChange change) {
//             debugPrint('url change to ${change.url}');
//           },
//           onHttpAuthRequest: (HttpAuthRequest request) {
//           },
//         ),
//       )
//       ..addJavaScriptChannel(
//         'Toaster',
//         onMessageReceived: (JavaScriptMessage message) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(message.message)),
//           );
//         },
//       )
//       ..loadRequest(Uri.parse('https://flutter.dev'));

   
//     // #enddocregion platform_features

//     _controller = controller;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: WebViewWidget(controller: _controller),);
//   }
// }
  