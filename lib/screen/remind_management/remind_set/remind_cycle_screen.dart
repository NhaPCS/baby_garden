import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class RemindCycleScreen extends StatefulWidget {
  @override
  _RemindCycleScreenState createState() => _RemindCycleScreenState();
}

class _RemindCycleScreenState extends BaseState<RemindCycleScreen> {
  final GetListProvider _getListProvider = GetListProvider();
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 18, bottom: 18),
                  child: Text(
                    'chọn chu kì nhắc',
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )),
            Expanded(
                child: Container(
              decoration: setBorder('top', Color(0xffE4E4E4), 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
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
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
