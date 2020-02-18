import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemBigCategory extends StatelessWidget {
  final bool isSelected;

  const ItemBigCategory({Key key, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Provider.of<AppProvider>(context).bigCategoryHeight,
      width: Provider.of<AppProvider>(context).bigCategoryWidth,
      padding: EdgeInsets.only(
          top: SizeUtil.smallSpace, bottom: SizeUtil.smallSpace),
      child: Column(
        children: <Widget>[
          Expanded(
              child: AspectRatio(
            child: Container(
              height: double.infinity,
              padding: SizeUtil.smallPadding,
              child: Image.asset('photo/ic_toy.png'),
              decoration: BoxDecoration(
                  color: ColorUtil.lightGray,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: isSelected
                          ? ColorUtil.primaryColor
                          : ColorUtil.lightGray,
                      width: isSelected ? 2 : 0)),
            ),
            aspectRatio: 1,
          )),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: SizeUtil.smallSpace,
              right: SizeUtil.smallSpace,
            ),
            child: Text(
              "Thời trang nam",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeUtil.textSizeSmall,
                  color: isSelected
                      ? ColorUtil.primaryColor
                      : ColorUtil.textColor),
            ),
          )
        ],
      ),
    );
  }
}
