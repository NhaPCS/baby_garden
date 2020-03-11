import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemindCard extends StatelessWidget {
  final image;
  final description;
  final price;
  final datetime;
  final remindType;

  RemindCard(
      {Key key,
      this.image,
      this.description,
      this.price,
      this.datetime,
      this.remindType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: SizeUtil.normalSpace,
          right: SizeUtil.smallSpace,
          left: SizeUtil.smallSpace),
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromRGBO(197, 193, 193, 1), width: 1)),
      width: double.infinity,
      height: 110,
      child: Card(
        margin: EdgeInsets.only(top: 0),
        child: Row(children: <Widget>[
          ClipRRect(
            child: Image.asset(
              this.image,
              width: 76.0,
              height: 76.0,
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
        ]),
      ),
    );
  }
}
