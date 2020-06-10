import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointCheckoutDialogue extends StatelessWidget {
  final int point;
  final int currentCheckoutPoint;
  final int totalPrice;

  const PointCheckoutDialogue(
      {this.point = 0, this.currentCheckoutPoint = 0, this.totalPrice = 0})
      : super();

  @override
  Widget build(BuildContext context) {
    int pointCheckout = 0;
    // TODO: implement build
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: StatefulBuilder(
          //TODO update radio and tabcontroller state
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                border: Border.all(
                  color: ColorUtil.primaryColor,
                  width: 0.7,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: SizeUtil.midSmallSpace,
                        bottom: SizeUtil.midSmallSpace),
                    child: Text(
                      S.of(context).point_payment_title,
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontSize: SizeUtil.textSizeExpressTitle,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  WidgetUtil.getLine(
                      margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                      color: ColorUtil.lineColor),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.tinySpace, top: SizeUtil.tinySpace),
                    child: Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: S.of(context).current_point,
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeSmall,
                                    color: ColorUtil.textColor,
                                    fontWeight: FontWeight.normal)),
                            TextSpan(
                                text: S.of(context).numPoint(point),
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeSmall,
                                    color: ColorUtil.primaryColor,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        ),
                        Icon(
                          Icons.cached,
                          size: SizeUtil.iconSize,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.tinySpace, top: SizeUtil.smallSpace),
                    child: Row(
                      children: <Widget>[
                        Text(S.of(context).point_for_booking,
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: ColorUtil.textColor)),
                        Container(
                          width: 45,
                          height: 20,
                          child: TextField(
                            onChanged: (val) {
                              if (val.length > 0) {
                                pointCheckout = int.parse(val);
                              } else {
                                pointCheckout = 0;
                              }
                            },
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: ColorUtil.primaryColor,
                                fontWeight: FontWeight.bold),
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                hintText: currentCheckoutPoint.toString(),
                                contentPadding:
                                    EdgeInsets.all(SizeUtil.superTinySpace)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, top: SizeUtil.smallSpace),
                    child: Text(
                      S.of(context).point_payment_policy,
                      style: TextStyle(
                          color: Colors.blue, fontSize: SizeUtil.textSizeSmall),
                    ),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(SizeUtil.smallRadius),
                        )),
                        color: ColorUtil.primaryColor,
                        child: Text(
                          S.of(context).cancel,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: SizeUtil.defaultSpace,
                      ),
                      RaisedButton(
                        onPressed: () {
                          print(" show dialogue $pointCheckout $point asd as $totalPrice");
                          if (pointCheckout > point ) {
                            WidgetUtil.showMessageDialog(context,
                                message: S.of(context).point_checkout_alert,
                                title: S.of(context).notify);
                          } else if (pointCheckout % 20 != 0 ) {
                            WidgetUtil.showMessageDialog(context,
                                message: S.of(context).point_checkout_alert_1,
                                title: S.of(context).notify);
                          } else if (pointCheckout * 1000 >= totalPrice) {
                            WidgetUtil.showMessageDialog(context,
                                message: S.of(context).point_checkout_alert_2,
                                title: S.of(context).notify);
                          } else {
                            Navigator.of(context).pop(pointCheckout);
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(SizeUtil.smallRadius),
                        )),
                        color: ColorUtil.primaryColor,
                        child: Text(
                          S.of(context).confirm,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }
}
