import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/change_quantity_widget.dart';
import 'package:baby_garden_flutter/widget/chip_tag.dart';
import 'package:baby_garden_flutter/widget/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemProductHorizontal extends StatelessWidget {
  final bool isAttach;

  const ItemProductHorizontal({Key key, this.isAttach = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isAttach
                ? CircleCheckbox(
                    padding: SizeUtil.tinyPadding,
                    color: ColorUtil.textGray,
                    checkBg: Icons.check_box,
                    uncheckBg: Icons.crop_square,
                  )
                : SizedBox(
                    width: SizeUtil.smallSpace,
                  ),
            CircleImage(
              imageUrl: StringUtil.dummyImage,
              borderRadius: SizeUtil.smallRadius,
              width: Provider.of<AppProvider>(context).productCartWidth,
              height: Provider.of<AppProvider>(context).productCartHeight,
            ),
            SizedBox(
              width: SizeUtil.smallSpace,
            ),
            Expanded(
                child: Column(
              children: <Widget>[
                Text(
                  "Giày thời trang trẻ em style Hàn Quốc",
                  style: TextStyle(
                      color: ColorUtil.textGray, fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "800.000 đ",
                      style: TextStyle(
                          color: ColorUtil.red, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: SizeUtil.smallSpace,
                    ),
                    Text(
                      "800.000 đ",
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(S.of(context).product_count),
                    ChangeQuantityWidget(
                      textColor: ColorUtil.primaryColor,
                    )
                  ],
                )
              ],
            )),
          ],
        ),
        WidgetUtil.getLine(
          width: 2,
        ),
        WidgetUtil.paddingWidget(Text(
          S.of(context).size,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        WidgetUtil.paddingWidget(Wrap(
          children: List.generate(10, (index) {
            return ChipTag(
              text: "Size ${index + 1}",
              borderRadius: SizeUtil.tinyRadius,
              fillColor: ColorUtil.lightGray,
              borderColor: ColorUtil.lightGray,
              selectedBorderColor: ColorUtil.primaryColor,
              hasCheckable: true,
            );
          }),
        )),
        WidgetUtil.paddingWidget(Text(
          S.of(context).color,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        WidgetUtil.paddingWidget(Wrap(
          children: List.generate(10, (index) {
            return ChipTag(
              text: "Đỏ",
              borderRadius: SizeUtil.tinyRadius,
              fillColor: ColorUtil.lightGray,
              borderColor: ColorUtil.lightGray,
              selectedBorderColor: ColorUtil.primaryColor,
              hasCheckable: true,
            );
          }),
        )),
        WidgetUtil.getLine(width: 3)
      ],
    );
  }
}
