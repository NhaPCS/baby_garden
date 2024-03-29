import 'package:baby_garden_flutter/data/model/section.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/get_main_category_provider.dart';
import 'package:baby_garden_flutter/provider/get_product_category_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/home/widget/balloon.dart';
import 'package:baby_garden_flutter/screen/home/widget/banners.dart';
import 'package:baby_garden_flutter/screen/search/search_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/input/search_bar.dart';
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
  ValueNotifier<int> _reloadNotifier = new ValueNotifier(0);

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NestedScrollView(
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
                        height:
                            Provider.of<AppProvider>(context).bgHeaderHeight,
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
                            child: Banners(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ];
            },
            body: RefreshIndicator(
              onRefresh: () {
                _reloadNotifier.value = _reloadNotifier.value + 1;
                return Future.delayed(Duration(milliseconds: 1000));
              },
              child: ValueListenableBuilder(
                builder: (BuildContext context, value, Widget child) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: SizeUtil.lineHeight,
                        color: ColorUtil.lineColor,
                      ),
                      Expanded(child: Consumer<GetMainCategoryProvider>(
                        builder: (BuildContext context,
                            GetMainCategoryProvider value, Widget child) {
                          return ListView(
                            padding: EdgeInsets.all(0),
                            children: value.categories
                                .map((e) => GridProduct(
                                      reload: _reloadNotifier.value,
                                      parentId: e['id'].toString(),
                                      totalCount: 10,
                                      section: new Section(
                                          title: e['name'],
                                          path: 'listProduct'),
                                    ))
                                .toList(),
                          );
                        },
                      ))
                    ],
                  );
                },
                valueListenable: _reloadNotifier,
              ),
            ),
          ),
          Balloon()
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
