import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/remind_management/widget/reminder_layout.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';

class SetScheduleForProductDialog extends StatelessWidget {
  final dynamic product;

  const SetScheduleForProductDialog({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      contentPadding: EdgeInsets.all(0),
      titlePadding: EdgeInsets.all(0),
      title: Container(
        decoration: BoxDecoration(
            color: ColorUtil.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        padding: SizeUtil.smallPadding,
        child: Text(
          S.of(context).set_schedule_alarm_product,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: SizeUtil.textSizeDefault),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: SizeUtil.smallPadding,
            child: MyText(
              product['product_name'],
              textAlign: TextAlign.left,
              style: TextStyle(color: ColorUtil.blue, fontSize: SizeUtil.textSizeDefault),
            ),
          ),
          ReminderLayout(
            showDesc: false,
            hasDivider: true,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyRaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).enter_again,
                borderRadius: 30,
                color: ColorUtil.primaryColor,
                textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: SizeUtil.defaultSpace,
              ),
              MyRaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).agree,
                color: ColorUtil.primaryColor,
                textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                borderRadius: 30,
              )
            ],
          ),
          SizedBox(height: SizeUtil.smallSpace,)
        ],
      ),
    );
  }
}
