import 'package:baby_garden_flutter/item/item_home_category.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/grid_product.dart';
import 'package:baby_garden_flutter/widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

import 'flash_sale.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends BaseState<HomeScreen> {
  double _categoryWidth;
  double _categoryHeight;
  double _productWidth;
  double _productHeight;
  double _flashSaleHeight;

  @override
  Widget buildWidget(BuildContext context) {
    _categoryWidth = null;
    if (_categoryWidth == null) {
      _categoryWidth = MediaQuery.of(context).size.width * 0.18;
      _categoryHeight = _categoryWidth * 1.4;
      _productWidth = MediaQuery.of(context).size.width * 0.35;
      _productHeight = _productWidth * 1.4;
      _flashSaleHeight = MediaQuery.of(context).size.width * 0.5;
    }
    return SafeArea(
      child: Material(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrollInner) {
            return [
              SliverAppBar(
                floating: true,
                snap: true,
                elevation: 0,
                pinned: true,
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height * 0.42,
                flexibleSpace: Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.27,
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
                        Row(
                          children: List.generate(5, (index) {
                            return ItemHomeCategory();
                          }),
                        )
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
                            );
                          }
                          return GridProduct(
                            categoryWidth: _categoryWidth,
                            categoryHeight: _categoryHeight,
                            onViewMoreClick: () {
                              //TODO
                            },
                            productWidth: _productWidth,
                            productHeight: _productHeight,
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
    return [];
  }
}
