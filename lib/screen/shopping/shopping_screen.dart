import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/grid_product.dart';
import 'package:baby_garden_flutter/widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class ShoppingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShoppingState();
  }
}

class _ShoppingState extends BaseState<ShoppingScreen> {
  final ChangeCategoryProvider _changeCategoryProvider =
      ChangeCategoryProvider();

  @override
  Widget buildWidget(BuildContext context) {
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
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            ];
          },
          body: Column(
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
                        return GridProduct(
                          changeCategoryProvider: _changeCategoryProvider,
                          onViewMoreClick: () {
                            //TODO
                          },
                        );
                      }))
            ],
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
