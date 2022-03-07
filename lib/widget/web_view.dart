
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikipediaView extends StatelessWidget{
  static const routerName = "/webView";
  const WikipediaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String arg = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(actions: [], title: const Text("WikipediaView"),),
      body: WebView(
          initialUrl: arg,
        ),
    );
  }
  
}