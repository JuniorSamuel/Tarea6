
import 'package:flutter/material.dart';
import 'package:tarea6/Model/element.dart';

class SummaryElement extends StatelessWidget{

  const SummaryElement({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Elements  args = ModalRoute.of(context)?.settings.arguments;
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: MediaQuery.of(context).size.height - 100,
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: []
        ),
      )
    );
  }
  
}