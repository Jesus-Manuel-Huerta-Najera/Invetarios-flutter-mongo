import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_producto.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 16.0,
        child: Column(
          children: [
            SizedBox(
              height: 15.0,
            ),
            Divider(),
            ListTile(
              title: Text("Agregar Producto"),
              leading: Icon(Icons.add_circle),
              onTap: () {
                // naavegar a la viajeslist
                Navigator.of(context).pop();
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => AddProducto()));
              },
            ),
            Divider(),
            ListTile(
              title: new Text("Ajustes"),
              //trailing: new Icon(Icons.arrow_forward_ios),
              leading: new Icon(Icons.settings),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('Acerca de la app'),
              leading: Transform.rotate(
                child: Icon(
                  Icons.error_outline,
                ),
                angle: pi,
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: new Text("Cerrar sesion"),
              leading: new Icon(Icons.exit_to_app),
              onTap: () async {
                //await auth.singOut();
              },
            ),
            Divider(),
          ],
        ));
  }
}
