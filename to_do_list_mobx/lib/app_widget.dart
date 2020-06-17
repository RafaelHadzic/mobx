import 'package:flutter/material.dart';
import 'package:to_do_list_mobx/home.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lista de Tarefas", 
      home: Home(),     
    );
  }
}