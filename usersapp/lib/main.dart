import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

import 'add_producto.dart';
import 'home_page.dart';
import 'models.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: Categoria()),
      ChangeNotifierProvider.value(value: Cliente()),
      ChangeNotifierProvider.value(value: Departamento()),
      ChangeNotifierProvider.value(value: Lista()),
      ChangeNotifierProvider.value(value: Marca()),
      ChangeNotifierProvider.value(value: Orden()),
      ChangeNotifierProvider.value(value: Producto()),
      ChangeNotifierProvider.value(value: User()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map data;
  List usersData;

  getUsers() async {
    http.Response response =
        await http.get('http://192.168.0.5:4000/api/users');
    data = json.decode(response.body);
    setState(() {
      usersData = data['users'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: usersData == null ? 0 : usersData.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Row(
                    children: [
                      Text('${index + 1}'),
                      SizedBox(width: 20.0),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(usersData[index]['avatar']),
                      ),
                      SizedBox(width: 20.0),
                      Text(
                          '${usersData[index]['firstName']} ${usersData[index]['lastName']}')
                    ],
                  ),
                );
              }),
        ));
  }
}
