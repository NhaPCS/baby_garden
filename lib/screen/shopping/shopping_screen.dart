import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/photo_view/photo_view_screen.dart';
import 'package:baby_garden_flutter/screen/search/search_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/grid_product.dart';
import 'package:baby_garden_flutter/widget/product/notify_icon.dart';
import 'package:baby_garden_flutter/widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

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
                expandedHeight:
                    Provider.of<AppProvider>(context).expandHeaderHeight,
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
                        SearchBar(
                          trailing: NotifyIcon(),
                          enable: false,
                          onPressed: () {
                            push(SearchScreen());
                          },
                        ),
                        Expanded(
                          child: MyCarouselSlider(
                            hasShadow: true,
                            images: StringUtil.dummyImageList,
                            onItemPressed: (index) {
                              push(PhotoViewScreen(
                                images: StringUtil.dummyImageList,
                              ));
                            },
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
