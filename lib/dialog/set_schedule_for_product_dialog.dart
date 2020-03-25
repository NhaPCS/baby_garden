import 'package:baby_garden_flutter/screen/remind_management/reminder_layout.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/material.dart';

class SetScheduleForProductDialog extends StatelessWidget {
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
          "Set lịch nhắc sản phẩm",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: SizeUtil.textSizeDefault),
        ),
      ),
      content: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: SizeUtil.smallPadding,
            child: Text(
              "Sữa bột Glico Nhật Bản số 0-1 dành cho trẻ từ sơ sinh đến 1 tuổi",
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
                text: "Nhập lại",
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
                text: "Đồng ý",
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
