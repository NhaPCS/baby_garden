import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/remind_edit/remind_edit_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemindCardItem extends StatelessWidget {
  final RemindCalendar calendar;

  RemindCardItem({Key key, this.calendar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: setBorder('bottom', ColorUtil.lineLightGray, 1),
      width: double.infinity,
      child: Row(children: <Widget>[
        ClipRRect(
          child: Image.asset(
            calendar.image,
            width: 76.0,
            height: 76.0,
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(SizeUtil.midSmallSpace),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeDefault,
                                color: Colors.black),
                            children: <TextSpan>[
                          TextSpan(
                              text: calendar.type == RemindType.remindBuy
                                  ? "[${S.of(context).remindBuy}] "
                                      .toUpperCase()
                                  : "[${S.of(context).remindUse}] "
                                      .toUpperCase(),
                              style: TextStyle(
                                  fontSize: 13,
                                  color: calendar.type == RemindType.remindBuy
                                      ? Colors.blue
                                      : Colors.orange)),
                          TextSpan(
                              text: calendar.description,
                              style: TextStyle(fontSize: 13))
                        ])),
                    Padding(
                      padding: const EdgeInsets.only(top: SizeUtil.tinySpace),
                      child: Text(
                        calendar.price,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: SizeUtil.textSizeBigger,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: SizeUtil.tinySpace),
                      child: Row(children: [
                        Icon(
                          Icons.alarm,
                          color: Colors.orange,
                          size: SizeUtil.iconMidSize,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: SizeUtil.midSmallSpace),
                          child: Text(calendar.datetime,
                              style: TextStyle(
                                  color: ColorUtil.grayLine,
                                  fontSize: SizeUtil.textSizeSmall)),
                        ),
                      ]),
                    )
                  ])),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 36, right: SizeUtil.midSmallSpace),
          child: Column(
            children: <Widget>[
              ButtonIcon(
                icon: Icon(Icons.delete,
                    size: SizeUtil.iconMidSize, color: ColorUtil.darkGray),
                onPressed: () {
                  //remove reminder
                },
              ),
              ButtonIcon(
                icon: Icon(
                  Icons.edit,
                  size: SizeUtil.iconMidSize,
                  color: ColorUtil.darkGray,
                ),
                onPressed: () {
                  RouteUtil.push(context, RemindEditScreen(calendar: calendar));
                },
              )
            ],
          ),
        )
      ]),
    );
  }
}
