import 'package:baby_garden_flutter/dialog/receive_barcode_dialogue.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/booking_detail_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ServiceDetailScreen extends StatefulWidget{
  final String title;
  final String bookingId;
  const ServiceDetailScreen({this.title,this.bookingId="0"}):super();
  @override
  State<StatefulWidget> createState() {
    return _ServiceDetailScreenState();
  }

}

class _ServiceDetailScreenState extends BaseState<ServiceDetailScreen>{
  final BookingDetailProvider _bookingDetailProvider = BookingDetailProvider();
  ServiceState state = ServiceState.NONE;
  @override
  void initState() {
    // TODO: implement initState
    _bookingDetailProvider.getBookingDetail(widget.bookingId);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          title: widget.title,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Consumer<BookingDetailProvider>(builder: (BuildContext context, BookingDetailProvider value, Widget child) {
            if(value.bookingDetailData==null)
              return Container();
            var bookingDetailData = value.bookingDetailData;
            initView(int.parse(bookingDetailData['active']));
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  WidgetUtil.getLine(
                      width: SizeUtil.smallSpace,
                      margin: EdgeInsets.all(0),
                      color: ColorUtil.lineService),
                  Container(
                      color: ColorUtil.bgService,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                          left: SizeUtil.normalSpace,
                          right: SizeUtil.normalSpace,
                          top: SizeUtil.midSmallSpace,
                          bottom: SizeUtil.midSmallSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            S.of(context).service_header(bookingDetailData['code'], bookingDetailData['date_booking'], bookingDetailData['time_booking']),
                            style: TextStyle(height: 1.5),
                          ),
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: S.of(context).supply_by,
                                  style: TextStyle(
                                      color: ColorUtil.textColor,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5)),
                              TextSpan(
                                  text: bookingDetailData['shop_name'],
                                  style: TextStyle(
                                      color: ColorUtil.primaryColor,
                                      fontWeight: FontWeight.bold))
                            ]),
                          )
                        ],
                      )),
                  //TODO delivery address
                  WidgetUtil.getLine(width: 1, margin: EdgeInsets.all(0)),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.normalSpace,
                        right: SizeUtil.normalSpace,
                        top: SizeUtil.midSmallSpace,
                        bottom: SizeUtil.tinySpace),
                    child: Row(
                      children: <Widget>[
                        SvgIcon(
                          'ic_receive_location.svg',
                          width: SizeUtil.iconSize,
                          height: SizeUtil.iconSize,
                          color: ColorUtil.primaryColor,
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        ),
                        Text(
                          S
                              .of(context)
                              .service_using_address,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeExpressTitle,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeUtil.notifyHintSpace, bottom: SizeUtil.tinySpace),
                    child: Text(
                        value.bookingDetailData['address'],
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            height: 1.3,
                            color: Colors.black)),
                  ),
                  //TODO type of delivery
                  WidgetUtil.getLine(
                      width: 1, margin: EdgeInsets.only(top: SizeUtil.tinySpace)),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.normalSpace,
                        right: SizeUtil.normalSpace,
                        top: SizeUtil.midSmallSpace,
                        bottom: SizeUtil.tinySpace),
                    child: Row(
                      children: <Widget>[
                        SvgIcon(
                          'ic_receive_method.svg',
                          width: SizeUtil.iconSize,
                          height: SizeUtil.iconSize,
                          color: ColorUtil.primaryColor,
                        ),
                        SizedBox(
                          width: SizeUtil.tinySpace,
                        ),
                        Text(
                          S
                              .of(context)
                              .time_using,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeExpressTitle,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeUtil.notifyHintSpace, bottom: SizeUtil.tinySpace),
                    child: Text("120 phút",
                        style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          height: 1.3,)),
                  ),
                  //TODO type of checkout
                  WidgetUtil.getLine(
                      width: 1, margin: EdgeInsets.only(top: SizeUtil.tinySpace)),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.normalSpace,
                        right: SizeUtil.normalSpace,
                        top: SizeUtil.midSmallSpace,
                        bottom: SizeUtil.tinySpace),
                    child: Row(
                      children: <Widget>[
                        SvgIcon(
                          'ic_payment_method.svg',
                          width: SizeUtil.iconSize,
                          height: SizeUtil.iconSize,
                        ),
                        SizedBox(
                          width: SizeUtil.tinySpace,
                        ),
                        Text(
                          S
                              .of(context)
                              .date_using,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeExpressTitle,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeUtil.notifyHintSpace, bottom: SizeUtil.tinySpace),
                    child: Text("12/04/2020 10:00",
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            height: 1.3,
                            color: Colors.black)),
                  ),
                  //TODO type of checkout
                  WidgetUtil.getLine(width: 1, margin: EdgeInsets.all(0)),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.normalSpace,
                        right: SizeUtil.normalSpace,
                        top: SizeUtil.midSmallSpace,
                        bottom: SizeUtil.tinySpace),
                    child: Row(
                      children: <Widget>[
                        SvgIcon(
                          'order_info.svg',
                          width: SizeUtil.iconSize,
                          height: SizeUtil.iconSize,
                        ),
                        SizedBox(
                          width: SizeUtil.tinySpace,
                        ),
                        Text(
                          S
                              .of(context)
                              .service_info,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeExpressTitle,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeUtil.normalSpace, bottom: SizeUtil.tinySpace),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: SizeUtil.midSmallSpace),
                          child: Image.asset("photo/order_img.png",
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 6),
                        ),
                        SizedBox(
                          width: SizeUtil.tinySpace,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: SizeUtil.smallSpace,
                            ),
                            Text(
                              "Chăm sóc da mặt từ cơ bản đến nâng cao",
                              style: TextStyle(color: ColorUtil.textColor,
                                  fontSize: SizeUtil.textSizeExpressDetail,fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "Loại dịch vụ: SPA Thẩm mý, Khám thai",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: SizeUtil.textSizeNoticeTime),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: SizeUtil.tinySpace,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  WidgetUtil.getLine(
                      width: 1,
                      margin: const EdgeInsets.only(
                          left: SizeUtil.normalSpace,
                          right: SizeUtil.normalSpace,
                          top: SizeUtil.midSmallSpace,
                          bottom: SizeUtil.midSmallSpace),
                      color: Color(0xffDFDFDF)),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.normalSpace,
                        right: SizeUtil.normalSpace,
                        bottom: SizeUtil.midSmallSpace),
                    child: RichText(
                      text: TextSpan(
                        // TODO-Hung: cho vao file arb
                          text: "Tổng đơn: ",
                          style: TextStyle(
                              height: 1.5,
                              fontSize: SizeUtil.textSizeSmall,
                              color: ColorUtil.textColor,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: value.bookingDetailData['total_money'],
                              style: TextStyle(
                                color: ColorUtil.red,
                                fontSize: SizeUtil
                                    .textSizeSmall,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  state==2?Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      WidgetUtil.getLine(
                          width: 1,
                          color: ColorUtil.lineColor,
                          margin: EdgeInsets.all(0)),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: SizeUtil.normalSpace,
                            right: SizeUtil.normalSpace,
                            top: SizeUtil.midSmallSpace,
                            bottom: SizeUtil.midSmallSpace),
                        child: Row(
                          children: <Widget>[
                            Text(S.of(context).cancel_by,
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeExpressDetail)),
                            Spacer(),
                            Text("người đặt",
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeExpressDetail, color: ColorUtil.primaryColor))
                          ],
                        ),
                      ),
                      WidgetUtil.getLine(
                          width: 1,
                          color: ColorUtil.lineColor,
                          margin: EdgeInsets.all(0)),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: SizeUtil.normalSpace,
                            right: SizeUtil.normalSpace,
                            top: SizeUtil.midSmallSpace,
                            bottom: SizeUtil.midSmallSpace),
                        child: Row(
                          children: <Widget>[
                            Text(S.of(context).cancel_time,
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeExpressDetail)),
                            Spacer(),
                            Text(value.bookingDetailData['time_cancel'],
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeExpressDetail))
                          ],
                        ),
                      ),
                      WidgetUtil.getLine(
                          width: 1,
                          color: ColorUtil.lineColor,
                          margin: EdgeInsets.all(0)),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: SizeUtil.normalSpace,
                            right: SizeUtil.normalSpace,
                            top: SizeUtil.midSmallSpace,
                            bottom: SizeUtil.midSmallSpace),
                        child: Row(
                          children: <Widget>[
                            Text(S.of(context).cancel_reason,
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeExpressDetail)),
                            Spacer(),
                            Text(value.bookingDetailData['reason_cancel'],
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeExpressDetail))
                          ],
                        ),
                      ),
                    ],):Spacer(),
                  state!=ServiceState.CONFIRM?Column(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: () {
                          //TODO booking
                          if(state==ServiceState.BOOKED_SCHEDULE){
                            showDialog(context: context, builder: (BuildContext context) => ReceiveBarCodeDialogue());
                          }else {
                            push(RatingDetailScreen());
                          }
                        },
                        color: ColorUtil.primaryColor,
                        child: Container(
                          padding: EdgeInsets.all(SizeUtil.midSpace),
                          child: Text(
                            state==ServiceState.BOOKED_SCHEDULE?S
                                .of(context)
                                .use_service
                                .toUpperCase():S
                                .of(context)
                                .rating_service
                                .toUpperCase(),
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeDefault,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    state==ServiceState.BOOKED_SCHEDULE?Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: () {
                          //TODO booking
                          Navigator.of(context).pop();
                        },
                        color: ColorUtil.primaryColor,
                        child: Container(
                          padding: EdgeInsets.all(SizeUtil.midSpace),
                          child: Text(
                            S
                                .of(context)
                                .cancel_schedule
                                .toUpperCase(),
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeDefault,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ):SizedBox()
                  ],):SizedBox()
                ]);
          },),
        ));
  }

  void initView(int active) {
    state = ServiceState.values[active];

    switch (state) {
      case ServiceState.BOOKED_SCHEDULE: //đã đặt
        break;
      case ServiceState.USED_SERVICE: //xác nhận
        break;
      default:
        break;
    }
  }
  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _bookingDetailProvider)];
  }

}