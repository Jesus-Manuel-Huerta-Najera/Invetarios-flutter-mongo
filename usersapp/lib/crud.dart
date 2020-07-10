import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:usersapp/shared/constants.dart';

class Crud {
  final String id;
  final String coleccion;
  final Map<String, dynamic> mapa;

  Crud({this.mapa, this.id, this.coleccion});

  Future<Map<String, dynamic>> all() async {
    Map data;
    http.Response response = await http.get('http://$host/api/$coleccion');
    data = json.decode(response.body);
    print(data);
    return data;
  }

  Future<Map<String, dynamic>> one() async {
    Map data;
    http.Response response = await http.post('http://$host/api/$coleccion',
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "_id": '$id',
        }));
    data = json.decode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> delete() async {
    Map data;
    http.Response response =
        await http.post('http://$host/api/$coleccion/delete',
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, dynamic>{
              "_id": '$id',
            }));
    data = json.decode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> update() async {
    Map data;
    http.Response response =
        await http.post('http://$host/api/$coleccion/update',
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(mapa));
    data = json.decode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> create() async {
    Map data;
    http.Response response =
        await http.post('http://$host/api/$coleccion/create',
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(mapa));
    data = json.decode(response.body);
    return data;
  }
}
