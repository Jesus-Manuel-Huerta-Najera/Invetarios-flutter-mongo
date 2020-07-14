import 'package:flutter/material.dart';

class ShowCatDepMarca extends StatelessWidget {
  final dynamic obj;

  const ShowCatDepMarca({Key key, this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${obj.name}'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: obj.url == null
                    ? DateTime.now().toIso8601String()
                    : obj.url,
                child: Container(
                  height: 150.0,
                  width: double.infinity,
                  child: FadeInImage(
                      placeholder: AssetImage('assets/producto.jpg'),
                      image: NetworkImage(obj.url == null
                          ? DateTime.now().toIso8601String()
                          : obj.url),
                      fit: BoxFit.fitWidth),
                ),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
