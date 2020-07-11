import 'package:flutter/material.dart';

class Recomends extends StatelessWidget {
  const Recomends({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: "assets/logo.png",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {
              // Navigator.push(
              //     context,
              //       MaterialPageRoute(
              //           builder: (context) => DetailsScreen(),
              //           ),
              //           );
            },
          ),
          RecomendPlantCard(
            image: "assets/logo.png",
            title: "Angelica",
            country: "Russia",
            price: 440,
            press: () {
              //    Navigator.push(
              //        context,
              //          MaterialPageRoute(
              //              builder: (context) => DetailsScreen(),
              //              ),
//              );
            },
          ),
          RecomendPlantCard(
            image: "assets/logo.png",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        top: 10.0,
        bottom: 50.0,
      ),
      width: 150.0, //size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.blue.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: Colors.blue.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Colors.blue),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
