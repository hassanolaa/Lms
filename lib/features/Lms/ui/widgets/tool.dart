import 'package:flutter/material.dart';
import 'package:lms/core/routing/router.dart';
import 'package:lms/core/theming/extension.dart';
import 'package:lms/features/Lms/ui/widgets/webtemplete.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:webviewx/webviewx.dart';
import 'package:lms/core/theming/style.dart';
import 'package:lms/core/theming/colors.dart';
import '../screens/home.dart';

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
      body: ResponsiveBreakpoints.of(context).isMobile?
      Scaffold(
        body: SafeArea(
          child: Column(children: [
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
                              Text(
                                'Hello 👋, User',
                                style:
                                    textstyle.title.copyWith(color: Colors.white),
                              ),
                              CircleAvatar(
                                  radius: 20,
                                  // add person icon
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  
                context.height_box(0.03),
        
                Expanded(
                  child: WebViewX(
                        initialContent:
                         url,
                        initialSourceType: SourceType.URL,
                        onWebViewCreated: (controller) {
                        webviewController = controller;
                        _setUrl();
                        },
                      ),
                ),
               
          ],),
        ),
      )      
     : webtemplete(widegt:  WebViewX(
        initialContent:
           url,
        initialSourceType: SourceType.URL,
        onWebViewCreated: (controller) {
          webviewController = controller;
          _setUrl();
        },
      ),)
    );
  }
}
