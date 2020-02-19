import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_product.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/provider/change_parent_category_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/category_product/sliver_category_delegate.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loadmore_nested_scrollview.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:baby_garden_flutter/widget/product/list_parent_category.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class CategoryProductScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryProductState();
  }
}

class _CategoryProductState extends BaseState<CategoryProductScreen> {
  final ChangeParentCategoryProvider _changeParentCategoryProvider =
      ChangeParentCategoryProvider();
  final ChangeCategoryProvider _changeCategoryProvider =
      ChangeCategoryProvider();

  @override
  Widget buildWidget(BuildContext context) {
    return SafeArea(
        child: Material(
      child: LoadMoreNestedScrollView(
          body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return ItemProduct(
                  width: MediaQuery.of(context).size.width * 0.5,
                  borderRadius: SizeUtil.tinyRadius,
                  showSoldCount: true,
                  nameStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                  showTime: true,
                  padding: EdgeInsets.only(
                      left: SizeUtil.smallSpace,
                      right: SizeUtil.smallSpace,
                      top: 0),
                );
              }),
          headerSliverBuilder: (context, isScrollInner) {
            return [
              new SliverAppBar(
                title: new Text(
                  S.of(context).category_product.toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
                leading: BaseState.getLeading(context),
                centerTitle: true,
                pinned: true,
                floating: true,
                forceElevated: isScrollInner,
              ),
              SliverPersistentHeader(
                pinned: false,
                floating: false,
                delegate: SliverCategoryDelegate(
                    ListParentCategory(
                      changeCategoryProvider: _changeParentCategoryProvider,
                    ),
                    Provider.of<AppProvider>(context).bigCategoryHeight,
                    Provider.of<AppProvider>(context).bigCategoryHeight),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: SliverCategoryDelegate(
                    ListCategory(
                      categoryProvider: _changeCategoryProvider,
                    ),
                    Provider.of<AppProvider>(context).categoryHeight,
                    Provider.of<AppProvider>(context).categoryHeight),
              )
            ];
          },
          onLoadMore: () {
            //TODO
          }),
    ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _changeCategoryProvider),
      ChangeNotifierProvider.value(value: _changeParentCategoryProvider),
    ];
  }
}
