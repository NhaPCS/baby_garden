import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking_rate/provider/booking_rate_tabber_provider.dart';
import 'package:baby_garden_flutter/screen/rated_detail/rated_detail_screen.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/item/order_item.dart';
import 'package:baby_garden_flutter/item/service_item.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class BookingRateScreen extends StatefulWidget {
  final bool isService;

  const BookingRateScreen({Key key, this.isService = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BookingRateScreenState();
  }
}

class _BookingRateScreenState extends BaseState<BookingRateScreen>
    with SingleTickerProviderStateMixin {
  bool isRated = false;
  TabController _tabController;
  final BookingRateTabBarProvider _bookingRateTabBarProvider =
      BookingRateTabBarProvider();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _bookingRateTabBarProvider.getBookingData(null,
        isService: widget.isService);
    _tabController.addListener(() {
      _bookingRateTabBarProvider.onChange();
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
              ? S.of(context).rating_service
              : S.of(context).rating_order,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white,
          widget: ColoredTabBar(
              Colors.white,
              TabBar(
                onTap: (val) {
                  _bookingRateTabBarProvider.onChange();
                },
                controller: _tabController,
                labelColor: ColorUtil.primaryColor,
                unselectedLabelColor: ColorUtil.textColor,
                tabs: <Tab>[
                  Tab(text: S.of(context).book),
                  Tab(text: S.of(context).rated),
                ],
              )),
        ),
        body: Consumer<BookingRateTabBarProvider>(
          builder: (BuildContext context, BookingRateTabBarProvider value,
              Widget child) {
            return TabBarView(
              controller: _tabController,
              children: <Widget>[
                value.ratingData.isEmpty
                    ? LoadingView(
                        isNoData: value.ratingData != null,
                        onReload: () {
                          _bookingRateTabBarProvider.getBookingData(null,
                              isService: widget.isService);
                        },
                      )
                    : ListView.builder(
                        itemCount: value.ratingData.length,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return new GestureDetector(
                            onTap: () {
                              push(RatingDetailScreen());
                            },
                            child: widget.isService
                                ? new ServiceItem(itemData: value.ratingData[index])
                                : OrderItem(isRated: false,itemData: value.ratingData[index],),
                          );
                        }),
                value.ratedData.isEmpty
                    ? LoadingView(
                        isNoData: value.ratedData != null,
                        onReload: () {
                          _bookingRateTabBarProvider.getBookingData(null,
                              isService: widget.isService);
                        },
                      )
                    : ListView.builder(
                        itemCount: value.ratedData.length,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return new GestureDetector(
                            onTap: () {
                              push(RatedDetailScreen());
                            },
                            child: widget.isService
                                ? new ServiceItem(itemData: value.ratedData[index],)
                                : OrderItem(isRated: true,itemData: value.ratedData[index],),
                          );
                        }),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _bookingRateTabBarProvider)];
  }
}
