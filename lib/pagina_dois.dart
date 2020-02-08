import 'package:flutter/material.dart';
import 'package:loginjwt/controller/Controller.dart';

class PaginaDois extends StatelessWidget {
  Controller controller;

  PaginaDois({@required this.controller});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.usuario.sub + controller.usuario.roles.map((f)=> f.name.toString()).toString()),
      ),
    );
  }
}
