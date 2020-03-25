import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/booking_rate_tabber_provider.dart';
import 'package:baby_garden_flutter/provider/partner_tabbar_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/rated_detail/rated_detail_screen.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/order_item.dart';
import 'package:baby_garden_flutter/widget/service_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class BookingRateScreen extends StatefulWidget {
  final bool isService;
  const BookingRateScreen({Key key,this.isService = false}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookingRateScreenState();
  }
}

class _BookingRateScreenState extends BaseState<BookingRateScreen>
    with SingleTickerProviderStateMixin {
  bool israted = false;
  TabController _tabController;
  final BookingRateTabbarProvider _bookingRateTabbarProvider = BookingRateTabbarProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() { _bookingRateTabbarProvider.onChange();});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    final List<Tab> myTabs = <Tab>[
      Tab(text: S.of(context).book),
      Tab(text: S.of(context).rated),
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getAppBar(
          title: widget.isService
              ? S.of(context).rating_service
              : S.of(context).rating_order,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white,
          widget: ColoredTabBar(
              Colors.white,
              TabBar(
                onTap: (val){
                  _bookingRateTabbarProvider.onChange();
                },
                controller: _tabController,
                labelColor: ColorUtil.primaryColor,
                unselectedLabelColor: ColorUtil.textColor,
                tabs: myTabs,
              )),
        ),
        body:
        TabBarView(
          controller: _tabController,
          children: myTabs.map((Tab tab) {
            final String label = tab.text.toLowerCase();
            return ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    onTap: () {
                      push(myTabs.indexOf(tab) == 0
                          ? RatingDetailScreen()
                          : RatedDetailScreen());
                    },
                    child: widget.isService
                        ? new ServiceItem()
                        : Consumer<BookingRateTabbarProvider>(builder: (BuildContext context, BookingRateTabbarProvider value, Widget child) {
                          return  OrderItem(isRated: value.isRated,);
                    },),
                  );
                });
          }).toList(),
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _bookingRateTabbarProvider)];
  }
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar(this.color, this.tabBar);

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: tabBar,
      );
}
