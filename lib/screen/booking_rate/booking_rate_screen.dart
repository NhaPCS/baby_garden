import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/order_item.dart';
import 'package:baby_garden_flutter/widget/service_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';

class BookingRateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookingRateScreenState();
  }
}

class _BookingRateScreenState extends BaseState<BookingRateScreen> {
  final _isService = false;

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorUtil.primaryColor));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getAppBar(
          title: _isService
              ? S.of(context).rating_service
              : S.of(context).rating_order,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white,
          widget: ColoredTabBar(
              Colors.white,
              TabBar(
                labelColor: ColorUtil.primaryColor,
                unselectedLabelColor: ColorUtil.textColor,
                tabs: <Widget>[
                  Tab(
                    text: S.of(context).waitting_rate,
                  ),
                  Tab(
                    text: S.of(context).rated,
                  )
                ],
              )),
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: SizeUtil.smallSpace),
                color: ColorUtil.lineColor,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return new GestureDetector(onTap: (){
                        push(RatingDetailScreen());
                      },
                      child: _isService ? new ServiceItem() : new OrderItem(),);
                    }),
              ),
            )
          ],
        )),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return null;
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
