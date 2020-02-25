import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointHistory extends StatelessWidget {
  final image;
  final name;
  final point;

  PointHistory({Key key, this.image, this.name, this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: setBorder('bottom', Color.fromRGBO(201, 200, 200, 1), 1),
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 90,
      child: GestureDetector(
        onTap: () {},
        child: Row(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              this.image,
              fit: BoxFit.cover,
              width: 55.0,
              height: 55.0,
            ),
          ),
          Expanded(
            child: Container(
                // height: 90,
                padding: EdgeInsets.only(top: 15),
                child: ListView(
                    padding: const EdgeInsets.all(8),
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Text(this.name,
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorUtil.primaryColor,
                              fontWeight: FontWeight.bold)),
                      Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(this.point.toString() + ' điểm',
                              style: TextStyle(
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                  fontSize: 16))),
                    ])),
          ),
          Image.asset(
            'photo/right.png',
            width: 10,
            height: 20,
          )
        ]),
      ),
    );
  }
}
