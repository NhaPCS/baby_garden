import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/child_heath/provider/get_list_baby_provider.dart';
import 'package:baby_garden_flutter/screen/child_heath/widget/select_child_dropdow.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChildHeader extends StatelessWidget {
  final bool isBoy;
  final ValueNotifier<dynamic> dropdownController;
  final String selectedChildId;
  final ValueChanged<dynamic> onChangeChild;

  const ChildHeader(
      {Key key,
      this.isBoy,
      this.dropdownController,
      this.selectedChildId,
      this.onChangeChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: SizeUtil.defaultSpace,
            ),
            Expanded(
                child: Column(
              children: <Widget>[
                SvgIcon(
                  isBoy ? 'boy.svg' : 'girl.svg',
                  width: SizeUtil.iconSizeLarge,
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Text(
                  isBoy ? S.of(context).boy : S.of(context).girl,
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
            SizedBox(
              width: SizeUtil.defaultSpace,
            ),
            Center(
              child: CircleImage(
                width: 100,
                height: 100,
                imageUrl: dropdownController.value == null
                    ? ''
                    : dropdownController.value['avatar'],
                borderRadius: SizeUtil.smallRadius,
              ),
            ),
            SizedBox(
              width: SizeUtil.defaultSpace,
            ),
            Expanded(
                child: Column(
              children: <Widget>[
                SvgIcon(
                  isBoy ? "birthday_cake_boy.svg" : 'birthday_cake.svg',
                  width: SizeUtil.iconSizeLarge,
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                MyText(
                  dropdownController.value == null
                      ? ''
                      : dropdownController.value['birthday'],
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
            SizedBox(
              width: SizeUtil.defaultSpace,
            ),
          ],
        ),
        Consumer<GetListBabyProvider>(
          builder:
              (BuildContext context, GetListBabyProvider value, Widget child) {
            if (value.babies == null || value.babies.isEmpty) {
              return SizedBox();
            }
            return SelectChildDropDown(
              babies: value.babies,
              controller: dropdownController,
              selectedId: selectedChildId,
              onChangeChild: onChangeChild,
            );
          },
        )
      ],
    );
  }
}
