import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/big_category_item.dart';
import 'package:baby_garden_flutter/provider/change_parent_category_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListParentCategory extends StatelessWidget {
  final ChangeParentCategoryProvider changeCategoryProvider;

  const ListParentCategory({Key key, @required this.changeCategoryProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: changeCategoryProvider,
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
          Expanded(child: Consumer<ChangeParentCategoryProvider>(
            builder: (BuildContext context, ChangeParentCategoryProvider value,
                Widget child) {
              return ListView(
                children: List.generate(5, (index) {
                  return GestureDetector(
                    child: BigCategoryItem(
                      isSelected: changeCategoryProvider.index == index,
                    ),
                    onTap: () {
                      changeCategoryProvider.selectCategory(index);
                    },
                  );
                }),
                scrollDirection: Axis.horizontal,
              );
            },
          ))
        ],
      ),
    );
  }
}
