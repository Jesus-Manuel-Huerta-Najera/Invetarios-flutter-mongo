import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usersapp/title_btn.dart';

import 'add_producto.dart';
import 'card.dart';
import 'drawer_home.dart';
import 'header.dart';
import 'models.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Marca marcas;
  Departamento departamentos;
  Categoria categorias;
  List<Marca> providerMarca;
  List<Departamento> providerDepartamento;
  List<Categoria> providerCategoria;

  void generar() {
    marcas.actualizaTodo().whenComplete(() {
      setState(() {
        providerMarca = marcas.provider;
      });
    });
    departamentos.actualizaTodo().whenComplete(() {
      setState(() {
        providerDepartamento = departamentos.provider;
      });
    });
    categorias.actualizaTodo().whenComplete(() {
      setState(() {
        providerCategoria = categorias.provider;
      });
    });
  }

  bool actualiza = true;

  @override
  Widget build(BuildContext context) {
    marcas = Provider.of<Marca>(context);
    departamentos = Provider.of<Departamento>(context);
    categorias = Provider.of<Categoria>(context);
    Size size = MediaQuery.of(context).size;
    if (actualiza) {
      generar();
      actualiza = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('El apartado'),
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  actualiza = true;
                });
              })
        ],
      ),
      drawer: DrawerHome(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderWithSearchBox(size: size),
              TitleWithMoreBtn(title: "Marcas", press: () {}),
              Recomends(
                objs: providerMarca,
              ),
              TitleWithMoreBtn(title: "Departamentos", press: () {}),
              Recomends(
                objs: providerDepartamento,
              ),
              TitleWithMoreBtn(title: "Categorias", press: () {}),
              Recomends(
                objs: providerCategoria,
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
