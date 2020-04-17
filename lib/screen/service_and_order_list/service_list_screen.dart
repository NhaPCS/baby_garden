import 'package:baby_garden_flutter/provider/booking_detail_provider.dart';
import 'package:baby_garden_flutter/provider/service_list_provider.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/service_detail/service_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/item/service_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ServiceListScreen extends StatefulWidget {
  final String title;
  final String childTitle;
  final int state;
  const ServiceListScreen({Key key,this.title,@required this.childTitle, this.state = 0}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ServiceListScreenState();
  }
}

class _ServiceListScreenState extends BaseState<ServiceListScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title:  widget.title,
        centerTitle: true,
        bgColor: ColorUtil.primaryColor,
        titleColor: Colors.white,
        backColor: Colors.white,
      ),
      // TODO-Hung: dung SafeArea de lam gi nhi? bo di
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
                  child:Consumer<ServiceListProvider>(builder: (BuildContext context, ServiceListProvider value, Widget child) {
                    return ListView.builder(
                        itemCount: value.listService.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return new GestureDetector(onTap: (){
                            Provider.of<BookingDetailProvider>(context,listen: false).getBookingDetail(Provider.of<UserProvider>(context,listen: false).userInfo['id'], value.listService[index]['id']);
                            push(ServiceDetailScreen(title: widget.childTitle));
                          },
                              child: new ServiceItem(isShowBookingDate: false,itemData: value.listService[index],));
                        });
                  },),
                ),
              )
            ],
          )),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return null;
  }
}

// TODO-Hung: k de chung file
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
