import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:loginjwt/controller/model/Usuario.dart';

class Controller {

  Dio dio = new Dio()..options.baseUrl="http://25.15.175.255:8080/flatland/";
  static List<Roles> roles = new List();
  Usuario usuario = new Usuario(roles: roles);


  Future<String> pegarToken() async {
    String data = '''{
    "username": "admin",
    "password": "admin"
    }''';
    var response = await dio.post('v1/auth/token', data: data);
    String token = response.data["payload"]["token"].toString();

    return token;
  }

  Usuario usuarioAutenticado(String token){
    var tokens = token.split(".");
    var usuario = Usuario.fromJson(jsonDecode(utf8.decode(base64Decode((tokens[1])))));
    this.usuario = usuario;
    return usuario;
  }

  bool hasRole(String role){
    return usuario.roles.contains(Roles(name: role.toUpperCase()));
  }

  void salvarCarro(String token) async {
    String data = '''{ "nome": "tesdasdaste" }''';


    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Content-Type"] = "application/json";

    try {
      var response = await dio.post("carros", data: data);
      print(response.data);
    } catch (e) {
      print(e);
    }

//    print(response.data);
  }
}
