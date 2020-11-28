import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
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
      width: Provider.of<AppProvider>(context).bigCategoryWidth,
      height: Provider.of<AppProvider>(context).bigCategoryHeight,
      padding: EdgeInsets.only(
          top: SizeUtil.smallSpace,
          bottom: SizeUtil.tinySpace,
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace),
      child: Column(
        children: <Widget>[
          Container(
            child: CircleImage(
              imageUrl: category['img'],
              width: 70,
              height: 70,
              margin: EdgeInsets.all(2.5),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(65)),
              color: isSelected ? ColorUtil.primaryColor : ColorUtil.lightGray,
            ),
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Expanded(
              child: Text(
            category['name'] ?? '',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: SizeUtil.textSizeSmall,
                color:
                    isSelected ? ColorUtil.primaryColor : ColorUtil.textColor),
          ))
        ],
      ),
    );
  }
}
