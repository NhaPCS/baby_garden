import 'package:baby_garden_flutter/generated/l10n.dart';
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
      decoration: setBorder('bottom', Color.fromRGBO(197, 193, 193, 1), 1),
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
                      RichText(
                          text: TextSpan(
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                              children: <TextSpan>[
                            TextSpan(
                                text: this.remindType == RemindType.remindBuy
                                    ? "[${S.of(context).remindBuy}] "
                                        .toUpperCase()
                                    : "[${S.of(context).remindUse}] "
                                        .toUpperCase(),
                                style: TextStyle(
                                    color:
                                        this.remindType == RemindType.remindBuy
                                            ? Colors.blue
                                            : Colors.orange)),
                            TextSpan(
                                text: this.description,
                                style: TextStyle(fontSize: 13))
                          ])),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          this.price,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(children: [
                          Icon(
                            Icons.alarm,
                            color: Colors.orange,
                            size: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(this.datetime,
                                style: TextStyle(
                                    color: Color.fromRGBO(100, 100, 100, 1),
                                    fontSize: 12)),
                          ),
                        ]),
                      )
                    ])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36, right: 8.0),
            child: Column(
              children: <Widget>[
                Icon(Icons.delete,
                    size: 19, color: Color.fromRGBO(112, 112, 112, 1)),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Icon(
                    Icons.edit,
                    size: 19,
                    color: Color.fromRGBO(112, 112, 112, 1),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

enum RemindType { remindBuy, remindUse }
