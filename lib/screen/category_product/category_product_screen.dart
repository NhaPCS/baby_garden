import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_big_category.dart';
import 'package:baby_garden_flutter/item/item_product.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/category_product/sliver_category_delegate.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loadmore_nested_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class CategoryProductScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryProductState();
  }
}

class _CategoryProductState extends BaseState<CategoryProductScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return SafeArea(
        child: Material(
      child: LoadMoreNestedScrollView(
          body: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height * 0.25,
                flexibleSpace: Column(
                  children: <Widget>[
                    Text(S.of(context).category.toUpperCase())
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverCategoryDelegate(
                    ListView(
                      children: List.generate(5, (index) {
                        return ItemBigCategory();
                      }),
                      scrollDirection: Axis.horizontal,
                    ),
                    MediaQuery.of(context).size.height * 0.2,
                    MediaQuery.of(context).size.height * 0.2),
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
    return [];
  }
}
