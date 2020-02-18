import 'package:baby_garden_flutter/item/item_home_category.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/grid_product.dart';
import 'package:baby_garden_flutter/widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'flash_sale.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends BaseState<HomeScreen> {
  final ChangeCategoryProvider _changeCategoryProvider =
      ChangeCategoryProvider();
  double _flashSaleHeight;
  double _flashSaleWidth;

  @override
  Widget buildWidget(BuildContext context) {
    if (_flashSaleHeight == null) {
      _flashSaleHeight = MediaQuery.of(context).size.width * 0.6;
      _flashSaleWidth = _flashSaleHeight * 0.7;
    }
    return SafeArea(
      child: Material(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrollInner) {
            return [
              SliverAppBar(
                floating: true,
                elevation: 0,
                pinned: true,
                backgroundColor: Colors.white,
                expandedHeight: Provider.of<AppProvider>(context).expandHeaderHeight,
                flexibleSpace: Stack(
                  children: <Widget>[
                    Container(
                      height: Provider.of<AppProvider>(context).bgHeaderHeight,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('photo/bg_header.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(SizeUtil.bigRadius),
                              bottomRight:
                                  Radius.circular(SizeUtil.bigRadius))),
                    ),
                    Column(
                      children: <Widget>[
                        SearchBar(),
                        Expanded(
                          child: MyCarouselSlider(
                            images: [
                              StringUtil.dummyImage,
                              StringUtil.dummyImage,
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ];
          },
          body: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: List.generate(5, (index) {
                    return ItemHomeCategory();
                  }),
                ),
                Container(
                  height: SizeUtil.lineHeight,
                  color: ColorUtil.lineColor,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return FlashSale(
                              flashSaleHeight: _flashSaleHeight,
                              flashSaleWidth: _flashSaleWidth,
                            );
                          }
                          return GridProduct(
                            changeCategoryProvider: _changeCategoryProvider,
                            onViewMoreClick: () {
                              //TODO
                            },
                          );
                        }))
              ],
            ),
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _changeCategoryProvider)];
  }
}
