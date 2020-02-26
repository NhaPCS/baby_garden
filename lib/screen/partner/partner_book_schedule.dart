import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/see_more_provider.dart';
import 'package:baby_garden_flutter/provider/segment_control_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/rated_detail/rated_detail_screen.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/colored_tabbar.dart';
import 'package:baby_garden_flutter/widget/order_item.dart';
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
    extends BaseState<PartnerBookScheduleScreen>
    with SingleTickerProviderStateMixin {
  final SeeMoreProvider _seeMoreProvider = SeeMoreProvider();
  final SegmentControlProvider _segmentControlProvider =
      new SegmentControlProvider();
  List<dynamic> DETAIL_INFO = List();
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
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
      body: Column(
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
                tabs:myTabs,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: myTabs.map((Tab tab) {
                return myTabs.indexOf(tab) == 0?bookingContent():productContent();
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget bookingContent(){
    return ListView(
      children: <Widget>[
        Container(height: 120,width: 120,color: ColorUtil.primaryColor,)
      ],
    );
  }

  Widget productContent(){
    return ListView(
      children: <Widget>[
        Container(height: 120,width: 120,color: ColorUtil.colorAccent,)
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
    ];
  }


}
