import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:usersapp/shared/loading.dart';

import 'crud.dart';
import 'models.dart';
import 'shared/constants.dart';

class AddProducto extends StatefulWidget {
  @override
  _AddProductoState createState() => _AddProductoState();
}

class _AddProductoState extends State<AddProducto> {
  String descripcion;
  int stack;
  String barCode;
  double compra;
  double venta;
  bool cargando = false;
  File imagen;
  Marca marca;
  Departamento departamento;
  Categoria categoria;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return cargando
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey[900],
              elevation: 10.0,
              title: Text('Agregar Producto'),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: () {
                      showAlertDialog(context);
                    }),
              ],
            ),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg1.jpg'), fit: BoxFit.cover)),
              padding: EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: size.width * 0.125),
              child: Form(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Descripción'),
                      validator: (val) => val.isEmpty
                          ? 'Ingrese una descripcion de producto'
                          : null,
                      onChanged: (val) {
                        setState(() {
                          this.descripcion = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 50.0,
                      color: Colors.white,
                      child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(seconds: 60), () {
                                    Navigator.of(context).pop();
                                  });
                                  return _marcas();
                                });
                          },
                          child: marca == null
                              ? Center(child: Text('Marca del producto'))
                              : Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Hero(
                                        tag: marca.url,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: FadeInImage(
                                              placeholder: AssetImage(
                                                  'assets/marca.png'),
                                              image: NetworkImage(marca.url),
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ),
                                    Expanded(flex: 3, child: Text(marca.name))
                                  ],
                                )),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                        height: 50.0,
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(seconds: 60), () {
                                    Navigator.of(context).pop();
                                  });
                                  return _departamentos();
                                });
                          },
                          child: departamento == null
                              ? Center(child: Text('Departamento del producto'))
                              : Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Hero(
                                        tag: marca.url,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: FadeInImage(
                                              placeholder: AssetImage(
                                                  'assets/marca.png'),
                                              image: NetworkImage(
                                                  departamento.url),
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 3, child: Text(departamento.name))
                                  ],
                                ),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                        height: 50.0,
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(seconds: 60), () {
                                    Navigator.of(context).pop();
                                  });
                                  return _categorias();
                                });
                          },
                          child: categoria == null
                              ? Center(child: Text('Categoria del producto'))
                              : Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Hero(
                                        tag: marca.url,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: FadeInImage(
                                              placeholder: AssetImage(
                                                  'assets/marca.png'),
                                              image:
                                                  NetworkImage(categoria.url),
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 3, child: Text(categoria.name))
                                  ],
                                ),
                        )),
                    SizedBox(height: 15.0),
                    RaisedButton(
                      color: Colors.blueGrey[900],
                      child: Text(
                        'Guardar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic),
                      ),
                      onPressed: () {
                        Map<String, dynamic> mapa = Producto(
                          stack: stack == null ? 0 : stack,
                          precioVenta: venta == null ? 0 : venta,
                          precioCompra: compra == null ? 0 : compra,
                          marca: marca == null ? "no marca" : marca.id,
                          url: imagen == null
                              ? DateTime.now().toIso8601String()
                              : imagen.uri,
                          descripcion: descripcion == null
                              ? "no descripcion"
                              : descripcion,
                          departamento: departamento == null
                              ? "no departamento"
                              : departamento.id,
                          categoria:
                              categoria == null ? "no categoria" : categoria.id,
                          barCode: barCode == null ? "no bar code" : barCode,
                        ).toMap();
                        if (descripcion == "" ||
                            imagen == null ||
                            stack == null ||
                            venta == null ||
                            compra == null ||
                            barCode == null ||
                            categoria == null ||
                            departamento == null ||
                            marca == null) {
                          // lansar una alerta de confirmar guardar con datos incompletos
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 60), () {
                                  Navigator.of(context).pop();
                                });
                                return _confirma(mapa, false);
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 60), () {
                                  Navigator.of(context).pop();
                                });
                                return _confirma(mapa, true);
                              });
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Widget _confirma(Map<String, dynamic> mapa, bool todo) {
    return AlertDialog(
      title: Text(
        !todo
            ? 'Hay campos incompletos, ¿Quieres guardar?'
            : '¿Quieres guardar?',
        style: TextStyle(fontSize: 25.0),
        textAlign: TextAlign.center,
      ),
      content: Container(
        child: Row(
          children: <Widget>[
            Expanded(
                child: RaisedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Crud(coleccion: 'productos', mapa: mapa)
                          .create()
                          .whenComplete(() {
                        Fluttertoast.showToast(msg: "Agregaste un producto");
                        Navigator.of(context).pop();
                      });
                    },
                    icon: Icon(Icons.check),
                    label: Text('Sí',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic)),
                    color: Colors.blueGrey[200])),
            SizedBox(width: 5.0),
            Expanded(
                child: RaisedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close),
              label: Text('No',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic)),
              color: Colors.redAccent[200],
            ))
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 60), () {
            Navigator.of(context).pop();
          });
          return _alert();
        });
  }

  Widget _alert() {
    return AlertDialog(
      title: Text(
        'Agregar campo',
        style: TextStyle(
            fontSize: 25.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: Container(
        height: 150.0,
        child: ListView(
          children: <Widget>[
            if (imagen == null) ...[
              Divider(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton.icon(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.green[800],
                      ),
                      label: Text('Foto'),
                      onPressed: () {
                        Navigator.of(context).pop();
/*                      crop.pickImage(ImageSource.camera).whenComplete(() {
                          setState((){
                            imagen = crop.imagen;
                          });
                        }); */
                      },
                    ),
                  ),
                  Expanded(
                    child: FlatButton.icon(
                      icon: Icon(
                        Icons.photo_library,
                        color: Colors.orange[800],
                      ),
                      label: Text('Imagen'),
                      onPressed: () {
                        Navigator.of(context).pop();
/*                      crop.pickImage(ImageSource.gallery).whenComplete(() {
                          setState(() {
                            imagen = crop.imagen;
                          }); 
                        }); */
                      },
                    ),
                  ),
                ],
              )
            ],
            if (marca == null) ...[
              Divider(),
              FlatButton.icon(
                icon: Icon(Icons.supervised_user_circle,
                    color: Colors.blueGrey[600]),
                label: Text('Agregar marca'),
                onPressed: () {
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(Duration(seconds: 60), () {
                          Navigator.of(context).pop();
                        });
                        return _marcas();
                      });
                },
              )
            ],
            if (departamento == null) ...[
              Divider(),
              FlatButton.icon(
                icon: Icon(Icons.local_mall, color: Colors.cyanAccent),
                label: Text('Departamento'),
                onPressed: () {
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(Duration(seconds: 60), () {
                          Navigator.of(context).pop();
                        });
                        return _departamentos();
                      });
                },
              )
            ],
            if (categoria == null) ...[
              Divider(),
              FlatButton.icon(
                icon: Icon(Icons.local_offer, color: Colors.tealAccent),
                label: Text('Categoria'),
                onPressed: () {
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(Duration(seconds: 60), () {
                          Navigator.of(context).pop();
                        });
                        return _categorias();
                      });
                },
              )
            ]
          ],
        ),
      ),
    );
  }

  Widget _categorias() {
    return AlertDialog(
      actions: <Widget>[
        FlatButton.icon(
          color: Colors.blueGrey[700],
          icon: Icon(Icons.add_circle),
          label: Text('Agregar categoria'),
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(Duration(seconds: 60), () {
                    Navigator.of(context).pop();
                  });
                  return _agregar('categorias');
                });
          },
        )
      ],
      title: Text(
        'Selección',
        style: TextStyle(
            fontSize: 25.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: FutureBuilder<Map>(
          future: Crud(coleccion: 'categorias').all(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return Container(
              height: 250.0,
              child: buildList(snapshot.data, 'categorias'),
            );
          }),
    );
  }

  Widget _departamentos() {
    return AlertDialog(
      actions: <Widget>[
        FlatButton.icon(
          color: Colors.blueGrey[700],
          icon: Icon(Icons.add_circle),
          label: Text('Agregar departamento'),
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(Duration(seconds: 60), () {
                    Navigator.of(context).pop();
                  });
                  return _agregar('departamentos');
                });
          },
        )
      ],
      title: Text(
        'Selección',
        style: TextStyle(
            fontSize: 25.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: FutureBuilder<Map>(
          future: Crud(coleccion: 'departamentos').all(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              print(snapshot.toString());
              return Center(child: CircularProgressIndicator());
            }
            return Container(
              height: 250.0,
//              child: Text('Todo: ${snapshot.data}'),
              child: buildList(snapshot.data, 'departamentos'),
            );
          }),
    );
  }

  // retorna los datos del map como una lista de los objetos modelo
  List colecciones(Map data, String coleccion) {
    List objs;
    switch (coleccion) {
      case "categorias":
        {
          objs = Categoria().all(data);
        }
        break;
      case "clientes":
        {
          objs = Cliente().all(data);
        }
        break;
      case "departamentos":
        {
          objs = Departamento().all(data);
        }
        break;
      case "listas":
        {
          objs = Lista().all(data);
        }
        break;
      case "marcas":
        {
          objs = Marca().all(data);
        }
        break;
      case "ordenes":
        {
          objs = Orden().all(data);
        }
        break;
      case "productos":
        {
          objs = Producto().all(data);
        }
        break;
      case "users":
        {
          objs = User().all(data);
        }
        break;
    }
    return objs;
  }

  Widget itemCatDepMarca(var obj, String coleccion) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: // Text('coleccion: $coleccion \n name: ${obj.name} \n url: ${obj.url}')
            Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blueGrey[100],
          ),
          child: Container(
              width: double.infinity,
              height: 50.0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    setState(() {
                      switch (coleccion) {
                        case 'categorias':
                          this.categoria = obj;
                          break;
                        case 'departamentos':
                          this.departamento = obj;
                          break;
                        case 'marcas':
                          this.marca = obj;
                          break;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.0,
                      ),
                      Container(
                        height: 40.0,
                        width: 40.0,
                        child: FadeInImage(
                            placeholder: AssetImage('assets/marca.png'),
                            image: NetworkImage(obj.url == null ? "" : obj.url),
                            fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        obj.name,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )), // itemMarca(marca),
        ));
  }

  Widget buildList(Map data, String coleccion) {
    List objs = colecciones(data, coleccion);
    List<Widget> items = new List();
    objs.forEach((e) {
      items.add(itemCatDepMarca(e, coleccion));
    });
    return ListView(
      padding: const EdgeInsets.only(top: 10.0),
      children: items,
    );
  }

  Widget _agregar(String coleccion) {
    String name = "";
    File foto;
    return AlertDialog(
      title: Text(
        'Crear',
        style: TextStyle(
            fontSize: 25.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      actions: [
        FlatButton.icon(
          color: Colors.blueGrey[700],
          icon: Icon(Icons.save),
          label: Text('Guardar'),
          onPressed: () {
            Navigator.of(context).pop();
            switch (coleccion) {
              case 'marcas':
                {
                  Crud(
                          coleccion: coleccion,
                          mapa: Marca(
                                  name: name,
                                  url: DateTime.now().toIso8601String())
                              .toMap())
                      .create()
                      .whenComplete(() {
                    Fluttertoast.showToast(msg: "Agregaste a $coleccion");
                  });
                }
                break;
              case 'departamentos':
                {
                  Crud(
                          coleccion: coleccion,
                          mapa: Departamento(
                                  name: name,
                                  url: DateTime.now().toIso8601String())
                              .toMap())
                      .create()
                      .whenComplete(() {
                    Fluttertoast.showToast(msg: "Agregaste a $coleccion");
                  });
                }
                break;
              case 'categorias':
                {
                  Crud(
                          coleccion: coleccion,
                          mapa: Categoria(
                                  name: name,
                                  url: DateTime.now().toIso8601String())
                              .toMap())
                      .create()
                      .whenComplete(() {
                    Fluttertoast.showToast(msg: "Agregaste a $coleccion");
                  });
                }
                break;
            }
          },
        )
      ],
      content: Container(
        height: 150.0,
        child: Form(
          child: ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              if (foto == null) ...[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton.icon(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.green[800],
                        ),
                        label: Text('Foto'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          /*                      crop.pickImage(ImageSource.camera).whenComplete(() {
                            setState((){
                              imagen = crop.imagen;
                            });
                          }); */
                        },
                      ),
                    ),
                    Expanded(
                      child: FlatButton.icon(
                        icon: Icon(
                          Icons.photo_library,
                          color: Colors.orange[800],
                        ),
                        label: Text('Imagen'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          /*                      crop.pickImage(ImageSource.gallery).whenComplete(() {
                            setState(() {
                              imagen = crop.imagen;
                            }); 
                          }); */
                        },
                      ),
                    ),
                  ],
                ),
              ] else ...[
                Container(
                  child: Image.file(foto),
                )
              ],
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'Descripcion'),
                validator: (val) =>
                    val.isEmpty ? 'Ingrese una descripcion de producto' : null,
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _marcas() {
    return AlertDialog(
      actions: <Widget>[
        FlatButton.icon(
          color: Colors.blueGrey[700],
          icon: Icon(Icons.add_circle),
          label: Text('Agregar marca'),
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(Duration(seconds: 60), () {
                    Navigator.of(context).pop();
                  });
                  return _agregar('marcas');
                });
          },
        )
      ],
      title: Text(
        'Selección',
        style: TextStyle(
            fontSize: 25.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: FutureBuilder<Map>(
          future: Crud(coleccion: 'marcas').all(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return Container(
              height: 250.0,
              child: buildList(snapshot.data, 'marcas'),
            );
          }),
    );
  }
}
