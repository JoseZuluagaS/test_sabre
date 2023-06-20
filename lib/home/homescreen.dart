import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_sabre/api/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> horarios = [
    ListTile(
      title: const Text("Hora al iniciar el proyecto"),
      subtitle: Text(DateTime.now().toString()),
    )
  ];

  static List<PopupMenuEntry> timezones =  [
    const PopupMenuItem(
      value: "America/Boa_Vista",
      child: Text("America/Boa_Vista")
    ),
    const PopupMenuItem(
      value: "America/Bogota",
      child: 
      Text("America/Bogota")
    ),
    const PopupMenuItem(
      value: "America/Boise",
      child: 
      Text("America/Boise")
    ),
    const PopupMenuItem(
      value: "America/Boa_Vista",
      child: 
      Text("America/B")
    ),
  ];

  void timeZoneResponse(String param) async{
    Response res = await Api().getTimeZone(param);
    if(res.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(res.body);
      String datetime = json["datetime"];
      horarios.add(
        ListTile(
        title: Text(param),
        subtitle: Text(datetime),
        )
      );
      setState(() {
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Horarios"), actions: [PopupMenuButton(itemBuilder: (context) => timezones, onSelected: (value) =>  timeZoneResponse(value),)],),
      body: Center(
        child: ListView.builder(
          itemCount: horarios.length,
          itemBuilder: (context, index) => horarios[index],
        ),
      ),
    );
  }
}
