import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoucherCard extends StatelessWidget {
  final image;
  final description;
  final partner;
  final timeRemain;
  final context;

  VoucherCard(
      {Key key,
      this.image,
      this.description,
      this.partner,
      this.timeRemain,
      this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeUtil.midSmallSpace,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Color.fromRGBO(0, 0, 0, 0.16),
            offset: Offset(0.0, 3.0),
          )
        ],
      ),
      width: double.infinity,
      height: 90,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(112, 112, 112, 1), width: 0.1),
          borderRadius: BorderRadius.circular(0),
        ),
        margin: EdgeInsets.only(top: 0),
        child: Row(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    offset: Offset(-3.0, 3.0),
                  )
                ],
                border: Border.all(
                    color: Color.fromRGBO(112, 112, 112, 1), width: 0.3)),
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                this.image,
                width: 55.0,
                height: 55.0,
              ),
            ),
          ),
          Expanded(
            child: Container(
                height: 90,
                padding: EdgeInsets.only(top: 5, left: 35),
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
                          child: Row(children: <Widget>[
                            Text(S.of(this.context).partner + ': ',
                                style: TextStyle(
                                    color: Color.fromRGBO(8, 105, 145, 1),
                                    fontWeight: FontWeight.bold)),
                            Text(this.partner,
                                style: TextStyle(
                                  color: Color.fromRGBO(8, 105, 145, 1),
                                ))
                          ])),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          timeRemain != null ? this.timeRemain : '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      )
                    ])),
          ),
        ]),
      ),
    );
  }
}
