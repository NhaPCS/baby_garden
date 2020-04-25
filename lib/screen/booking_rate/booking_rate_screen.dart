import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking_rate/provider/booking_rate_tabber_provider.dart';
import 'package:baby_garden_flutter/screen/rated_detail/rated_detail_screen.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/item/order_item.dart';
import 'package:baby_garden_flutter/item/service_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class BookingRateScreen extends StatefulWidget {
  final bool isService;

  const BookingRateScreen({Key key, this.isService = false}) :super(key: key);

  @override
  State<StatefulWidget> createState() {
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
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      _bookingRateTabbarProvider.onChange();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getAppBar(
          title: widget.isService
              ? S
              .of(context)
              .rating_service
              : S
              .of(context)
              .rating_order,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white,
          widget: ColoredTabBar(
              Colors.white,
              TabBar(
                onTap: (val) {
                  _bookingRateTabbarProvider.onChange();
                },
                controller: _tabController,
                labelColor: ColorUtil.primaryColor,
                unselectedLabelColor: ColorUtil.textColor,
                tabs: <Tab>[
                  Tab(text: S
                      .of(context)
                      .book),
                  Tab(text: S
                      .of(context)
                      .rated),
                ],
              )),
        ),
        body:
        TabBarView(
          controller: _tabController,
          children: <Widget>[
            ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    onTap: () {
                      RatingDetailScreen();
                    },
                    child: widget.isService
                        ? new ServiceItem()
                        : OrderItem(isRated: true),
                  );
                }),
            ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    onTap: () {
                      RatedDetailScreen();
                    },
                    child: widget.isService
                        ? new ServiceItem()
                        : OrderItem(isRated: true),
                  );
                })
          ],
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
