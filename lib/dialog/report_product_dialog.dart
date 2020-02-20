import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/chip_tag.dart';
import 'package:baby_garden_flutter/widget/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportProductDialog extends AlertDialog {
  final BuildContext context;

  ReportProductDialog(this.context);

  @override
  EdgeInsetsGeometry get titlePadding => EdgeInsets.all(0);

  @override
  EdgeInsetsGeometry get contentPadding => EdgeInsets.only(
      left: SizeUtil.smallSpace,
      right: SizeUtil.smallSpace,
      bottom: SizeUtil.smallSpace);

  @override
  ShapeBorder get shape => RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(SizeUtil.smallRadius)));

  @override
  Widget get title => Container(
        padding: SizeUtil.smallPadding,
        decoration: BoxDecoration(
            color: ColorUtil.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeUtil.smallRadius),
                topRight: Radius.circular(SizeUtil.smallRadius))),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            BaseState.getLeading(context),
            Center(
              child: Text(
                S.of(context).send_report,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );

  @override
  Widget get content => Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            Text(
              S.of(context).report_desc,
              style: TextStyle(
                  color: ColorUtil.textGray, fontSize: SizeUtil.textSizeSmall),
            ),
            SizedBox(
              height: SizeUtil.defaultSpace,
            ),
            Text(
              S.of(context).report_title,
              style: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontSize: SizeUtil.textSizeBigger,
                  fontWeight: FontWeight.bold),
            ),
            Wrap(
              children: List.generate(
                  4,
                  (index) => ChipTag(
                        text: "Hình ảnh vi phạm",
                        fillColor: Colors.transparent,
                        borderColor: ColorUtil.textGray,
                        borderRadius: SizeUtil.smallRadius,
                        removable: false,
                      )),
            ),
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            Center(
              child: CircleCheckbox(
                checkBg: Icons.check_circle,
                uncheckBg: Icons.panorama_fish_eye,
                color: ColorUtil.textGray,
                activeColor: ColorUtil.primaryColor,
                size: SizeUtil.iconSizeBigger,
                text: Text(S.of(context).choose_other),
              ),
            ),
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            MyTextField(
              textEditingController: null,
              borderRadius: SizeUtil.smallRadius,
              borderColor: ColorUtil.textGray,
              hint: S.of(context).report_title_hint,
              textStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
            ),
            SizedBox(
              height: SizeUtil.defaultSpace,
            ),
            Stack(
              children: <Widget>[
                MyTextField(
                  textEditingController: null,
                  borderRadius: SizeUtil.smallRadius,
                  maxLines: 5,
                  inputType: TextInputType.multiline,
                  borderColor: ColorUtil.textGray,
                  hint: S.of(context).report_title_hint,
                  textStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                ),
                Positioned(
                  child: ButtonIcon(
                    icon: SvgIcon('ic_camera.svg'),
                  ),
                  right: SizeUtil.tinySpace,
                  bottom: SizeUtil.tinySpace,
                )
              ],
            ),
            SizedBox(
              height: SizeUtil.defaultSpace,
            ),
            Center(
              child: MyRaisedButton(
                onPressed: () {
                  //TODO
                  Navigator.of(context).pop();
                },
                text: S.of(context).send,
                color: ColorUtil.primaryColor,
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                padding: EdgeInsets.only(
                    left: SizeUtil.hugSpace,
                    right: SizeUtil.hugSpace,
                    top: SizeUtil.smallSpace,
                    bottom: SizeUtil.smallSpace),
              ),
            )
          ],
        ),
      );
}
