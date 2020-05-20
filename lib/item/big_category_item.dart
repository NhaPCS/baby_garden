import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BigCategoryItem extends StatelessWidget {
  final bool isSelected;
  final dynamic category;

  const BigCategoryItem({Key key, this.isSelected = false, this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Provider.of<AppProvider>(context).bigCategoryHeight,
      width: Provider.of<AppProvider>(context).bigCategoryWidth,
      padding: EdgeInsets.only(
          top: SizeUtil.smallSpace, bottom: SizeUtil.smallSpace),
      child: Column(
        children: <Widget>[
          Container(
            child: CircleImage(
              imageUrl: category['img'],
              width: 50,
              height: 50,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: isSelected ? ColorUtil.primaryColor : ColorUtil.lightGray,
            ),
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.only(
              left: SizeUtil.smallSpace,
              right: SizeUtil.smallSpace,
            ),
            child: AutoSizeText(
              category['name'],
              minFontSize: SizeUtil.textSizeMini,
              maxFontSize: SizeUtil.textSizeSmall,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeUtil.textSizeSmall,
                  color: isSelected
                      ? ColorUtil.primaryColor
                      : ColorUtil.textColor),
            ),
          ))
        ],
      ),
    );
  }
}
