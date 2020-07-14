import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'show_m_d_c.dart';

class Recomends extends StatefulWidget {
  final List objs;
  final Function press;

  const Recomends({Key key, this.objs, this.press}) : super(key: key);

  @override
  _RecomendsState createState() => _RecomendsState();
}

class _RecomendsState extends State<Recomends> {
  List<Widget> elementos = new List();

  void genera() {
    elementos.clear();
    widget.objs.forEach((element) {
      elementos.add(CardCatDepMarca(
        obj: element,
        press: widget.press,
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    genera();
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: Row(children: elementos));
  }
}

class CardCatDepMarca extends StatelessWidget {
  final dynamic obj;
  final Function press;

  const CardCatDepMarca({Key key, this.obj, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 152.0,
        margin: EdgeInsets.only(
          left: 20.0,
          top: 10.0,
          bottom: 50.0,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.blue[200], width: 1.0)),
        width: 100.0, //size.width * 0.4,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => ShowCatDepMarca(
                          obj: obj,
                        )));
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Colors.blue.withOpacity(0.23),
                ),
              ],
            ),
            child: Column(
              children: [
                Hero(
                  tag: obj.url == null
                      ? DateTime.now().toIso8601String()
                      : obj.url,
                  child: Container(
                    height: 100.0,
                    child: FadeInImage(
                        placeholder: AssetImage('assets/producto.jpg'),
                        image: NetworkImage(obj.url == null
                            ? DateTime.now().toIso8601String()
                            : obj.url),
                        fit: BoxFit.contain),
                  ),
                ),
                Text(
                  '${obj.name}'.toUpperCase(),
                  style: TextStyle(fontSize: 13.0, color: Colors.black),
                )
              ],
            ),
          ),
        ));
  }
}
