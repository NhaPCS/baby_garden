import 'package:baby_garden_flutter/dialog/booking_dialogue.dart';
import 'package:baby_garden_flutter/dialog/booking_schedule_success_dialogue.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_product.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_date_provider.dart';
import 'package:baby_garden_flutter/provider/change_schedule_provider.dart';
import 'package:baby_garden_flutter/provider/change_service_provider.dart';
import 'package:baby_garden_flutter/provider/partner_book_tabbar_provider.dart';
import 'package:baby_garden_flutter/provider/partner_schedule_get_header_hei.dart';
import 'package:baby_garden_flutter/provider/see_more_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/category_product/sliver_category_delegate.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_nested_scrollview.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:baby_garden_flutter/widget/service_detail_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final PartnerGetHeightProvider _getHeightProvider =
      PartnerGetHeightProvider();
  final ChangeServiceProvider _serviceProvider = ChangeServiceProvider();
  final ChangeDateProvider _dateProvider = ChangeDateProvider();
  final ChangeScheduleTimeProvider _scheduleTimeProvider =
      ChangeScheduleTimeProvider();
  final PartnerBookTabbarProvider _bookTabbarProvider =
      PartnerBookTabbarProvider();
  List<dynamic> detailInfo = List();

  TabController _tabController;
  TabController _dayTabController;
  final GlobalKey _rowKey = GlobalKey();
  final GlobalKey _rowKeyFull = GlobalKey();
  final ValueNotifier<double> _rowHeight = ValueNotifier<double>(-1);
  double _rowHeightFull = 0;
  final int imageHeight = 151;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: 2);
    _dayTabController = TabController(vsync: this, length: 7);
    _tabController.addListener(() {
      if (_tabController.index != _bookTabbarProvider.index) {
        _bookTabbarProvider.onChangeIndex(_tabController.index);
      }
    });

    _dayTabController.addListener(() {});

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          _rowHeight.value = _rowKey.currentContext.size.height,//TODO min height
          _rowHeightFull = _rowKeyFull.currentContext.size.height,//TODO max height
          print(_rowHeight.value), //todo min height
          print(_rowHeightFull) // todo expand full height
        });
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
    detailInfo = [
      {
        'title': "Điện thoại:",
        'value': '0912 677 022',
        'valueColor': ColorUtil.blueLight,
        'button': 'ĐÃ THÍCH'
      },
      {
        'title': "Địa chỉ: ",
        'value': '38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội, Thanh Xuân, Hà Nội,',
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
            'Đây là cửa hàng chuyên cung cấp sữa bỉm cho bé, và dịch vụ làm đẹp cho mẹ, để xem thêm thông tin...',
        'full_value':
            'Đây là cửa hàng chuyên cung cấp sữa bỉm cho bé, và dịch vụ làm đẹp cho mẹ, để xem thêm thông tin sau do la ca mot bau troi tu cach. Chua bao gio co mot ai sanh kip anh cua em o day Chua bao gio co mot ai sanh kip anh cua em o day Chua bao gio co mot ai sanh kip anh cua em o day',
        'see_more': 'Xem thêm'
      }
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

    //todo get hei set
    return Consumer<PartnerGetHeightProvider>(builder:
        (BuildContext context, PartnerGetHeightProvider value, Widget child) {
      //todo ValueListenableBuilder is observe view height value <_rowheight>
      return ValueListenableBuilder<double>(
          valueListenable: _rowHeight,
          builder: (BuildContext context, double height, Widget child) {
            return Scaffold(
              body: _rowHeight.value > 0
                  ? NestedScrollView(
                body: TabBarView(
                    controller: _tabController,
                    children: myTabs.map((Tab tab) {
                      return myTabs.indexOf(tab) == 0 ? bookingContent()
                          : productContent();
                    }).toList()
                ),
                //todo get height view
                headerSliverBuilder: (context, isScrollInner) {
                  return [
                    new SliverAppBar(
                      title: new Text(
                        S.of(context).app_name_title.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: BaseState.getLeading(context),
                      centerTitle: true,
                      pinned: true,
                      forceElevated: isScrollInner,
                    ),
                    Consumer<SeeMoreProvider>(builder: (BuildContext context, SeeMoreProvider value, Widget child) {
                      double hei = (value.isShow?_rowHeightFull:_rowHeight.value) + imageHeight;
                      print("hei: ${hei}");
                      return SliverPersistentHeader(
                        pinned: false,
                        floating: false,
                        delegate: SliverCategoryDelegate(
                            Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Image.asset(
                                      "photo/partner_item_img.png",
                                      fit: BoxFit.fitWidth,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width,
                                      height: 146,
                                    ),
                                    Positioned(
                                      bottom: SizeUtil.smallSpace,
                                      right: SizeUtil.smallSpace,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: SizeUtil
                                                    .midSmallSpace,
                                                right: SizeUtil
                                                    .midSmallSpace,
                                                top: SizeUtil.tinySpace,
                                                bottom:
                                                SizeUtil.tinySpace),
                                            decoration: BoxDecoration(
                                                color: Color(0xffF6F6F6),
                                                borderRadius: BorderRadius
                                                    .all(Radius.circular(
                                                    SizeUtil
                                                        .smallRadius))),
                                            child: Wrap(
                                              direction: Axis.horizontal,
                                              children: <Widget>[
                                                Image.asset(
                                                  "photo/comment_img.png",
                                                  width: SizeUtil
                                                      .iconSizeDefault,
                                                  height: SizeUtil
                                                      .iconSizeDefault,
                                                ),
                                                SizedBox(
                                                  width:
                                                  SizeUtil.tinySpace,
                                                ),
                                                Text(
                                                  "12",
                                                  style: TextStyle(
                                                      fontSize: SizeUtil
                                                          .textSizeSmall,
                                                      color: ColorUtil
                                                          .textColor,
                                                      fontWeight:
                                                      FontWeight
                                                          .normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: SizeUtil.smallSpace,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: SizeUtil
                                                    .midSmallSpace,
                                                right: SizeUtil
                                                    .midSmallSpace,
                                                top: SizeUtil.tinySpace,
                                                bottom:
                                                SizeUtil.tinySpace),
                                            decoration: BoxDecoration(
                                                color: Color(0xffF6F6F6),
                                                borderRadius: BorderRadius
                                                    .all(Radius.circular(
                                                    SizeUtil
                                                        .smallRadius))),
                                            child: Wrap(
                                              direction: Axis.horizontal,
                                              children: <Widget>[
                                                Image.asset(
                                                  "photo/heart.png",
                                                  width: SizeUtil
                                                      .iconSizeDefault,
                                                  height: SizeUtil
                                                      .iconSizeDefault,
                                                ),
                                                SizedBox(
                                                  width:
                                                  SizeUtil.tinySpace,
                                                ),
                                                Text(
                                                  "234",
                                                  style: TextStyle(
                                                      fontSize: SizeUtil
                                                          .textSizeSmall,
                                                      color: ColorUtil
                                                          .textColor,
                                                      fontWeight:
                                                      FontWeight
                                                          .normal),
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
                                  children: detailInfo // info
                                      .map(
                                          (e) => paddingContainer(
                                          e['see_more'] == null
                                              ? Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                child: RichText(
                                                  textAlign:
                                                  TextAlign
                                                      .start,
                                                  text: TextSpan(
                                                      text: e[
                                                      'title'],
                                                      style: TextStyle(
                                                          color: ColorUtil
                                                              .textColor,
                                                          fontWeight: FontWeight
                                                              .bold),
                                                      children: <
                                                          TextSpan>[
                                                        TextSpan(

                                                            text: " "+ e['value'],
                                                            style: TextStyle(fontSize: SizeUtil.textSizeSmall, color: e['valueColor'] == null ? ColorUtil.textColor : e['valueColor'], decoration: TextDecoration.none, fontWeight: FontWeight.normal)),
                                                      ]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: SizeUtil
                                                    .tinySpace,
                                              ),
                                              SizedBox(width: e['action_title'] ==
                                                  null
                                                  ?0:SizeUtil.tinySpace,),
                                              e['action_title'] ==
                                                  null
                                                  ? SizedBox()
                                                  : InkWell(
                                                onTap:
                                                    () {},
                                                child:
                                                Text(
                                                  e['action_title'],
                                                  style: TextStyle(
                                                      fontSize:
                                                      SizeUtil.textSizeSmall,
                                                      color: ColorUtil.blueLight),
                                                ),
                                              ),
                                              e['button'] ==
                                                  null
                                                  ? SizedBox()
                                                  : RaisedButton(
                                                onPressed:
                                                    () {},
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(
                                                          SizeUtil.smallRadius),
                                                    )),
                                                color: ColorUtil
                                                    .primaryColor,
                                                child:
                                                Text(
                                                  e['button'],
                                                  style: TextStyle(
                                                      fontSize:
                                                      SizeUtil.textSizeDefault,
                                                      color: Colors.white,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.normal),
                                                ),
                                              ),
                                            ],
                                          )
                                              : GestureDetector(
                                            onTap: () {
                                              print("tapped");
                                              _seeMoreProvider
                                                  .onChange();
                                            },
                                            child:
                                            RichText(
                                              textAlign:
                                              TextAlign
                                                  .start,
                                              text: TextSpan(
                                                  text: e[
                                                  'title'],
                                                  style: TextStyle(
                                                      color: ColorUtil
                                                          .textColor,
                                                      fontWeight: FontWeight
                                                          .bold),
                                                  children: <
                                                      TextSpan>[
                                                    TextSpan(
                                                        text: value.isShow
                                                            ? e['full_value']
                                                            : e['value'],
                                                        style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail, color: ColorUtil.textColor, decoration: TextDecoration.none, fontWeight: FontWeight.normal)),
                                                    TextSpan(
                                                      text: value.isShow
                                                          ? ''
                                                          : e['see_more'],
                                                      style: TextStyle(
                                                          fontSize: SizeUtil.textSizeSmall,
                                                          color: ColorUtil.blueLight,
                                                          decoration: TextDecoration.none,
                                                          fontWeight: FontWeight.normal),
                                                      recognizer: TapGestureRecognizer()
                                                        ..onTap = () =>
                                                        {
                                                          print("tapped")
                                                        },
                                                    ),
                                                  ]),
                                            ),
                                          )))
                                      .toList(),
                                ),
                                SizedBox(
                                  height: SizeUtil.tinySpace,
                                ),
                              ],
                            ),
                            hei,
                            hei),
                      );
                    },),
                    SliverPersistentHeader(
                      pinned: true,
                      floating: false,
                      delegate: SliverCategoryDelegate(
                          Container(
                            height: SizeUtil.tabbar_fix_height,
                            child: ColoredTabBar(
                              ColorUtil.lineColor,
                              TabBar(
                                controller: _tabController,
                                labelColor: Colors.white,
                                indicatorColor: ColorUtil.white,
                                indicator: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(0),
                                    color: ColorUtil.primaryColor),
                                unselectedLabelColor:
                                ColorUtil.textColor,
                                tabs: myTabs,
                              ),
                            ),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ]),
                          ),
                          SizeUtil.tabbar_fix_height,
                          SizeUtil.tabbar_fix_height),
                    )
                  ];
                },
              )
                  : Column(
                children: <Widget>[
                  //TODO get detail info min height
                  Column(
                    key: _rowKey,
                    mainAxisSize: MainAxisSize.min,
                    children: detailInfo // info
                        .map((e) => paddingContainer(e['see_more'] ==
                        null
                        ? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: RichText(
                            textAlign:
                            TextAlign
                                .start,
                            text: TextSpan(
                                text: e[
                                'title'],
                                style: TextStyle(
                                    color: ColorUtil
                                        .textColor,
                                    fontWeight: FontWeight
                                        .bold),
                                children: <
                                    TextSpan>[
                                  TextSpan(

                                      text: " "+ e['value'],
                                      style: TextStyle(fontSize: SizeUtil.textSizeSmall, color: e['valueColor'] == null ? ColorUtil.textColor : e['valueColor'], decoration: TextDecoration.none, fontWeight: FontWeight.normal)),
                                ]),
                          ),
                        ),
                        SizedBox(
                          width: SizeUtil
                              .tinySpace,
                        ),
                        SizedBox(width: e['action_title'] ==
                            null
                            ?0:SizeUtil.tinySpace,),
                        e['action_title'] ==
                            null
                            ? SizedBox()
                            : InkWell(
                          onTap:
                              () {},
                          child:
                          Text(
                            e['action_title'],
                            style: TextStyle(
                                fontSize:
                                SizeUtil.textSizeSmall,
                                color: ColorUtil.blueLight),
                          ),
                        ),
                        e['button'] ==
                            null
                            ? SizedBox()
                            : RaisedButton(
                          onPressed:
                              () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    SizeUtil.smallRadius),
                              )),
                          color: ColorUtil
                              .primaryColor,
                          child:
                          Text(
                            e['button'],
                            style: TextStyle(
                                fontSize:
                                SizeUtil.textSizeDefault,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    )
                        : RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: e['title'],
                          style: TextStyle(
                              color: ColorUtil.textColor,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: e['value'],
                                style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail, color: ColorUtil.textColor, decoration: TextDecoration.none, fontWeight: FontWeight.normal)),
                            TextSpan(
                              text:  e['see_more'],
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeSmall,
                                  color: ColorUtil.blueLight,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal),
                            ),
                          ]),
                    )))
                        .toList(),
                  ),
                  //TODO get detail info max height
                  Column(
                    key: _rowKeyFull,
                    mainAxisSize: MainAxisSize.min,
                    children: detailInfo // info
                        .map((e) => paddingContainer(e['see_more'] ==
                        null
                        ? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: RichText(
                            textAlign:
                            TextAlign
                                .start,
                            text: TextSpan(
                                text: e[
                                'title'],
                                style: TextStyle(
                                    color: ColorUtil
                                        .textColor,
                                    fontWeight: FontWeight
                                        .bold),
                                children: <
                                    TextSpan>[
                                  TextSpan(

                                      text: " "+ e['value'],
                                      style: TextStyle(fontSize: SizeUtil.textSizeSmall, color: e['valueColor'] == null ? ColorUtil.textColor : e['valueColor'], decoration: TextDecoration.none, fontWeight: FontWeight.normal)),
                                ]),
                          ),
                        ),
                        SizedBox(
                          width: SizeUtil
                              .tinySpace,
                        ),
                        SizedBox(width: e['action_title'] ==
                            null
                            ?0:SizeUtil.tinySpace,),
                        e['action_title'] ==
                            null
                            ? SizedBox()
                            : InkWell(
                          onTap:
                              () {},
                          child:
                          Text(
                            e['action_title'],
                            style: TextStyle(
                                fontSize:
                                SizeUtil.textSizeSmall,
                                color: ColorUtil.blueLight),
                          ),
                        ),
                        e['button'] ==
                            null
                            ? SizedBox()
                            : RaisedButton(
                          onPressed:
                              () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    SizeUtil.smallRadius),
                              )),
                          color: ColorUtil
                              .primaryColor,
                          child:
                          Text(
                            e['button'],
                            style: TextStyle(
                                fontSize:
                                SizeUtil.textSizeDefault,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    )
                        : RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: e['title'],
                          style: TextStyle(
                              color: ColorUtil.textColor,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: e['full_value'],
                                style: TextStyle(
                                    fontSize: SizeUtil
                                        .textSizeExpressDetail,
                                    color:
                                    ColorUtil.textColor,
                                    decoration:
                                    TextDecoration.none,
                                    fontWeight:
                                    FontWeight.normal)),
                          ]),
                    )))
                        .toList(),
                  ),
                ],
              ),
            );
          });
    });
  }

  Widget bookingContent() {
    return ListView(
      children: <Widget>[
        Column(
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
              children: StringUtil.clientList
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
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 3.3),
                  padding: EdgeInsets.only(
                      left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
                  itemCount: 10,
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
                );
              },
            ),
            WidgetUtil.getLine(margin: EdgeInsets.all(0), width: 2),
            //todo choose service title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).choose_time,
                style: TextStyle(
                    color: ColorUtil.textColor,
                    fontSize: SizeUtil.textSizeDefault,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //TODO date of week tabbar
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
                tabs: StringUtil.week
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
                                fontWeight: FontWeight.normal, fontSize: 6),
                          )
                        ],
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
            //TODO schedule time of day
            Consumer<ChangeScheduleTimeProvider>(
              builder: (BuildContext context, ChangeScheduleTimeProvider value,
                  Widget child) {
                return
                  Container(
                  height: MediaQuery.of(context).size.width / 3.50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 0.5),
                    padding: EdgeInsets.all(0),
                    itemCount: StringUtil.time.length,
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
                                ? ColorUtil.primaryColor
                                : ColorUtil.lineColor,
                            child: Center(
                              child: Text(
                                StringUtil.time[index]['time'],
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
            Container(
                padding: const EdgeInsets.only(
                    left: SizeUtil.smallSpace,
                    right: SizeUtil.smallSpace,
                    top: SizeUtil.tinySpace,
                    bottom: SizeUtil.tinySpace),
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            BookingDialogue(context));
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
          ],
        ),
      ],
    );
  }

  Widget productContent() {
    return Column(
      children: <Widget>[
        ListCategory(),
        Expanded(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.78),
            padding: EdgeInsets.only(
                left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
            itemCount: 20,
            itemBuilder: (context, index) {
              bool isSelected =
                  _serviceProvider != null && _serviceProvider.index == index;
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
      ChangeNotifierProvider.value(value: _getHeightProvider),
    ];
  }
}
