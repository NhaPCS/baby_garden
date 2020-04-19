import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

// TODO-QAnh:screen đặt ở folder riêng, khong de chung trong 1 folder
class RemindCycleScreen extends StatefulWidget {
  @override
  _RemindCycleScreenState createState() => _RemindCycleScreenState();
}

class _RemindCycleScreenState extends BaseState<RemindCycleScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).selectRemindTime),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 8),
                width: double.infinity,
                decoration: setBorder('top', Color(0xffE1D9D9), 1),
                // TODO-QAnh: trong Container co padding roi, bo Padding nay di
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 18, bottom: 18),
                  child: Text(
                    S.of(context).selectRemindCycle,
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )),
            Expanded(
                child: Container(
              decoration: setBorder('top', Color(0xffE4E4E4), 6),
                  // TODO-QAnh: bỏ cái Column này đi, move lên Column trên, k để lồng nhau
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      // TODO-QAnh: dung CircleCheckBox
                      Checkbox(
                          value: true,
                          onChanged: (bool value) {
                            setState(() {
                              // this.checkDefaultAdd = !this.checkDefaultAdd;
                            });
                          }),
                      Text('01 ( 1 ngày nhắc / 1 chu kỳ )')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // TODO-QAnh: dung CircleCheckBox
                      Checkbox(
                          value: false,
                          onChanged: (bool value) {
                            setState(() {
                              // this.checkDefaultAdd = !this.checkDefaultAdd;
                            });
                          }),
                      Text('02 ( 2 ngày nhắc / 1 chu kỳ )')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // TODO-QAnh: dung CircleCheckBox
                      Checkbox(
                          value: false,
                          onChanged: (bool value) {
                            setState(() {
                              // this.checkDefaultAdd = !this.checkDefaultAdd;
                            });
                          }),
                      Text('03 ( 3 ngày nhắc / 1 chu kỳ )')
                    ],
                  ),
                  Padding(
                    padding: SizeUtil.normalPadding,
                    child: Text(
                      'Tùy chọn khác',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: SizeUtil.normalPadding,
                    child: MyTextField(
                      hint: 'Nhập số ngày nhắc mong muốn/ 1 lần =/1 kỳ',
                      hintStyle:
                          TextStyle(fontSize: 14, color: ColorUtil.darkGray),
                      textEditingController: null,
                      borderColor: ColorUtil.darkGray,
                      borderRadius: 8,
                    ),
                  )
                ],
              ),
            )),
            // TODO-QAnh: button thi dung MyRaisedButton
            GestureDetector(
              child: Container(
                margin: SizeUtil.normalPadding,
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: ColorUtil.primaryColor,
                    borderRadius: BorderRadius.circular(SizeUtil.tinyRadius)),
                child: Center(
                  child: Text(
                    S.of(context).confirm,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeBigger,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
