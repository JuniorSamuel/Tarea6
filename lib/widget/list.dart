import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarea6/widget/about.dart';
import 'package:tarea6/widget/summary_element.dart';

import '../Model/element.dart';

class ListElement extends StatefulWidget {
  static const routerName = "/";
  const ListElement({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListElement();
}

class _ListElement extends State<ListElement> {
  List<Elements> _elements = [];

  _ListElement() {
    loadJSON();
  }

  void loadJSON() {
    rootBundle
        .loadString("data/elementos.json")
        .then((value) => {_elementState(value)});
  }

  void _elementState(String json) {
    Map<String, dynamic> j = jsonDecode(json);
    var e = PeriodicTable.fromJson(j);
    ;
    setState(() {
      _elements = e.elements;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Periodic Table"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(About.routerName);
              },
              icon: const Icon(Icons.info_outline_rounded),
              tooltip: "About",
            )
          ],
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(8.0),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: List.generate(_elements.length, (index) {
            return Center(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SummaryElement.routerName,
                        arguments: _elements[index]);
                  },
                  child: CircleAvatar(
                    radius: 50,
                    child: Text(
                      _elements[index].symbol,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Text(_elements[index].name)
              ],
            ));
          }),
        ));
  }
}
