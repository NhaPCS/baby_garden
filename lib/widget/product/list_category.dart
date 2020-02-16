import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCategory extends StatelessWidget {
  final ChangeCategoryProvider categoryProvider;

  const ListCategory({Key key, @required this.categoryProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: categoryProvider,
      child: Container(
        color: ColorUtil.lineColor,
        child: Consumer<ChangeCategoryProvider>(
          builder: (BuildContext context, ChangeCategoryProvider value,
              Widget child) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                bool isSelected =
                    categoryProvider != null && categoryProvider.index == index;
                return GestureDetector(
                  child: Container(
                    width: Provider.of<AppProvider>(context).categoryWidth,
                    padding: SizeUtil.tinyPadding,
                    margin: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        bottom: SizeUtil.smallSpace,
                        left: SizeUtil.tinySpace,
                        right: SizeUtil.tinySpace),
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(SizeUtil.smallRadius)),
                        border: Border.all(
                            color: isSelected
                                ? ColorUtil.primaryColor
                                : Colors.white,
                            width: isSelected ? 2 : 0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          index == 0
                              ? 'photo/ic_all.png'
                              : 'photo/ic_phone.png',
                          width: SizeUtil.iconSizeBigger,
                        ),
                        SizedBox(
                          height: SizeUtil.tinySpace,
                        ),
                        AutoSizeText(
                          index == 0
                              ? S.of(context).all
                              : "Điện thoại & phụ kiện",
                          maxLines: 2,
                          maxFontSize: SizeUtil.textSizeTiny,
                          minFontSize: SizeUtil.textSizeMini,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: isSelected
                                  ? ColorUtil.primaryColor
                                  : ColorUtil.textColor,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    if (categoryProvider != null)
                      categoryProvider.selectCategory(index);
                  },
                );
              },
              scrollDirection: Axis.horizontal,
            );
          },
        ),
        height: Provider.of<AppProvider>(context).categoryHeight,
      ),
    );
  }
}
