import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/child_heath/check_child_info_dialog.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nested/nested.dart';

class EnterWeightHeight extends StatefulWidget {
  final VoidCallback onDoneEnter;

  const EnterWeightHeight({Key key, this.onDoneEnter}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EnterWeightState();
  }
}

class _EnterWeightState extends BaseState<EnterWeightHeight> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    return ListView(
      padding: SizeUtil.defaultPadding,
      children: <Widget>[
        Text(
          S.of(context).enter_all_value_child,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorUtil.blueLight, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeUtil.defaultSpace,
        ),
        MyTextField(
          textEditingController: _heightController,
          // TODO-Nha: move to arb file
          hint: "Nhập chiều cao của bé",
          suffix: Padding(
            padding: SizeUtil.smallPadding,
            child: Text(
              "(cm)",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorUtil.primaryColor),
            ),
          ),
          borderRadius: 10,
          borderColor: ColorUtil.primaryColor,
          elevation: 2,
        ),
        SizedBox(
          height: SizeUtil.defaultSpace,
        ),
        MyTextField(
          textEditingController: _heightController,
          // TODO-Nha: move to arb file
          hint: "Nhập cân nặng của bé",
          suffix: Padding(
            padding: SizeUtil.smallPadding,
            child: Text(
              // TODO-Nha: move to arb file
              "(kg)",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorUtil.primaryColor),
            ),
          ),
          borderRadius: 10,
          borderColor: ColorUtil.primaryColor,
          elevation: 2,
        ),
        SizedBox(
          height: SizeUtil.defaultSpace,
        ),
        MyTextField(
          textEditingController: _heightController,
          maxLines: 5,
          // TODO-Nha: move to arb file
          hint:
              "Bố/mẹ viết lại những lưu bút tại thời điểm kiểm tra của bé tại đây nhé!",
          borderRadius: 10,
          borderColor: ColorUtil.primaryColor,
          elevation: 2,
        ),
        SizedBox(
          height: SizeUtil.defaultSpace,
        ),
        InkWell(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: ColorUtil.primaryColor, width: 1)),
            child: Padding(
              padding: SizeUtil.smallPadding,
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.camera_alt,
                    color: ColorUtil.primaryColor,
                    size: 100,
                  ),
                  Text(
                    // TODO-Nha: move to arb file
                    "Bấm vào đây",
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontSize: SizeUtil.textSizeSmall),
                  ),
                  Text(
                    // TODO-Nha: move to arb file
                    "Lưu trữ kỷ niệm bạn upload ảnh mới nhất của bé nhé",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorUtil.primaryColor),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
//            //TODO
          },
        )
      ],
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
