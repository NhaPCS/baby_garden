import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/remind_add/remind_add_screen.dart';
import 'package:baby_garden_flutter/screen/remind_edit/remind_edit_screen.dart';
import 'package:baby_garden_flutter/screen/remind_management/provider/remind_calendar_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemindCardItem extends StatelessWidget {
  final RemindCalendar calendar;
  final VoidCallback onEdit;
  final RemindCalendarProvider remindCalendarProvider;

  RemindCardItem(
      {Key key, this.calendar, this.onEdit, this.remindCalendarProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _validURL =
        calendar.image != null ? Uri.parse(calendar.image).isAbsolute : false;
    return Container(
      padding: const EdgeInsets.all(
        SizeUtil.midSmallSpace,
      ),
      decoration: setBorder('bottom', ColorUtil.lineLightGray, 1),
      width: double.infinity,
      child: Row(children: <Widget>[
        _validURL
            ? CircleImage(
                elevation: 0,
                width: 76.0,
                height: 76.0,
                borderRadius: 0,
                imageUrl: calendar.image)
            : SizedBox(
                width: 76.0,
                height: 76.0,
              ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(
                SizeUtil.midSmallSpace,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeExpressDetail,
                                color: Colors.black),
                            children: getRemindTypeSpans(context))),
                    Padding(
                      padding: const EdgeInsets.only(top: SizeUtil.tinySpace),
                      child: Text(
                        StringUtil.getPriceText(calendar.price),
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: SizeUtil.textSizeBigger,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    getTextTimes()
                  ])),
        ),
        Column(
          children: <Widget>[
            ButtonIcon(
              icon: Icon(Icons.delete,
                  size: SizeUtil.iconMidSize, color: ColorUtil.darkGray),
              onPressed: () {
                //remove reminder
                WidgetUtil.showConfirmDialog(context,
                    title: S.of(context).confirm,
                    message: S.of(context).mess_confirm_delete_calendar,
                    positive: S.of(context).yes, positiveClicked: () {
                  remindCalendarProvider.deleteCalendar(context, calendar.id);
                });
              },
            ),
            ButtonIcon(
              icon: Icon(
                Icons.edit,
                size: SizeUtil.iconMidSize,
                color: ColorUtil.darkGray,
              ),
              onPressed: () {
                onEdit();
              },
            )
          ],
        ),
        SizedBox(
          width: SizeUtil.midSmallSpace,
        )
      ]),
    );
  }

  Widget getTextTimes() {
    String time = '';
    if (calendar.time1 != null && calendar.time1 != '00:00:00') {
      time = '${time} | ${calendar.time1}';
    }
    if (calendar.time2 != null && calendar.time2 != '00:00:00') {
      time = '${time} | ${calendar.time2}';
    }
    if (calendar.time3 != null && calendar.time3 != '00:00:00') {
      time = '${time} | ${calendar.time3}';
    }
    if (calendar.time4 != null && calendar.time4 != '00:00:00') {
      time = '${time} | ${calendar.time4}';
    }
    switch (calendar.type) {
      case RemindType.remindBuy:
        return Padding(
          padding: const EdgeInsets.only(top: SizeUtil.tinySpace),
          child: Row(children: [
            Icon(
              Icons.alarm,
              color: Colors.orange,
              size: SizeUtil.iconMidSize,
            ),
            Padding(
              padding: const EdgeInsets.only(left: SizeUtil.midSmallSpace),
              child: Text(calendar.dateStart,
                  style: TextStyle(
                      color: ColorUtil.grayLine,
                      fontSize: SizeUtil.textSizeSmall)),
            ),
          ]),
        );
      case RemindType.remindUse:
        return Padding(
          padding: const EdgeInsets.only(top: SizeUtil.tinySpace),
          child: Row(children: [
            Icon(
              Icons.alarm,
              color: Colors.orange,
              size: SizeUtil.iconMidSize,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: SizeUtil.midSmallSpace),
              child: Text("${calendar.dateEnd} ${time}",
                  style: TextStyle(
                      color: ColorUtil.grayLine,
                      fontSize: SizeUtil.textSizeSmall)),
            )),
          ], crossAxisAlignment: CrossAxisAlignment.start,),
        );
        break;
      case RemindType.all:
        return Padding(
          padding: const EdgeInsets.only(top: SizeUtil.tinySpace),
          child: Row(children: [
            Icon(
              Icons.alarm,
              color: Colors.orange,
              size: SizeUtil.iconMidSize,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: SizeUtil.midSmallSpace),
              child: Text("Mua: ${calendar.dateStart}\nSử dụng: ${calendar.dateEnd} ${time}",
                  style: TextStyle(
                      color: ColorUtil.grayLine,
                      fontSize: SizeUtil.textSizeSmall)),
            )),
          ], crossAxisAlignment: CrossAxisAlignment.start,),
        );
        break;
    }
  }

  List<TextSpan> getRemindTypeSpans(BuildContext context) {
    switch (calendar.type) {
      case RemindType.remindBuy:
        return [
          TextSpan(
              text: "[${S.of(context).remindBuy}] ".toUpperCase(),
              style: TextStyle(color: Colors.orange)),
          TextSpan(text: calendar.productName)
        ];
      case RemindType.remindUse:
        return [
          TextSpan(
              text: "[${S.of(context).remindUse}] ".toUpperCase(),
              style: TextStyle(color: Colors.blue)),
          TextSpan(text: calendar.productName)
        ];
      case RemindType.all:
        return [
          TextSpan(
              text: "[${S.of(context).remindBuy}] ".toUpperCase(),
              style: TextStyle(color: Colors.orange)),
          TextSpan(
              text: "[${S.of(context).remindUse}] ".toUpperCase(),
              style: TextStyle(color: Colors.blue)),
          TextSpan(text: calendar.productName)
        ];
    }
    return [];
  }
}
