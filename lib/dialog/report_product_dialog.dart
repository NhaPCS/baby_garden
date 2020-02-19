import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button_icon.dart';
import 'package:baby_garden_flutter/widget/chip_tag.dart';
import 'package:baby_garden_flutter/widget/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportProductDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: SizeUtil.bigPadding,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBar(
              leading: BaseState.getLeading(context),
              title: Text(
                S.of(context).send_report,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: SizeUtil.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    S.of(context).report_desc,
                    style: TextStyle(
                        color: ColorUtil.textGray,
                        fontSize: SizeUtil.textSizeSmall),
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
                  CircleCheckbox(
                    checkBg: Icons.check_circle,
                    uncheckBg: Icons.panorama_fish_eye,
                    color: ColorUtil.textGray,
                    size: SizeUtil.iconSizeBigger,
                    text: Text(S.of(context).choose_other),
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
                        textStyle:
                            TextStyle(fontSize: SizeUtil.textSizeDefault),
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
                  SizedBox(height: SizeUtil.defaultSpace,),
                  Center(
                    child: MyRaisedButton(
                      onPressed: () {
                        //TODO
                        Navigator.of(context).pop();
                      },
                      text: S.of(context).send,
                      color: ColorUtil.primaryColor,
                      textStyle: TextStyle(color: Colors.white),
                      padding: EdgeInsets.only(
                          left: SizeUtil.bigSpace,
                          right: SizeUtil.bigSpace,
                          top: SizeUtil.smallSpace,
                          bottom: SizeUtil.smallSpace),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
