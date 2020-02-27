import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_product.dart';
import 'package:baby_garden_flutter/provider/change_date_provider.dart';
import 'package:baby_garden_flutter/provider/change_schedule_provider.dart';
import 'package:baby_garden_flutter/provider/change_service_provider.dart';
import 'package:baby_garden_flutter/provider/partner_book_tabbar_provider.dart';
import 'package:baby_garden_flutter/provider/see_more_provider.dart';
import 'package:baby_garden_flutter/provider/segment_control_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/rated_detail/rated_detail_screen.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/colored_tabbar.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_gridview.dart';
import 'package:baby_garden_flutter/widget/order_item.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:baby_garden_flutter/widget/service_detail_item.dart';
import 'package:baby_garden_flutter/widget/service_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class PartnerBookScheduleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PartnerBookScheduleScreenState();
  }
}

class _PartnerBookScheduleScreenState
    extends BaseState<PartnerBookScheduleScreen> with TickerProviderStateMixin {
  final SeeMoreProvider _seeMoreProvider = SeeMoreProvider();
  final ChangeServiceProvider _serviceProvider = ChangeServiceProvider();
  final ChangeDateProvider _dateProvider = ChangeDateProvider();
  final ChangeScheduleTimeProvider _scheduleTimeProvider =
      ChangeScheduleTimeProvider();
  final PartnerBookTabbarProvider _bookTabbarProvider =
      PartnerBookTabbarProvider();
  List<dynamic> DETAIL_INFO = List();
  List<dynamic> CLIENT_LIST = List();
  List<dynamic> WEEK = List();
  List<dynamic> TIME = List();
  TabController _tabController;
  TabController _dayTabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: 2);
    _dayTabController = TabController(vsync: this, length: 7);
    _tabController.addListener(() {
      if (_tabController.index!=_bookTabbarProvider.index){
          print("change index asd asd : ${_tabController.index.toString()}");
          _bookTabbarProvider.onChangeIndex(_tabController.index);
      }
    });

    _dayTabController.addListener(() {
//      print("change index");
//      _bookTabbarProvider.onChangeIndex(_bookTabbarProvider.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _dayTabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    CLIENT_LIST = [
      {'address': '38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội'},
      {'address': '15B Đào Tấn, Ba Đình, Hà Nội'},
      {'address': '134 Lê Lợi, Hà Đông, Hà Nội'},
      {'address': '134 Lê Lợi, Hà Đông, Hà Nội'}
    ];
    DETAIL_INFO = [
      {
        'title': "Điện thoại:",
        'value': '0912 677 022',
        'valueColor': ColorUtil.blueLight,
        'button': 'ĐÃ THÍCH'
      },
      {
        'title': "Địa chỉ: ",
        'value': '38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội',
        'action_title': 'Chỉ đường'
      },
      {
        'title': 'Loại dịch vụ: ',
        'value': 'SPA Thẩm Mỹ, Khám Thai',
        'valueColor': ColorUtil.blueLight
      },
      {
        'title': 'Giới thiệu: ',
        'value':
            'Đây là cửa hàng chuyên cung cấp sữa bỉm cho bé,\nvà dịch vụ làm đẹp cho mẹ, để xem thêm thông tin...',
        'full_value':
            'Đây là cửa hàng chuyên cung cấp sữa bỉm cho bé,\nvà dịch vụ làm đẹp cho mẹ, để xem thêm thông tin sau do la ca mot bau troi tu cach. Chua bao gio co mot ai sanh kipj',
        'see_more': 'Xem thêm'
      }
    ];
    WEEK = [
      {'dow': 'Thứ 2', 'date': '12/02/2020'},
      {'dow': 'Thứ 3', 'date': '13/02/2020'},
      {'dow': 'Thứ 4', 'date': '14/02/2020'},
      {'dow': 'Thứ 5', 'date': '15/02/2020'},
      {'dow': 'Thứ 6', 'date': '16/02/2020'},
      {'dow': 'Thứ 7', 'date': '17/02/2020'},
      {'dow': 'Chủ nhật', 'date': '18/02/2020'},
    ];
    TIME = [
      {'time': '08:00'},
      {'time': '08:15'},
      {'time': '08:30'},
      {'time': '08:45'},
      {'time': '09:00'},
      {'time': '09:15'},
      {'time': '09:30'},
      {'time': '09:45'},
      {'time': '10:00'},
      {'time': '10:15'},
      {'time': '10:30'},
      {'time': '10:45'},
      {'time': '11:00'},
      {'time': '11:15'},
      {'time': '11:30'},
      {'time': '11:45'},
      {'time': '12:00'},
      {'time': '12:15'},
      {'time': '12:30'},
      {'time': '12:45'},
      {'time': '13:00'},
      {'time': '13:15'},
      {'time': '13:30'},
      {'time': '13:45'},
      {'time': '14:00'},
      {'time': '14:15'},
      {'time': '14:30'},
      {'time': '14:45'},
      {'time': '15:00'},
      {'time': '15:15'},
      {'time': '15:30'},
      {'time': '15:45'},
      {'time': '16:00'},
      {'time': '16:15'},
      {'time': '16:30'},
      {'time': '16:45'},
      {'time': '17:00'},
      {'time': '17:15'},
      {'time': '17:30'},
      {'time': '17:45'},
      {'time': '18:00'},
      {'time': '18:15'},
      {'time': '18:30'},
      {'time': '18:45'},
    ];
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    final List<Tab> myTabs = <Tab>[
      Tab(text: S.of(context).waitting_rate),
      Tab(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                S.of(context).product,
              ),
              Text(
                '(12)',
                style: TextStyle(fontSize: SizeUtil.textSizeTiny),
              )
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(title: S.of(context).app_name_title.toUpperCase()),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                "photo/partner_item_img.png",
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                bottom: SizeUtil.smallSpace,
                right: SizeUtil.smallSpace,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeUtil.midSmallSpace,
                          right: SizeUtil.midSmallSpace,
                          top: SizeUtil.tinySpace,
                          bottom: SizeUtil.tinySpace),
                      decoration: BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeUtil.smallRadius))),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Image.asset(
                            "photo/comment_img.png",
                            width: SizeUtil.iconSizeDefault,
                            height: SizeUtil.iconSizeDefault,
                          ),
                          SizedBox(
                            width: SizeUtil.tinySpace,
                          ),
                          Text(
                            "12",
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: ColorUtil.textColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SizeUtil.smallSpace,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeUtil.midSmallSpace,
                          right: SizeUtil.midSmallSpace,
                          top: SizeUtil.tinySpace,
                          bottom: SizeUtil.tinySpace),
                      decoration: BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeUtil.smallRadius))),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Image.asset(
                            "photo/heart.png",
                            width: SizeUtil.iconSizeDefault,
                            height: SizeUtil.iconSizeDefault,
                          ),
                          SizedBox(
                            width: SizeUtil.tinySpace,
                          ),
                          Text(
                            "234",
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: ColorUtil.textColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: DETAIL_INFO // info
                .map((e) => paddingContainer(e['see_more'] == null
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            e['title'],
                            style: TextStyle(
                                color: ColorUtil.textColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: SizeUtil.tinySpace,
                          ),
                          Text(
                            e['value'],
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: e['valueColor'] == null
                                    ? ColorUtil.textColor
                                    : e['valueColor']),
                          ),
                          e['action_title'] == null
                              ? SizedBox()
                              : Expanded(
                                  child: SizedBox(),
                                ),
                          e['action_title'] == null
                              ? SizedBox()
                              : InkWell(
                                  onTap: () {},
                                  child: Text(
                                    e['action_title'],
                                    style: TextStyle(
                                        fontSize: SizeUtil.textSizeSmall,
                                        color: ColorUtil.blueLight),
                                  ),
                                ),
                          e['button'] == null
                              ? SizedBox()
                              : Expanded(
                                  child: SizedBox(),
                                ),
                          e['button'] == null
                              ? SizedBox()
                              : RaisedButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(SizeUtil.smallRadius),
                                  )),
                                  color: ColorUtil.primaryColor,
                                  child: Text(
                                    e['button'],
                                    style: TextStyle(
                                        fontSize: SizeUtil.textSizeDefault,
                                        color: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                        ],
                      )
                    : Consumer<SeeMoreProvider>(
                        builder: (BuildContext context, SeeMoreProvider value,
                            Widget child) {
                          return GestureDetector(
                            onTap: () {
                              _seeMoreProvider.onChange();
                            },
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: e['title'],
                                  style: TextStyle(
                                      color: ColorUtil.textColor,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: value.isShow
                                            ? e['full_value']
                                            : e['value'],
                                        style: TextStyle(
                                            fontSize:
                                                SizeUtil.textSizeExpressDetail,
                                            color: ColorUtil.textColor,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal)),
                                    TextSpan(
                                      text: value.isShow ? '' : e['see_more'],
                                      style: TextStyle(
                                          fontSize: SizeUtil.textSizeSmall,
                                          color: ColorUtil.blueLight,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => {print("tapped")},
                                    ),
                                  ]),
                            ),
                          );
                        },
                      )))
                .toList(),
          ),
          Card(
            elevation: 2,
            child: ColoredTabBar(
              ColorUtil.lineColor,
              TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                indicatorColor: ColorUtil.white,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: ColorUtil.primaryColor),
                unselectedLabelColor: ColorUtil.textColor,
                tabs: myTabs,
              ),
            ),
          ),
          Consumer<PartnerBookTabbarProvider>(
            builder: (BuildContext context, PartnerBookTabbarProvider value,
                Widget child) {
              return value.index == 0 ? bookingContent() : productContent();
            },
          )
        ],
      ),
    );
  }

  Widget bookingContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.of(context).choose_client,
              style: TextStyle(
                  color: ColorUtil.textColor,
                  fontSize: SizeUtil.textSizeDefault,
                  fontWeight: FontWeight.bold),
            ),
          ),
          WidgetUtil.getLine(margin: EdgeInsets.all(0), width: 2),
          //todo client list
          Column(
            children: CLIENT_LIST
                .map((ele) => paddingContainer(
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "photo/ic_promo_1.png",
                          width: SizeUtil.iconSize,
                          height: SizeUtil.iconSize,
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        ),
                        Text(
                          ele['address'],
                          style: TextStyle(color: ColorUtil.textHint),
                        )
                      ],
                    ),
                    padding: EdgeInsets.only(
                        left: SizeUtil.smallSpace, top: SizeUtil.smallSpace)))
                .toList(),
          ),
          WidgetUtil.getLine(
              margin: EdgeInsets.only(top: SizeUtil.smallSpace), width: 2),
          //todo choose service title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.of(context).choose_service("25"),
              style: TextStyle(
                  color: ColorUtil.textColor,
                  fontSize: SizeUtil.textSizeDefault,
                  fontWeight: FontWeight.bold),
            ),
          ),
          WidgetUtil.getLine(
              margin: EdgeInsets.only(top: SizeUtil.smallSpace), width: 4),
          //todo select service
          Consumer<ChangeServiceProvider>(
            builder: (BuildContext context, ChangeServiceProvider value,
                Widget child) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 3.3),
                  padding: EdgeInsets.only(
                      left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    bool isSelected = _serviceProvider != null &&
                        _serviceProvider.index == index;
                    return GestureDetector(
                        onTap: () {
                          if (_serviceProvider != null &&
                              _serviceProvider.index != index) {
                            _serviceProvider.onSelectService(index);
                          }
                        },
                        child: ServiceDetailItem(
                          isSelected: isSelected,
                        ));
                  },
                ),
              );
            },
          ),
          //todo book service schedule
          Container(
              padding: const EdgeInsets.only(
                  left: SizeUtil.smallSpace,
                  right: SizeUtil.smallSpace,
                  top: SizeUtil.tinySpace,
                  bottom: SizeUtil.tinySpace),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(SizeUtil.smallRadius),
                )),
                color: ColorUtil.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(SizeUtil.midSpace),
                  child: Text(
                    S.of(context).book,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          ColoredTabBar(
            Color(0xffFFE9D6),
            TabBar(
              controller: _dayTabController,
              labelColor: Colors.white,
              indicatorColor: ColorUtil.white,
              indicatorPadding: EdgeInsets.all(0),
              labelPadding: EdgeInsets.all(0),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Color(0xffFF7700)),
              unselectedLabelColor: ColorUtil.textColor,
              tabs: WEEK
                  .map(
                    (e) => Tab(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              e['dow'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeUtil.textSizeNotiTime),
                            ),
                            Text(
                              e['date'],
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 6),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Consumer<ChangeScheduleTimeProvider>(
            builder: (BuildContext context, ChangeScheduleTimeProvider value,
                Widget child) {
              return Container(
                height: MediaQuery.of(context).size.width / 3.50,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 0.5),
                  padding: EdgeInsets.all(0),
                  itemCount: TIME.length,
                  itemBuilder: (context, index) {
                    bool isSelected = _scheduleTimeProvider != null &&
                        _scheduleTimeProvider.timeIndex == index;
                    return GestureDetector(
                        onTap: () {
                          if (_scheduleTimeProvider != null &&
                              _scheduleTimeProvider.timeIndex != index) {
                            _scheduleTimeProvider.onSelectedTime(index);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.all(1),
                          color: isSelected
                              ? Color(0xffFFE9D6)
                              : ColorUtil.lineColor,
                          child: Center(
                            child: Text(
                              TIME[index]['time'],
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeTiny,
                                  color: isSelected
                                      ? Colors.white
                                      : ColorUtil.textColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ));
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
          )
        ],
      ),
    );
  }

  Widget productContent() {
    return Container(
      child: Column(
        children: <Widget>[
          ListCategory(
          ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width *1.2,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.23),
          padding: EdgeInsets.only(
              left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
          itemCount: 20,
          itemBuilder: (context, index) {
            bool isSelected = _serviceProvider != null &&
                _serviceProvider.index == index;
            return ItemProduct(
              width: MediaQuery.of(context).size.width * 0.5,
              borderRadius: SizeUtil.tinyRadius,
              showSoldCount: false,
              nameStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
              showTime: false,
              padding: EdgeInsets.only(
                  left: SizeUtil.smallSpace,
                  right: SizeUtil.smallSpace,
                  top: 0),
            );
          },
        ),
      ),
        ],
      ),
    );
  }

  Widget paddingContainer(Widget widget,
      {EdgeInsets padding = const EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.tinySpace)}) {
    return Padding(
      padding: padding,
      child: widget,
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [
      ChangeNotifierProvider.value(value: _seeMoreProvider),
      ChangeNotifierProvider.value(value: _bookTabbarProvider),
      ChangeNotifierProvider.value(value: _serviceProvider),
      ChangeNotifierProvider.value(value: _scheduleTimeProvider),
      ChangeNotifierProvider.value(value: _dateProvider),
    ];
  }
}
