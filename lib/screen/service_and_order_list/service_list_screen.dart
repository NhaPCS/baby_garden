import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/order/order_detail_screen.dart';
import 'package:baby_garden_flutter/screen/rated_detail/rated_detail_screen.dart';
import 'package:baby_garden_flutter/screen/service/service_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/order_item.dart';
import 'package:baby_garden_flutter/widget/service_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';

class ServiceListScreen extends StatefulWidget {
  final int order;
  final String title;
  const ServiceListScreen({Key key, this.order = 0,this.title}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ServiceListScreenState();
  }
}

class _ServiceListScreenState extends BaseState<ServiceListScreen> {
  final _isService = false;

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorUtil.primaryColor,statusBarBrightness: Brightness.light,));
    return Scaffold(
      appBar: getAppBar(
        title:  widget.title,
        centerTitle: true,
        bgColor: ColorUtil.primaryColor,
        titleColor: Colors.white,
        backColor: Colors.white,
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: SizeUtil.tinySpace,
                color: Colors.white,
              ),
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
                          push(ServiceDetailScreen(title: widget.order==4?"Chi tiết hủy đơn":"Đơn hàng VCB19.12.25",isBookedSchedule: widget.order==2,isCancel: widget.order==4,));
                        },
                          child: new ServiceItem(isShowBookingDate: false,));
                      }),
                ),
              )
            ],
          )),
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
