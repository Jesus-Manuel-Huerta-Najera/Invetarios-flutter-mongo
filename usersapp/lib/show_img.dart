import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  final String place;
  final String def;
  ShowImage({this.place, this.def});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Regresar')
      ),
      body: Center(
        child: Hero(
            tag: def,
            child: Container(
              color: Colors.black,
              child: FadeInImage(
                placeholder: AssetImage(place),
                image: NetworkImage(def),
                fit: BoxFit.cover
          ),
            ),
        ),
      ),
    );
  }
}