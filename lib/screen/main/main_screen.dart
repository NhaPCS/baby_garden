import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/provider/change_index_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/cart/cart_screen.dart';
import 'package:baby_garden_flutter/screen/home/home_screen.dart';
import 'package:baby_garden_flutter/screen/order/order_screen.dart';
import 'package:baby_garden_flutter/screen/profile/profile_screen.dart';
import 'package:baby_garden_flutter/screen/shopping/shopping_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class MainScreen extends StatefulWidget {
  final int index;

  const MainScreen({Key key, this.index = 0}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends BaseState<MainScreen> with TickerProviderStateMixin {
  TabController _tabController;
  final ChangeIndexProvider _changeIndexProvider = ChangeIndexProvider();
  int _time = 0;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      _changeIndexProvider.changeIndex(_tabController.index);
    });

    super.initState();
    if (widget.index > 0) _tabController.animateTo(widget.index);
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                HomeScreen(),
                ShoppingScreen(),
                CartScreen(
                  onGoHome: () {
                    _tabController.animateTo(0);
                  },
                ),
                OrderScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: Consumer<ChangeIndexProvider>(
              builder: (BuildContext context, ChangeIndexProvider value,
                  Widget child) {
                return Consumer<CartProvider>(builder: (BuildContext context, CartProvider cartProvider, Widget child) {
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
                            index: 2,
                            count: cartProvider.badge),
                        getTabItem(
                            title: S.of(context).order,
                            iconName: 'shipped.svg',
                            index: 3,
                            count: 10),
                        getTabItem(
                            title: S.of(context).account,
                            iconName: 'user.svg',
                            index: 4),
                      ]);
                },);
              },
            )),
        onWillPop: () async {
          print("WTF will");
          if (_changeIndexProvider.index != 0) {
            _changeIndexProvider.changeIndex(0);
            _tabController.animateTo(0);
            return false;
          } else {
            if (DateTime.now().millisecondsSinceEpoch - _time < 2000) {
              return true;
            } else {
              _time = DateTime.now().millisecondsSinceEpoch;
              Toast.show(S.of(context).press_back_again_to_exit, context);
              return false;
            }
          }
        });
  }

  BottomNavigationBarItem getTabItem(
      {String title, String iconName, int index, int count}) {
    // TODO-Nha: check lại phần này
    return BottomNavigationBarItem(
        icon: count == null || count <= 0
            ? SvgIcon(
                iconName,
                color: index == _changeIndexProvider.index
                    ? ColorUtil.primaryColor
                    : ColorUtil.black33,
                height: 25,
              )
            : Container(
                height: 27,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: SvgIcon(
                        iconName,
                        height: 25,
                        color: index == _changeIndexProvider.index
                            ? ColorUtil.primaryColor
                            : ColorUtil.black33,
                      ),
                      top: 2,
                      left: 0,
                      right: 0,
                    ),
                    Positioned(
                      child: Container(
                        width: 15,
                        height: 15,
                        padding: EdgeInsets.all(2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorUtil.red),
                        child: AutoSizeText(
                          count.toString(),
                          minFontSize: 8,
                          maxFontSize: 11,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      right: 10,
                      top: 0,
                    )
                  ],
                ),
              ),
        title: Text(title));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _changeIndexProvider)];
  }
}
