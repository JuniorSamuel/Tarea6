import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarea6/Model/element.dart';
import 'package:tarea6/widget/list.dart';
import 'package:tarea6/widget/summary_element.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        primaryColorDark: Colors.purple,
        scaffoldBackgroundColor: Colors.black
      ),
      initialRoute: "/",
      routes:{
        "/": (context) => const  MyHomePage(title: 'Flutter Demo Home Page'),
        "/summary": (context) => const SummaryElement()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const ListElement()
    );
  }
}
