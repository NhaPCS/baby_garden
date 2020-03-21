import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';

class ServiceDetailScreen extends StatefulWidget{
  final String title;
  final bool isBookedSchedule;
  final bool isCancel;

  const ServiceDetailScreen({Key key,this.title,this.isBookedSchedule = false,this.isCancel = false}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ServiceDetailScreenState();
  }

}

class _ServiceDetailScreenState extends BaseState<ServiceDetailScreen>{
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            WidgetUtil.getLine(
                width: SizeUtil.smallSpace,
                margin: EdgeInsets.all(0),
                color: Color(0xffDFDFDF)),
            Container(
                color: Color(0xffFFEDDB),
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
                      "Mã đơn hàng: VCB19.12.25\nNgày đặt lịch: 20/12/2019 - 12:25",
                      style: TextStyle(height: 1.5),
                    ),
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Cung cấp bởi: Vườn Của Bé",
                            style: TextStyle(
                                color: ColorUtil.textColor,
                                fontWeight: FontWeight.normal,
                                height: 1.5)),
                        TextSpan(
                            text: " Vườn Của Bé",
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
                  "Vườn của bé\n0912677022\n38 Nguyễn Viết Xuan, Thanh Xuan, Hà Nội",
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
                            fontSize: SizeUtil.textSizeNotiTime),
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
                    text: "Tổng đơn: ",
                    style: TextStyle(
                        height: 1.5,
                        fontSize: SizeUtil.textSizeSmall,
                        color: ColorUtil.textColor,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: " 700.000 đ",
                        style: TextStyle(
                          color: ColorUtil.red,
                          fontSize: SizeUtil
                              .textSizeSmall,
                        ),
                      ),
                    ]),
              ),
            ),
            widget.isCancel?Column(
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
                    Text("Hủy bởi",
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
                    Text("Hủy vào lúc",
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeExpressDetail)),
                    Spacer(),
                    Text("12/01/2020 13:40",
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
                    Text("Lý do hủy",
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeExpressDetail)),
                    Spacer(),
                    Text("Muốn thay đổi loại dịch vụ",
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeExpressDetail))
                  ],
                ),
              ),
            ],):Spacer(),
            widget.isBookedSchedule?Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  //TODO booking
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
          ]),
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }

}