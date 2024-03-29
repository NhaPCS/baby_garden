import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/get_product_category_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCategory extends StatefulWidget {
  final ValueChanged<dynamic> onChangedCategory;
  final ValueNotifier<int> selectedController;
  final dynamic categories;

  const ListCategory(
      {Key key,
      this.onChangedCategory,
      this.categories,
      this.selectedController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListCategoryState();
  }
}

class _ListCategoryState extends State<ListCategory> {
  ValueNotifier<int> _controller;

  @override
  void initState() {
    if (widget.selectedController == null) {
      _controller = ValueNotifier(0);
    } else
      _controller = widget.selectedController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.lineColor,
      child: widget.categories != null
          ? getList(widget.categories)
          : Consumer<GetProductCategoryProvider>(
              builder: (BuildContext context, GetProductCategoryProvider value,
                  Widget child) {
                return getList(value.categories);
              },
            ),
      height: Provider.of<AppProvider>(context).categoryHeight,
    );
  }

  Widget getList(List<dynamic> categories) {
    return ValueListenableBuilder<int>(
      builder: (BuildContext context, int selectCategoryIndex, Widget child) {
        if (widget.onChangedCategory != null) {
          widget.onChangedCategory(selectCategoryIndex == 0 ||
                  categories == null ||
                  categories.isEmpty ||
                  selectCategoryIndex - 1 >= categories.length
              ? null
              : categories[selectCategoryIndex - 1]);
        }
        return ListView.builder(
          itemCount: categories == null ? 1 : categories.length + 1,
          itemBuilder: (context, index) {
            bool isSelected = _controller.value == index;
            return InkWell(
              child: Container(
                width: Provider.of<AppProvider>(context).categoryWidth,
                padding: SizeUtil.miniPadding,
                margin: EdgeInsets.only(
                    top: SizeUtil.tinySpace,
                    bottom: SizeUtil.tinySpace,
                    left: SizeUtil.superTinySpace,
                    right: SizeUtil.superTinySpace),
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: isSelected
                        ? BorderRadius.all(Radius.circular(SizeUtil.tinyRadius))
                        : null,
                    border: Border.all(
                        color:
                            isSelected ? ColorUtil.primaryColor : Colors.white,
                        width: isSelected ? 2 : 0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    index == 0
                        ? Image.asset(
                            'photo/ic_all.png',
                            width: SizeUtil.iconSizeBigger,
                          )
                        : CachedNetworkImage(
                            imageUrl: categories[index - 1]['img'],
                            width: SizeUtil.iconSizeBigger,
                          ),
                    SizedBox(
                      height: SizeUtil.tinySpace,
                    ),
                    AutoSizeText(
                      index == 0
                          ? S.of(context).all
                          : categories[index - 1]['name'],
                      maxLines: 2,
                      maxFontSize: SizeUtil.textSizeTiny,
                      minFontSize: SizeUtil.textSizeMini,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          color: isSelected
                              ? ColorUtil.primaryColor
                              : ColorUtil.textColor,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal),
                    )
                  ],
                ),
              ),
              onTap: () {
                _controller.value = index;
              },
            );
          },
          scrollDirection: Axis.horizontal,
        );
      },
      valueListenable: _controller,
    );
  }
}
