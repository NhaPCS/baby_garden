import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/provider/change_index_provider.dart';
import 'package:baby_garden_flutter/provider/orders_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/cart/cart_screen.dart';
import 'package:baby_garden_flutter/screen/home/home_screen.dart';
import 'package:baby_garden_flutter/screen/main/provider/get_promotion_popup_provider.dart';
import 'package:baby_garden_flutter/screen/order/order_screen.dart';
import 'package:baby_garden_flutter/screen/order_detail/order_detail_screen.dart';
import 'package:baby_garden_flutter/screen/profile/profile_screen.dart';
import 'package:baby_garden_flutter/screen/shopping/shopping_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class MainScreen extends StatefulWidget {
  final int index;
  final bool getPromotion;

  const MainScreen({Key key, this.index = 0, this.getPromotion})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends BaseState<MainScreen> with TickerProviderStateMixin {
  TabController _tabController;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final ChangeIndexProvider _changeIndexProvider = ChangeIndexProvider();
  final GetPromotionPopupProvider _getPromotionProvider =
      GetPromotionPopupProvider();
  int _time = 0;


  @override
  void initState() {
    this.initDynamicLinks();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      _changeIndexProvider.changeIndex(_tabController.index);
    });
    _configFirebaseMessaging();
    super.initState();
    if (widget.index !=null && widget.index > 0) _tabController.animateTo(widget.index);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.getPromotion != null &&
        widget.getPromotion &&
        !_getPromotionProvider.got) {
      _getPromotionProvider.getPromotion(context);
    }
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
                return Consumer2(
                  builder: (BuildContext context, CartProvider cartProvider,
                      OrdersProvider ordersCountProvider, Widget child) {
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
                          // reload orders
                          if (index == 3) {
                            Provider.of<OrdersProvider>(context, listen: false)
                                .getOrdersCount();
                          }
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
                              count: ordersCountProvider.totalCount),
                          getTabItem(
                              title: S.of(context).account,
                              iconName: 'user.svg',
                              index: 4),
                        ]);
                  },
                );
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

  _configFirebaseMessaging() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _showItemDialog(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _navigateToBooking(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _navigateToBooking(message);
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      service.updateToken(token: token);
      print("TOKEN  ${token}");
    });
  }

  void _showItemDialog(Map<String, dynamic> message) {
    final dynamic data = message['data'] ?? message;
    if (data != null) {
      WidgetUtil.showMessageDialog(context,
          message: data['content'], title: data['title'], onOkClick: () {
        _navigateToBooking(message);
      });
    }
  }

  void _navigateToBooking(Map<String, dynamic> message) {
    final dynamic data = message['data'] ?? message;
    if (data['booking_id'] != null) {
      push(OrderDetailScreen(
        bookingId: data['booking_id'],
      ));
    }
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;

          if (deepLink != null) {
            Navigator.pushNamed(context, deepLink.path);
          }
        },
        onError: (OnLinkErrorException e) async {
          print('onLinkError');
          print(e.message);
        }
    );

    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
  }

}
