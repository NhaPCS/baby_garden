import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_index_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/home/home_screen.dart';
import 'package:baby_garden_flutter/screen/shopping/shopping_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends BaseState<MainScreen> with TickerProviderStateMixin {
  TabController _tabController;
  final ChangeIndexProvider _changeIndexProvider = ChangeIndexProvider();

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      _changeIndexProvider.changeIndex(_tabController.index);
    });
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    Provider.of<AppProvider>(context)
        .updateCategorySize(MediaQuery.of(context).size.width);
    return Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            HomeScreen(),
            ShoppingScreen(),
            HomeScreen(),
            HomeScreen(),
            HomeScreen(),
          ],
        ),
        bottomNavigationBar: Consumer<ChangeIndexProvider>(
          builder:
              (BuildContext context, ChangeIndexProvider value, Widget child) {
            return BottomNavigationBar(
                selectedItemColor: ColorUtil.primaryColor,
                unselectedItemColor: ColorUtil.textColor,
                showSelectedLabels: true,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                currentIndex: value.index,
                onTap: (index) {
                  _changeIndexProvider.changeIndex(index);
                  _tabController.animateTo(index);
                },
                items: [
                  getTabItem(
                      title: S.of(context).home,
                      iconName: 'home.svg',
                      index: 0),
                  getTabItem(
                      title: S.of(context).shopping,
                      iconName: 'shop.svg',
                      index: 1),
                  getTabItem(
                      title: S.of(context).cart,
                      iconName: 'cart.svg',
                      index: 2),
                  getTabItem(
                      title: S.of(context).order,
                      iconName: 'shipped.svg',
                      index: 3),
                  getTabItem(
                      title: S.of(context).account,
                      iconName: 'user.svg',
                      index: 4),
                ]);
          },
        ));
  }

  BottomNavigationBarItem getTabItem(
      {String title, String iconName, int index}) {
    return BottomNavigationBarItem(
        icon: SvgIcon(iconName,
            color: index == _changeIndexProvider.index
                ? ColorUtil.primaryColor
                : ColorUtil.black33),
        title: Text(title));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _changeIndexProvider)];
  }
}
