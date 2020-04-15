import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/product_item.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/provider/partner_tabbar_provider.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/provider/see_more_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/dialog/booking_dialogue.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/dialog/booking_schedule_success_dialogue.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/provider/booking_service_detail_provider.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/provider/change_schedule_provider.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/provider/change_service_provider.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/provider/partner_choose_location_provider.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule_success/partner_book_schedule_success_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/view_model/booking_service_view_model.dart';
import 'package:baby_garden_flutter/widget/checkbox/custom_radio_button.dart';
import 'package:baby_garden_flutter/widget/delegate/sliver_category_delegate.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:baby_garden_flutter/item/service_detail_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class PartnerBookScheduleScreen extends StatefulWidget {
  final String shopID;
  final String shopName;
  final String category;

  const PartnerBookScheduleScreen(this.shopID, this.shopName, this.category) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PartnerBookScheduleScreenState();
  }
}

class _PartnerBookScheduleScreenState
    extends BaseStateModel<PartnerBookScheduleScreen, BookingServiceViewModel>
    with TickerProviderStateMixin {
  final SeeMoreProvider _seeMoreProvider = SeeMoreProvider();
  final PartnerChooseLocationProvider _partnerChooseLocation = PartnerChooseLocationProvider();
  final PartnerTabbarProvider _partnerTabbarProvider = PartnerTabbarProvider();
  final ChangeServiceProvider _serviceProvider = ChangeServiceProvider();
  final ChangeScheduleTimeProvider _scheduleTimeProvider = ChangeScheduleTimeProvider();
  final BookingServiceDetailProvider _bookingServiceDetailProvider = BookingServiceDetailProvider();

  TabController _tabController;
  TabController _dayTabController;
  final GlobalKey _rowKey = GlobalKey();
  final GlobalKey _bannerKey = GlobalKey();
  final GlobalKey _rowKeyFull = GlobalKey();
  final ValueNotifier<double> _rowHeight = ValueNotifier<double>(-1);
  double _rowHeightFull = 0;
  double imageHeight = 151;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: 2);
    _dayTabController = TabController(vsync: this, length: 7);
    _tabController.addListener(() {
      _partnerTabbarProvider.onChange();
    });
    _dayTabController.addListener(() {});
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
    _bookingServiceDetailProvider.getdata(widget.shopID);
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    final productTabbarHei = SizeUtil.tabbar_fix_height + 76;
    List<Tab> myTabs = <Tab>[
      Tab(
        text: S.of(context).book,
      ),
      Tab(
        text: S.of(context).product,
      ),
    ];

    //todo get hei set
    return Consumer<BookingServiceDetailProvider>(builder:
        (BuildContext context, BookingServiceDetailProvider shopValue,
            Widget child) {
      print("BookingServiceDetailProvider ${shopValue.data}   ${_rowHeight.value}");
      if(shopValue.data!=null &&_rowHeight.value == -1){
        print("BookingServiceDetailProvider ${shopValue.data}");
        WidgetsBinding.instance.addPostFrameCallback((_) => {
          if (_rowKey.currentContext != null)
            _rowHeight.value = _rowKey.currentContext.size.height,
          //TODO min height
          if (_rowKeyFull.currentContext != null)
            _rowHeightFull = _rowKeyFull.currentContext.size.height,
          //TODO max height
          if (_bannerKey.currentContext != null)
            imageHeight = _bannerKey.currentContext.size.height,
          //TODO max height
          print("addPostFrameCallback ${_rowHeight.value}"),
          //todo min height
          print(_rowHeightFull)
          // todo expand full height
        });

        myTabs = <Tab>[
          Tab(
            text: S.of(context).book,
          ),
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
                    "(${shopValue.products.length.toString()})",
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                  )
                ],
              ),
            ),
          ),
        ];
      }
      return shopValue.data == null
          ? Container()
          : ValueListenableBuilder<double>(
          valueListenable: _rowHeight,
          builder: (BuildContext context, double height, Widget child) {
            return Scaffold(
              body: _rowHeight.value > 0
                  ? NestedScrollView(
                body: TabBarView(
                    controller: _tabController,
                    children: myTabs.map((Tab tab) {
                      return myTabs.indexOf(tab) == 0 ? bookingContent(shopValue.data) : productContent(shopValue.products);
                    }).toList()),
                //todo get height view
                headerSliverBuilder: (context, isScrollInner) {
                  return [
                    new SliverAppBar(
                      title: new Text(widget.shopName, style: TextStyle(color: Colors.white),),
                      leading: BaseState.getLeading(context),
                      centerTitle: true,
                      pinned: true,
                      forceElevated: isScrollInner,
                    ),
                    Consumer<SeeMoreProvider>(
                      builder: (BuildContext context,
                          SeeMoreProvider value, Widget child) {
                        double hei = (value.isShow ? _rowHeightFull : _rowHeight.value) + imageHeight + 7;
                        print("hei: ${hei}");
                        return SliverPersistentHeader(
                          pinned: false,
                          floating: false,
                          delegate: SliverCategoryDelegate(
                              Column(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      shopValue.data != null
                                          ? CachedNetworkImage(
                                        imageUrl: shopValue
                                            .data['img'],
                                        width: MediaQuery.of(
                                            context)
                                            .size
                                            .width,
                                        height: imageHeight,
                                      )
                                          : Image.asset(
                                        "photo/partner_item_img.png",
                                        fit: BoxFit.fitWidth,
                                        width: MediaQuery.of(
                                            context)
                                            .size
                                            .width,
                                        height: imageHeight,
                                      ),
                                      Positioned(
                                        bottom: SizeUtil.smallSpace,
                                        right: SizeUtil.smallSpace,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: SizeUtil
                                                      .midSmallSpace,
                                                  right: SizeUtil
                                                      .midSmallSpace,
                                                  top: SizeUtil
                                                      .tinySpace,
                                                  bottom: SizeUtil
                                                      .tinySpace),
                                              decoration: BoxDecoration(
                                                  color: Color(
                                                      0xffF6F6F6),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          SizeUtil
                                                              .smallRadius))),
                                              child: Wrap(
                                                direction:
                                                Axis.horizontal,
                                                children: <Widget>[
                                                  Image.asset(
                                                    "photo/comment_img.png",
                                                    width: SizeUtil
                                                        .iconSizeDefault,
                                                    height: SizeUtil
                                                        .iconSizeDefault,
                                                  ),
                                                  SizedBox(
                                                    width: SizeUtil
                                                        .tinySpace,
                                                  ),
                                                  Text(
                                                    shopValue.data !=
                                                        null
                                                        ? shopValue
                                                        .data[
                                                    'number_comment']
                                                        : "212",
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
                                              width:
                                              SizeUtil.smallSpace,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: SizeUtil
                                                      .midSmallSpace,
                                                  right: SizeUtil
                                                      .midSmallSpace,
                                                  top: SizeUtil
                                                      .tinySpace,
                                                  bottom: SizeUtil
                                                      .tinySpace),
                                              decoration: BoxDecoration(
                                                  color: Color(
                                                      0xffF6F6F6),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          SizeUtil
                                                              .smallRadius))),
                                              child: Wrap(
                                                direction:
                                                Axis.horizontal,
                                                children: <Widget>[
                                                  Image.asset(
                                                    "photo/heart.png",
                                                    width: SizeUtil
                                                        .iconSizeDefault,
                                                    height: SizeUtil
                                                        .iconSizeDefault,
                                                  ),
                                                  SizedBox(
                                                    width: SizeUtil
                                                        .tinySpace,
                                                  ),
                                                  Text(
                                                    shopValue.data !=
                                                        null
                                                        ? shopValue
                                                        .data['number_like'] : "12",
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
                                  //todo shop info
                                  shopInfo(shopValue.data,
                                      value.isShow, widget.category),
                                  SizedBox(
                                    height: SizeUtil.tinySpace,
                                  ),
                                ],
                              ),
                              hei,
                              hei),
                        );
                      },
                    ),
                    Consumer<PartnerTabbarProvider>(
                      builder: (BuildContext context,
                          PartnerTabbarProvider value, Widget child) {
                        return SliverPersistentHeader(
                          pinned: true,
                          floating: false,
                          delegate: SliverCategoryDelegate(
                              Column(
                                children: <Widget>[
                                  Container(
                                    height:
                                    SizeUtil.tabbar_fix_height,
                                    child: ColoredTabBar(
                                      ColorUtil.lineColor,
                                      TabBar(
                                        onTap: (val) {
                                          _partnerTabbarProvider
                                              .onChange();
                                        },
                                        indicatorWeight: 0,
                                        controller: _tabController,
                                        labelColor: Colors.white,
                                        indicatorColor:
                                        ColorUtil.white,
                                        indicator: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                0),
                                            color: ColorUtil
                                                .primaryColor),
                                        unselectedLabelColor:
                                        ColorUtil.textColor,
                                        tabs: myTabs,
                                      ),
                                    ),
                                    decoration:
                                    BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),
                                    ]),
                                  ),
                                  value.isProduct
                                      ? ListCategory()
                                      : SizedBox()
                                ],
                              ),
                              value.isProduct
                                  ? productTabbarHei
                                  : SizeUtil.tabbar_fix_height,
                              value.isProduct
                                  ? productTabbarHei
                                  : SizeUtil.tabbar_fix_height),
                        );
                      },
                    )
                  ];
                },
              )
                  : Column(
                children: <Widget>[
                  //TODO get detail info min height
                  CachedNetworkImage(
                    imageUrl: shopValue.data['img'],
                    fit: BoxFit.fitWidth,
                    key: _bannerKey,
                    width: MediaQuery.of(context).size.width,
                  ),
                  shopHeiInfo(shopValue.data, false, widget.category,
                      _rowKey),
                  //TODO get detail info max height
                  shopHeiInfo(shopValue.data, true, widget.category,
                      _rowKeyFull)
                ],
              ),
            );
          });
    });
  }

  Widget bookingContent(dynamic data) {
//    print(data['address']);
    dynamic chooseService = data['service']!=null&&data['service'].length>0?data['service'][0]:{};
    String addressChoose= data['address']!=null&&data['address'].length>0?data['address'][0]['address']:"";
    String time = StringUtil.time[0]['time'];
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
            Consumer<PartnerChooseLocationProvider>(builder: (BuildContext context, PartnerChooseLocationProvider value, Widget child) {
                return Column(
                  children: List.generate(data['address']!=null?data['address'].length:0, (index) => CustomRadioButton(
                    titleContent: Text(data['address'][index]['address']),
                    padding: const EdgeInsets.only(
                        left: SizeUtil.smallSpace,
                        top: SizeUtil.smallSpace),
                    value: index,
                    groupValue: value.val,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      addressChoose = data['address'][val]['address'];
                      _partnerChooseLocation.onChange(val);
                    },
                  ))
                );
              },
            ),
            WidgetUtil.getLine(
                margin: EdgeInsets.only(top: SizeUtil.smallSpace), width: 2),
            //todo choose service title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).choose_service(data['service']!=null?data['service'].length:0),
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
                  itemCount: data['service']!=null?data['service'].length:0,
                  itemBuilder: (context, index) {
                    bool isSelected = _serviceProvider != null &&
                        _serviceProvider.index == index;
                    return GestureDetector(
                        onTap: () {
                          if (_serviceProvider != null && _serviceProvider.index != index) {
                            chooseService = data['service'][index];
                            _serviceProvider.onSelectService(index);
                          }
                        },
                        child: ServiceDetailItem(data: data['service'][index],
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
                indicatorPadding: EdgeInsets.all(0),
                labelPadding: EdgeInsets.all(0),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Color(0xffFF7700)),
                unselectedLabelColor: ColorUtil.textColor,
                indicatorWeight: 0,
                tabs: StringUtil.week
                    .map(
                      (e) => Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              color: Colors.white,
                              width: 1,
                            ),
                            Column(
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
                            Container(
                              color: Colors.white,
                              width: 1,
                            ),
                          ],
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
                return Container(
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
                      print(StringUtil.time[index]['off']);
                      return StringUtil.time[index]['off'] == null
                          ? GestureDetector(
                              onTap: () {
                                if (_scheduleTimeProvider != null && _scheduleTimeProvider.timeIndex != index) {
                                  time = StringUtil.time[index]['time'];
                                  _scheduleTimeProvider.onSelectedTime(index);
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.all(1),
                                color: isSelected
                                    ? Color(0xffFF7700)
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
                              ))
                          : Container(
                              margin: EdgeInsets.all(1),
                              color: ColorUtil.red,
                              child: Center(
                                child: Text(
                                  StringUtil.time[index]['time'],
                                  style: TextStyle(
                                      fontSize: SizeUtil.textSizeTiny,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                    },
                  ),
                );
              },
            ),
            //todo booking button
            Container(
                padding: const EdgeInsets.only(
                    left: SizeUtil.smallSpace,
                    right: SizeUtil.smallSpace,
                    top: SizeUtil.tinySpace,
                    bottom: SizeUtil.tinySpace),
                width: MediaQuery.of(context).size.width,
                child: RaisedButton (
                  onPressed: () async{
                    String userId = await ShareValueProvider.shareValueProvider.getUserId();
                    if (userId == null || userId.isEmpty) {
                      if (context != null) {
                        WidgetUtil.showRequireLoginDialog(context);
                      }
                    }else{
                      List<dynamic> confirmForm = [
                        {'title': 'Dịch vụ đã đặt: ', 'content': chooseService['content']},
                        {'title': 'Giá niêm yết:  ', 'content': '\nKhách hàng đã có thẻ hoặc mã voucher vui lòng mang tới cửa hàng để được hưởng đầy đủ ưu đãi.', 'value': chooseService['price']},
                        {'title': 'Ngày sử dụng: ', 'content': StringUtil.week[_dayTabController.index]['date']},
                        {'title': 'Thời gian: ', 'content': time},
                        {'title': 'Thời gian thực hiện: ', 'content': chooseService['ex_time']},
                      ];
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) => BookingDialogue(context,confirmForm,
                              widget.shopID,addressChoose,StringUtil.week[_dayTabController.index]['date'],
                              time,chooseService['id'])).then((value) async => {
                                if(value!=null&&value){
                                  print("true"),
                                  await showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          BookingScheduleSuccessDialogue(context)).then((value) => {
                                            if(value==null||value){
                                              RouteUtil.pushReplacement(context, PartnerBookScheduleSuccessScreen(chooseService,_dayTabController.index,_scheduleTimeProvider.timeIndex))
                                            }
                                  })
                                }else{
                                  print("false")
                                }
                      });

                      }
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

  Widget productContent(List<dynamic> products) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.78),
            padding: EdgeInsets.only(
                left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
            itemCount: products.length,
            itemBuilder: (context, index) {
//              bool isSelected =
//                  _serviceProvider != null && _serviceProvider.index == index;
              return ProductItem(
                product: products[index],
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

  Widget shopInfo(dynamic data, bool isShow, String category) {
    if (data == null) {
      print("shopInfo $data");
      return Container(
        height: 0,
      );
    }
    String content = data['introduce'];
    bool isShowSeeMore = content != null && data['introduce'].length > 100;
    return Column(
      children: <Widget>[
        paddingContainer(Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: "Điện thoại: ",
                    style: TextStyle(
                        color: ColorUtil.textColor,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: " " + data["phone"],
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: ColorUtil.blueLight,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal)),
                    ]),
              ),
            ),
            SizedBox(
              width: SizeUtil.tinySpace,
            ),
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(SizeUtil.smallRadius),
              )),
              color: ColorUtil.primaryColor,
              child: Text(
                data['is_favourite'] == "1" ? "Đã thích" : "Thích",
                style: TextStyle(
                    fontSize: SizeUtil.textSizeDefault,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        )),
        paddingContainer(Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: "Địa chỉ: ",
                    style: TextStyle(
                        color: ColorUtil.textColor,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: data['address'] != null &&
                                  data['address'].length > 0
                              ? data['address'][0]["address"]
                              : "",
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: ColorUtil.textColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal)),
                    ]),
              ),
            ),
            SizedBox(
              width: SizeUtil.tinySpace,
            ),
            SizedBox(
              width: SizeUtil.tinySpace,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Chỉ đường",
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    color: ColorUtil.blueLight),
              ),
            ),
          ],
        )),
        paddingContainer(Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: "Loại dịch vụ: ",
                    style: TextStyle(
                        color: ColorUtil.textColor,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: category,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: ColorUtil.blueLight,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal)),
                    ]),
              ),
            )
          ],
        )),
        paddingContainer(Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (isShowSeeMore) {
                  print("tapped");
                  _seeMoreProvider.onChange();
                }
              },
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: "Giới thiệu: ",
                    style: TextStyle(
                        color: ColorUtil.textColor,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: isShowSeeMore &&!isShow
                              ? content.substring(0, 100)
                              : content,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeExpressDetail,
                              color: ColorUtil.textColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal)),
                      TextSpan(
                        text: isShowSeeMore &&!isShow ? 'See_more':"",
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
            ),
          ],
        )),
      ],
    );
  }

  Widget shopHeiInfo(dynamic data, bool isShow, String category, Key key) {
    if (data == null) {
      print("shopInfo $data");
      return Container(
        height: 0,
      );
    }
    String content = data['introduce'];
    bool isShowSeeMore = content != null && data['introduce'].length > 100;
    return Column(
      key: key,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        paddingContainer(Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: "Điện thoại: ",
                    style: TextStyle(
                        color: ColorUtil.textColor,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: " " + data["phone"],
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: ColorUtil.blueLight,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal)),
                    ]),
              ),
            ),
            SizedBox(
              width: SizeUtil.tinySpace,
            ),
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(SizeUtil.smallRadius),
              )),
              color: ColorUtil.primaryColor,
              child: Text(
                data['is_favourite'] == "1" ? "Đã thích" : "Thích",
                style: TextStyle(
                    fontSize: SizeUtil.textSizeDefault,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        )),
        paddingContainer(Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: "Địa chỉ: ",
                    style: TextStyle(
                        color: ColorUtil.textColor,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: data['address'] != null &&
                                  data['address'].length > 0
                              ? data['address'][0]['address']
                              : "",
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: ColorUtil.textColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal)),
                    ]),
              ),
            ),
            SizedBox(
              width: SizeUtil.tinySpace,
            ),
            SizedBox(
              width: SizeUtil.tinySpace,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Chỉ đường",
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    color: ColorUtil.blueLight),
              ),
            ),
          ],
        )),
        paddingContainer(Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: "Loại dịch vụ: ",
                    style: TextStyle(
                        color: ColorUtil.textColor,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: category,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: ColorUtil.blueLight,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal)),
                    ]),
              ),
            )
          ],
        )),
        paddingContainer(Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (isShowSeeMore) {
                  print("tapped");
                  _seeMoreProvider.onChange();
                }
              },
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: "Giới thiệu: ",
                    style: TextStyle(
                        color: ColorUtil.textColor,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: isShowSeeMore && !isShow
                              ? content.substring(0, 100)
                              : content,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeExpressDetail,
                              color: ColorUtil.textColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal)),
                      TextSpan(
                        text: isShowSeeMore && !isShow ? 'See_more': "",
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
            ),
          ],
        )),
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
      ChangeNotifierProvider.value(value: _serviceProvider),
      ChangeNotifierProvider.value(value: _scheduleTimeProvider),
      ChangeNotifierProvider.value(value: _partnerChooseLocation),
      ChangeNotifierProvider.value(value: _partnerTabbarProvider),
      ChangeNotifierProvider.value(value: _bookingServiceDetailProvider),
    ];
  }

  @override
  BookingServiceViewModel initViewModel() {
    // TODO: implement initViewModel
    return BookingServiceViewModel(context);
  }
}
