import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointCheckoutDialogue extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
                border: Border(
                  left: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  right: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  top: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  bottom: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
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
                                text: " 200 điểm",
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
                            onChanged: (string) {
//                              setState(() => {
//                                isUpdatePointCheckout == false
//                                    ? isUpdatePointCheckout = true
//                                    : print("nothing")
//                              });
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
                                hintText: "100",
                                hintStyle: TextStyle(
                                    fontSize: SizeUtil.textSizeSmall,
                                    color: ColorUtil.primaryColor,
                                    fontWeight: FontWeight.bold),
                                contentPadding: EdgeInsets.only(
                                    left: 2, right: 2, top: 2, bottom: 2)),
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
//                  isUpdatePointCheckout
//                      ?
//                  Center(
//                    child: RaisedButton(
//                      onPressed: () {
////                        setState(() => {isUpdatePointCheckout = false});
//                      },
//                      shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.all(
//                            Radius.circular(SizeUtil.smallRadius),
//                          )),
//                      color: ColorUtil.primaryColor,
//                      child: Text(
//                        S.of(context).update,
//                        style: TextStyle(
//                            fontSize: SizeUtil.textSizeSmall,
//                            color: Colors.white,
//                            fontStyle: FontStyle.normal,
//                            fontWeight: FontWeight.bold),
//                      ),
//                    ),
//                  )
//                      :
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
                          Navigator.of(context).pop();
//                      showBookingScheduleSuccess(context);
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