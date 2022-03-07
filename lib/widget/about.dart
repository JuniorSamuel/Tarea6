import 'package:flutter/material.dart';

class About extends StatelessWidget {
  static const routerName = "/about";

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(fontSize: 17);
    return Scaffold(
        appBar: AppBar(
          title: const Text("About"),
          actions: [],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: <Widget>[
                const CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage("asset/img/yo.jpg"),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                  "Junior Samuel De Los Santos Velazquez",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                      textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("2022/02/06", style: style,),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("Mobile App development", style: style,),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("Teacher: Amadis ", style: style,),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const  Text("Version: 1.0.0", style: style,),
                ),               
              ],
            ),
          ),
        ));
  }
}
