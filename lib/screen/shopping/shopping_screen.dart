import 'package:baby_garden_flutter/data/model/section.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/get_banners_provider.dart';
import 'package:baby_garden_flutter/provider/get_product_category_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/photo_view/photo_view_screen.dart';
import 'package:baby_garden_flutter/screen/search/search_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/input/search_bar.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/grid_product.dart';
import 'package:baby_garden_flutter/widget/product/notify_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ShoppingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShoppingState();
  }
}

class _ShoppingState extends BaseState<ShoppingScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
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
                            bottomRight: Radius.circular(SizeUtil.bigRadius))),
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
                        child: Consumer<GetBannersProvider>(
                          builder: (BuildContext context,
                              GetBannersProvider value, Widget child) {
                            return MyCarouselSlider(
                              hasShadow: true,
                              images: value.banners,
                              imageAttrName: "img",
                              onItemPressed: (index) {
                                push(PhotoViewScreen(
                                  images: value.banners,
                                  imageAttrName: 'img',
                                  initIndex: index,
                                ));
                              },
                            );
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
            Expanded(child: Consumer<GetProductCategoryProvider>(
              builder: (BuildContext context, GetProductCategoryProvider value,
                  Widget child) {
                return ListView.builder(
                    itemCount: value.categories.length,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return GridProduct(
                        categoryId: value.categories[index]['id'],
                        totalCount: 10,
                        section: new Section(
                            title: value.categories[index]['name'],
                            path: 'listProduct'),
                      );
                    });
              },
            ))
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
