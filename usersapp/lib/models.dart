import 'package:flutter/material.dart';

import 'crud.dart';

class Categoria with ChangeNotifier {
  final String name;
  final String url;
  final String id;

  Categoria({this.name, this.url, this.id});

  List<Categoria> provider;

  Future<void> actualizaTodo() async {
    Map data = await Crud(coleccion: 'categorias').all();
    provider = all(data);
    notifyListeners();
  }

  List<Categoria> all(Map data) {
    List usersData;
    List<Categoria> res = new List();
    usersData = data['categorias'];
    for (int i = 0; i < usersData.length; i++) {
      res.add(new Categoria(
          name: usersData[i]['name'],
          url: usersData[i]['url'],
          id: usersData[i]['_id']));
    }
    return res;
  }

  Map toMap() {
    return {
      "name": name,
      "url": url,
    };
  }
}

class Cliente with ChangeNotifier {
  final String name;
  final String phone;
  final String id;

  Cliente({this.name, this.phone, this.id});

  List<Cliente> provider;

  Future<void> actualizaTodo() async {
    Map data = await Crud(coleccion: 'clientes').all();
    provider = all(data);
    notifyListeners();
  }

  List<Cliente> all(Map data) {
    List usersData;
    List<Cliente> res = new List();
    usersData = data['clientes'];
    for (int i = 0; i < usersData.length; i++) {
      res.add(new Cliente(
          name: usersData[i]['name'],
          phone: usersData[i]['phone'],
          id: usersData[i]['_id']));
    }
    return res;
  }
}

class Departamento with ChangeNotifier {
  final String name;
  final String url;
  final String id;

  Departamento({this.name, this.url, this.id});

  List<Departamento> provider;

  Future<void> actualizaTodo() async {
    Map data = await Crud(coleccion: 'departamentos').all();
    provider = all(data);
    notifyListeners();
  }

  List<Departamento> all(Map data) {
    List usersData;
    List<Departamento> res = new List();
    usersData = data['departamentos'];
    for (int i = 0; i < usersData.length; i++) {
      res.add(new Departamento(
          name: usersData[i]['name'],
          url: usersData[i]['url'],
          id: usersData[i]['_id']));
    }
    return res;
  }

  Map toMap() {
    return {
      "name": name,
      "url": url,
    };
  }
}

class Lista with ChangeNotifier {
  final List productos;
  final String id;

  Lista({this.productos, this.id});

  List<Lista> provider;

  Future<void> actualizaTodo() async {
    Map data = await Crud(coleccion: 'listas').all();
    provider = all(data);
    notifyListeners();
  }

  List<Lista> all(Map data) {
    List usersData;
    List<Lista> res = new List();
    usersData = data['listas'];
    for (int i = 0; i < usersData.length; i++) {
      res.add(new Lista(
          productos: usersData[i]['productos'], id: usersData[i]['_id']));
    }
    return res;
  }

  Map toMap() {
    return {
      "productos": productos,
    };
  }
}

class Marca with ChangeNotifier {
  final String name;
  final String url;
  final String id;

  Marca({this.name, this.url, this.id});

  List<Marca> provider;

  Future<void> actualizaTodo() async {
    Map data = await Crud(coleccion: 'marcas').all();
    provider = all(data);
    notifyListeners();
  }

  List<Marca> all(Map data) {
    List usersData;
    List<Marca> res = new List();
    usersData = data['marcas'];
    for (int i = 0; i < usersData.length; i++) {
      res.add(new Marca(
          name: usersData[i]['name'],
          url: usersData[i]['url'],
          id: usersData[i]['_id']));
    }
    return res;
  }

  Map toMap() {
    return {
      "name": name,
      "url": url,
    };
  }
}

class Orden with ChangeNotifier {
  final String cliente;
  final String lista;
  final double precio;
  final bool pagado;
  final String id;

  Orden({this.cliente, this.lista, this.precio, this.pagado, this.id});

  List<Orden> provider;

  Future<void> actualizaTodo() async {
    Map data = await Crud(coleccion: 'ordenes').all();
    provider = all(data);
    notifyListeners();
  }

  List<Orden> all(Map data) {
    List usersData;
    List<Orden> res = new List();
    usersData = data['ordenes'];
    for (int i = 0; i < usersData.length; i++) {
      res.add(new Orden(
          cliente: usersData[i]['cliente'],
          lista: usersData[i]['lista'],
          precio: usersData[i]['precio'],
          pagado: usersData[i]['pagado'],
          id: usersData[i]['_id']));
    }
    return res;
  }

  Map toMap() {
    return {
      "cliente": cliente,
      "lista": lista,
      "precio": precio,
      "pagado": pagado,
    };
  }
}

class Producto with ChangeNotifier {
  final int stack;
  final double precioCompra;
  final double precioVenta;
  final String marca;
  final String descripcion;
  final String barCode;
  final String departamento;
  final String categoria;
  final String id;
  final String url;

  Producto(
      {this.url,
      this.stack,
      this.precioCompra,
      this.precioVenta,
      this.marca,
      this.descripcion,
      this.barCode,
      this.departamento,
      this.categoria,
      this.id});

  List<Producto> provider;

  Future<void> actualizaTodo() async {
    Map data = await Crud(coleccion: 'productos').all();
    provider = all(data);
    notifyListeners();
  }

  List<Producto> all(Map data) {
    List usersData;
    List<Producto> res = new List();
    usersData = data['productos'];
    for (int i = 0; i < usersData.length; i++) {
      res.add(new Producto(
          url: usersData[i]['url'],
          stack: usersData[i]['stack'],
          precioCompra: usersData[i]['precioCompra'],
          precioVenta: usersData[i]['precioVenta'],
          marca: usersData[i]['marca'],
          descripcion: usersData[i]['descripcion'],
          barCode: usersData[i]['barCode'],
          departamento: usersData[i]['departamento'],
          categoria: usersData[i]['categoria'],
          id: usersData[i]['_id']));
    }
    return res;
  }

  Map toMap() {
    Map<String, dynamic> mapa;
    mapa = {
      "url": url,
      "stack": stack,
      "precioCompra": precioCompra,
      "precioVenta": precioVenta,
      "marca": marca,
      "descripcion": descripcion,
      "barCode": barCode,
      "departamento": departamento,
      "categoria": categoria,
    };
    return mapa;
  }
}

class User with ChangeNotifier {
  final String firstName;
  final String lastName;
  final String avatar;
  final String id;

  User({this.firstName, this.lastName, this.avatar, this.id});

  List<User> provider;

  Future<void> actualizaTodo() async {
    Map data = await Crud(coleccion: 'users').all();
    provider = all(data);
    notifyListeners();
  }

  List<User> all(Map data) {
    List usersData;
    List<User> res = new List();
    usersData = data['ordenes'];
    for (int i = 0; i < usersData.length; i++) {
      res.add(new User(
          firstName: usersData[i]['firstName'],
          lastName: usersData[i]['lastName'],
          avatar: usersData[i]['avatar'],
          id: usersData[i]['_id']));
    }
    return res;
  }

  Map toMap() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "avatar": avatar,
    };
  }
}
