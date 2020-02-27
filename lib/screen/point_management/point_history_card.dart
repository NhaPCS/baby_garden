import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointHistoryCard extends StatelessWidget {
  final image;
  final history;
  final dateTime;
  final int changedPoint;
  final remainPoint;

  PointHistoryCard(
      {Key key,
      this.image,
      this.history,
      this.dateTime,
      this.changedPoint,
      this.remainPoint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.changedPoint);
    return Container(
      decoration: setBorder('bottom', Color.fromRGBO(201, 200, 200, 1), 1),
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 90,
      child: Row(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(236, 236, 236, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(-3.0, 3.0),
                )
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              this.image,
              fit: BoxFit.cover,
              width: 55.0,
              height: 55.0,
            ),
          ),
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: ListView(
                  padding: const EdgeInsets.all(8),
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Text(this.history,
                        style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 1),
                            fontWeight: FontWeight.bold)),
                    Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(this.dateTime,
                            style: TextStyle(
                                color: Color.fromRGBO(100, 100, 100, 1),
                                fontSize: 12))),
                  ])),
        ),
        Container(
          padding: EdgeInsets.only(right: 8, top: 25),
          child: Column(children: <Widget>[
            Text(this.remainPoint.toString(),
                style: TextStyle(
                    color: Color.fromRGBO(100, 100, 100, 1), fontSize: 12)),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8.0),
              child: Text(
                changedPoint > 0
                    ? '+ ' + this.changedPoint.toString()
                    : '- ' + this.changedPoint.abs().toString(),
                style: TextStyle(
                    fontSize: 12,
                    color: changedPoint > 0
                        ? Color.fromRGBO(0, 119, 255, 1)
                        : Colors.red),
              ),
            )
          ]),
        )
      ]),
    );
  }
}
