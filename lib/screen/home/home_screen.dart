import 'package:baby_garden_flutter/dialog/promotion_dialog.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_home_category.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/provider/get_banners_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/widget/delegate/sliver_category_delegate.dart';
import 'package:baby_garden_flutter/screen/photo_view/photo_view_screen.dart';
import 'package:baby_garden_flutter/screen/search/search_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/home_view_model.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/grid_product.dart';
import 'package:baby_garden_flutter/widget/product/notify_icon.dart';
import 'package:baby_garden_flutter/widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../base_state_model.dart';
import 'flash_sale.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends BaseStateModel<HomeScreen, HomeViewModel> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      //TODO fake dialog
      showDialog(
          context: context,
          builder: (_) => PromotionDialog(context),
          barrierDismissible: false);
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrollInner) {
          return [
            SliverAppBar(
              floating: true,
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
                            if(value.banners==null|| value.banners.isEmpty) return SizedBox();
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
                      ),
                    ],
                  )
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: SliverCategoryDelegate(
                  Card(
                    margin: EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: getViewModel()
                          .HOME_CATEGORIES
                          .map((e) => ItemHomeCategory(
                                category: e,
                              ))
                          .toList(),
                    ),
                    color: Colors.white,
                  ),
                  Provider.of<AppProvider>(context).homeCategoryHeight,
                  Provider.of<AppProvider>(context).homeCategoryHeight),
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
                      itemCount: getViewModel().SECTIONS.length + 1,
                      padding: EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return FlashSale();
                        }
                        return GridProduct(
                          isHome: true,
                          section: getViewModel().SECTIONS[index - 1],
                        );
                      }))
            ],
          ),
          height: double.infinity,
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return null;
  }

  @override
  initViewModel() {
    return new HomeViewModel(context);
  }
}
