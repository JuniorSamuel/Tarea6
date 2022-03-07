import 'package:flutter/material.dart';
import 'package:tarea6/widget/about.dart';
import 'package:tarea6/widget/list.dart';
import 'package:tarea6/widget/summary_element.dart';
import 'package:tarea6/widget/web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        primaryColorDark: Colors.purple,
        scaffoldBackgroundColor: Colors.black
      ),
      initialRoute: ListElement.routerName,
      routes:{
        ListElement.routerName: (context) => const  ListElement(),
        SummaryElement.routerName: (context) => const SummaryElement(),
        WikipediaView.routerName: (context) => const WikipediaView(),
        About.routerName: (context) => About()
      },
    );
  }
}