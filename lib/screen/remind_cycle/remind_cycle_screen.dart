import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class RemindCycleScreen extends StatefulWidget {
  @override
  _RemindCycleScreenState createState() => _RemindCycleScreenState();
}

class _RemindCycleScreenState extends BaseState<RemindCycleScreen> {
  final TextEditingController _cycleTextFieldCtrl = TextEditingController();
  final ValueNotifier<int> _periodProvider = ValueNotifier(1);

  bool check1 = false;
  bool check2 = false;
  bool check3 = false;

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).selectRemindTime),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: SizeUtil.midSmallSpace),
                    padding: SizeUtil.normalPadding,
                    width: double.infinity,
                    decoration: setBorder('top', Color(0xffE1D9D9), 1),
                    child: Text(
                      S.of(context).selectRemindCycle,
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeUtil.textSizeBigger),
                    ),
                  ),
                  WidgetUtil.getLine(color: Color(0xffE4E4E4), width: 6),
                  _remindCycle(S.of(context).remindCycle1, 1),
                  _remindCycle(S.of(context).remindCycle2, 2),
                  _remindCycle(S.of(context).remindCycle3, 3),
                  Padding(
                    padding: SizeUtil.normalPadding,
                    child: Text(
                      S.of(context).remindOtherOption,
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeBigger,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: SizeUtil.normalPadding,
                    child: MyTextField(
                      inputType: TextInputType.number,
                      padding: SizeUtil.normalPadding,
                      hint: S.of(context).remindOtherOptionHint,
                      hintStyle: TextStyle(
                          fontSize: SizeUtil.textSizeExpressTitle,
                          color: ColorUtil.darkGray),
                      textEditingController: _cycleTextFieldCtrl,
                      borderColor: ColorUtil.darkGray,
                      borderRadius: 8,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: SizeUtil.normalPadding,
              child: MyRaisedButton(
                  padding: SizeUtil.smallPadding,
                  text: S.of(context).confirm,
                  textStyle: TextStyle(
                      fontSize: SizeUtil.textSizeBigger,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  color: ColorUtil.primaryColor,
                  borderRadius: SizeUtil.tinyRadius,
                  matchParent: true,
                  onPressed: () {
                    if (_cycleTextFieldCtrl.text.length > 0) {
                      if (!WidgetUtil.isNumeric(_cycleTextFieldCtrl.text)) {
                        WidgetUtil.showErrorDialog(
                            context, 'Vui lòng nhập số ngày là một số nguyên.',
                            onOkClick: () => _cycleTextFieldCtrl.text = '');
                        return;
                      }
                      _periodProvider.value =
                          int.parse(_cycleTextFieldCtrl.text);
                    }

                    Navigator.of(context).pop(_periodProvider.value);
                  }),
            ),
          ],
        ));
  }

  Widget _remindCycle(String label, int cycle) {
    return ValueListenableBuilder<int>(
      valueListenable: _periodProvider,
      builder: (BuildContext context, int value, Widget child) {
        return Row(
          children: <Widget>[
            Radio(
              onChanged: (val) {
                _periodProvider.value = val;
              },
              groupValue: value,
              value: cycle,
              activeColor: ColorUtil.primaryColor,
            ),
            Text(
              label,
            ),
          ],
        );
      },
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return null;
  }
}
