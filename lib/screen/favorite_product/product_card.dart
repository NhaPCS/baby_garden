import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final image;
  final description;
  final price;
  final datetime;
  final favorite;

  ProductCard(
      {Key key,
      this.image,
      this.description,
      this.price,
      this.datetime,
      this.favorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: SizeUtil.normalSpace,
          right: SizeUtil.smallSpace,
          left: SizeUtil.smallSpace),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0.0, 3.0),
            )
          ],
          border:
              Border.all(color: Color.fromRGBO(112, 112, 112, 1), width: 0.3)),
      width: double.infinity,
      height: 110,
      child: Card(
        margin: EdgeInsets.only(top: 0),
        child: Row(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(
              this.image,
              width: 94.0,
              height: 94.0,
            ),
          ),
          Expanded(
            child: Container(
                height: 100,
                padding: EdgeInsets.only(top: 0),
                child: ListView(
                    padding: const EdgeInsets.all(8),
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Text(this.description),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          this.price,
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(this.datetime,
                              style: TextStyle(
                                  color: Color.fromRGBO(10, 133, 158, 1),
                                  fontSize: 12))),
                    ])),
          ),
          Container(
            padding: EdgeInsets.only(top: 40, right: 15),
            child: Icon(
              Icons.favorite,
              color: favorite == true ? Colors.pink : Colors.white,
              size: 21.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
        ]),
      ),
    );
  }
}
