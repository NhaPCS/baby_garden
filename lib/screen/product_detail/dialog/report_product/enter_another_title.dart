import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/material.dart';

class EnterAnotherTitle extends StatefulWidget {
  final TextEditingController anotherTitleController;

  const EnterAnotherTitle({Key key, this.anotherTitleController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EnterAnotherTitleState();
  }
}

class _EnterAnotherTitleState extends State<EnterAnotherTitle> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: CircleCheckbox(
            checkBg: Icons.check_circle,
            uncheckBg: Icons.panorama_fish_eye,
            color: ColorUtil.textGray,
            activeColor: ColorUtil.primaryColor,
            size: SizeUtil.iconSize,
            text: Text(S.of(context).choose_other),
            onChanged: (b) {
              setState(() {
                checked = b;
              });
            },
          ),
          alignment: Alignment.centerLeft,
        ),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        MyTextField(
          textEditingController: widget.anotherTitleController,
          borderRadius: SizeUtil.smallRadius,
          borderColor: ColorUtil.textGray,
          hint: S.of(context).report_title_hint,
          textStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
          enable: checked,
        )
      ],
    );
  }
}
