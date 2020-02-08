import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loginjwt/controller/Controller.dart';
import 'package:loginjwt/controller/model/Usuario.dart';
import 'package:loginjwt/pagina_dois.dart';

class PaginaUm extends StatefulWidget {
  @override
  _PaginaUmState createState() => _PaginaUmState();
}

class _PaginaUmState extends State<PaginaUm> {
  Controller controller = new Controller();
  bool admin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("Requisição"),
              onPressed: () async {
                String token = await controller.pegarToken();
                await controller.salvarCarro(token);
                setState(() {
                  controller.usuarioAutenticado(token);
                  controller.usuario.roles
                      .forEach((role) => {print(role.name)});
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaginaDois(
                            controller: controller,
                          ),),
                );
              },
            ),
            FlatButton(
              child: Text("sou admin?"),
              onPressed: ()  {
                setState(() {
                  admin = controller.hasRole("ROLE_ADMIN");
                });
              },
            ),
            Text(controller.hasRole("ROLE_ADMIN")
                ? "SOU O DONO DESSE CARAI"
                : "SOU UM MERDA"),
            Visibility(
              visible: admin,
              child: Text("SOU O DONO DESSE CARAI"),
            ),
          ],
        ),
      ),
    );
  }
}
