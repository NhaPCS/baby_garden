import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

import 'booking_schedule_success_dialogue.dart';

class BookingDialogue extends Dialog {
  final BuildContext context;

  BookingDialogue(this.context);

  @override
  // TODO: implement shape
  ShapeBorder get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      );

  @override
  // TODO: implement child
  Widget get child => Container(
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
                  top: SizeUtil.midSmallSpace, bottom: SizeUtil.midSmallSpace),
              child: Text(
                S.of(context).booking_schedule_verify,
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: SizeUtil.textSizeExpressTitle,
                    fontWeight: FontWeight.bold),
              ),
            ),
            WidgetUtil.getLine(
                margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                color: ColorUtil.lineColor),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: StringUtil.confirmForm
                    .map((e) => Padding(
                        padding: const EdgeInsets.only(
                            left: SizeUtil.smallSpace,
                            right: SizeUtil.smallSpace,
                            top: SizeUtil.tinySpace),
                        child: RichText(
                          text: TextSpan(
                            text: e['title'],
                            style: TextStyle(
                                color: ColorUtil.textColor,
                                fontSize: SizeUtil.textSizeSmall,
                                fontWeight: FontWeight.bold),
                            children: StringUtil.confirmForm.indexOf(e) != 1
                                ? <TextSpan>[
                                    TextSpan(
                                      text: e['content'],
                                      style: TextStyle(
                                          color: ColorUtil.blueLight,
                                          fontSize: SizeUtil.textSizeSmall,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ]
                                : <TextSpan>[
                                    TextSpan(
                                      text: e['value'],
                                      style: TextStyle(
                                          color: ColorUtil.red,
                                          fontSize: SizeUtil.textSizeSmall),
                                    ),
                                    TextSpan(
                                        text: e['content'],
                                        style: TextStyle(
                                          color: ColorUtil.textColor,
                                          fontSize: SizeUtil.textSizeSmall,
                                          fontWeight: FontWeight.normal,
                                        ))
                                  ],
                          ),
                        )))
                    .toList()),
            SizedBox(
              height: SizeUtil.smallSpace,
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
                  color: ColorUtil.blue,
                  child: Text(
                    S.of(context).back,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: SizeUtil.smallSpace,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            BookingScheduleSuccessDialogue(context));
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
}
