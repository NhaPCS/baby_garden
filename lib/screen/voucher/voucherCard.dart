import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoucherCard extends StatelessWidget {
  final image;
  final description;
  final partner;

  VoucherCard({Key key, this.image, this.description, this.partner})
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
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          this.description,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(this.partner,
                              style: TextStyle(
                                  color: Color.fromRGBO(8, 105, 145, 1),
                                  fontWeight: FontWeight.bold))),
                    ])),
          ),
        ]),
      ),
    );
  }
}
