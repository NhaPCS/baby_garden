import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/big_category_item.dart';
import 'package:baby_garden_flutter/provider/change_parent_category_provider.dart';
import 'package:baby_garden_flutter/provider/get_main_category_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListParentCategory extends StatelessWidget {
  final ChangeParentCategoryProvider changeCategoryProvider;
  final ValueChanged<dynamic> onParentCategoryChanged;

  const ListParentCategory(
      {Key key,
      @required this.changeCategoryProvider,
      this.onParentCategoryChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: changeCategoryProvider,
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: SizeUtil.smallSpace, top: SizeUtil.smallSpace),
                child: Text(
                  S.of(context).category.toUpperCase(),
                  style: TextStyle(
                      color: ColorUtil.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtil.textSizeBigger),
                ),
              ),
              Expanded(child: Consumer2<ChangeParentCategoryProvider,
                  GetMainCategoryProvider>(
                builder: (BuildContext context,
                    ChangeParentCategoryProvider value,
                    GetMainCategoryProvider mainCategoryProvider,
                    Widget child) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mainCategoryProvider.categories == null
                          ? 0
                          : mainCategoryProvider.categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: BigCategoryItem(
                            category: mainCategoryProvider.categories[index],
                            isSelected: changeCategoryProvider.index == index,
                          ),
                          onTap: () {
                            changeCategoryProvider.selectCategory(index, mainCategoryProvider.categories[index]['id']);
                            onParentCategoryChanged(
                                mainCategoryProvider.categories[index]);
                          },
                        );
                      });
                },
              ))
            ],
          ),
          color: Colors.white),
    );
  }
}
