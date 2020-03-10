import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking/booking_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';

import 'order_delivery_info_screen.dart';

class OrderDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OrderDetailScreenState();
  }
}

class _OrderDetailScreenState extends BaseState<OrderDetailScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorUtil.primaryColor,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
        appBar: getAppBar(
          title: S.of(context).receive_in_shop,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white,
        ),
        body: SafeArea(
            child: ListView(children: <Widget>[
          WidgetUtil.getLine(
              width: SizeUtil.smallSpace, margin: EdgeInsets.all(0),color: Color(0xffDFDFDF)),
          Container(
              color: Color(0xffFFEDDB),
              padding: const EdgeInsets.only(
                  left: SizeUtil.normalSpace,
                  right: SizeUtil.normalSpace,
                  top: SizeUtil.midSmallSpace,
                  bottom: SizeUtil.midSmallSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Mã đơn hàng: VCB19.12.25\nNgày đặt hàng: 20/12/2019 - 12:25",
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
              WidgetUtil.getLine(width: 1,margin: EdgeInsets.all(0)),
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
                  S.of(context).delivery_address,
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
                "Lê Văn Lĩnh - 0975 441 005\n28 Phan Kế Bính\nPhường Cống Vị, Quận Ba Đình, Hà Nội",
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    height: 1.3,
                    color: Colors.black)),
          ),
              //TODO type of delivery
              WidgetUtil.getLine(width: 1,margin: EdgeInsets.only(top: SizeUtil.tinySpace)),
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
                  S.of(context).type_of_delivery,
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
            child: Text("Giao hàng tận nơi",
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    height: 1.3,
                    color: Colors.black)),
          ),
              //TODO type of checkout
              WidgetUtil.getLine(width: 1,margin: EdgeInsets.only(top: SizeUtil.tinySpace)),
          Padding(
            padding: const EdgeInsets.only(
                left: SizeUtil.normalSpace,
                right: SizeUtil.normalSpace,
                top: SizeUtil.midSmallSpace,
                bottom: SizeUtil.tinySpace),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'photo/ic_payment_method.png',
                  width: SizeUtil.iconSize,
                  height: SizeUtil.iconSize,
                ),
                SizedBox(
                  width: SizeUtil.tinySpace,
                ),
                Text(
                  S.of(context).type_of_checkout,
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
            child: Text("Chuyển khoản qua tài khoản ngân hàng",
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    height: 1.3,
                    color: Colors.black)),
          ),
              //TODO delivery info
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
                  'order_delivering.svg',
                  width: SizeUtil.iconSizeSmall,
                  height: SizeUtil.iconSizeSmall,
                  color: ColorUtil.primaryColor,
                ),
                SizedBox(
                  width: SizeUtil.tinySpace,
                ),
                Text(
                  S.of(context).delivery_info,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeExpressTitle,
                      color: Colors.black),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      push(OrderDeliveryInfoScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Xem lộ trình",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: SizeUtil.textSizeNotiTime),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeUtil.notifyHintSpace, bottom: SizeUtil.tinySpace),
            child: Text(
                "Đơn vị vận chuyển: Giao hàng nhanh (dự kiến giao hàng\ntrước 27/12/2019)",
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    height: 1.3,
                    color: Colors.black)),
          ),
              Padding(
                padding: const EdgeInsets.only(
                    left: SizeUtil.normalSpace,
                    right: SizeUtil.normalSpace,
                    top: SizeUtil.midSmallSpace),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SvgIcon(
                        'target_svg.svg',
                        width: SizeUtil.iconSizeSmall,
                        height: SizeUtil.iconSizeSmall,
                        color: Colors.blue,
                      ),
                      Container(color: Color(0xff6C6C6C),width: 1,height: SizeUtil.defaultSpace,)
                    ],),
                    SizedBox(
                      width: SizeUtil.smallSpace,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                        "Đang vận chuyển",
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeExpressDetail,
                            color: Colors.blue),
                      ),
                      SizedBox(height: SizeUtil.tinySpace,),
                      Text(
                        "25-12-2019 15:42",
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            color: ColorUtil.textColor),
                      ),
                    ],)
                  ],
                ),
              ),
          //TODO type of checkout
          WidgetUtil.getLine(width: 1,margin: EdgeInsets.all(0)),
          Padding(
            padding: const EdgeInsets.only(
                left: SizeUtil.normalSpace,
                right: SizeUtil.normalSpace,
                top: SizeUtil.midSmallSpace,
                bottom: SizeUtil.tinySpace),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'photo/ic_payment_method.png',
                  width: SizeUtil.iconSize,
                  height: SizeUtil.iconSize,
                ),
                SizedBox(
                  width: SizeUtil.tinySpace,
                ),
                Text(
                  S.of(context).type_of_checkout,
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
            child: Column(
                children: List.generate(
                    3,
                    (index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: SizeUtil.midSmallSpace),
                              child: Image.asset("photo/order_img.png",
                                  width: MediaQuery.of(context).size.width / 6),
                            ),
                            SizedBox(width: SizeUtil.tinySpace,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: SizeUtil.smallSpace,
                                ),
                                Text(
                                  S.of(context).order_title,
                                  style: TextStyle(
                                      fontSize: SizeUtil.textSizeSmall),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "SKU: 495212521252125",
                                  style: TextStyle(
                                    height: 1.5,
                                      fontSize: SizeUtil.textSizeNotiTime),
                                  textAlign: TextAlign.start,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "340 000 đ  X ",
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: SizeUtil.textSizeSmall,
                                          color: ColorUtil.textColor,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: " 2",
                                          style: TextStyle(
                                            color: ColorUtil.textColor,
                                            fontSize:
                                                SizeUtil.textSizeSmall,
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: SizeUtil.tinySpace,
                                ),
                              ],
                            )
                          ],
                        ))),
          ),
          WidgetUtil.getLine(
              width: SizeUtil.tinySpace,
              margin: EdgeInsets.all(0),
              color: Color(0xffDFDFDF)),
              Padding(
                padding: const EdgeInsets.only(
                    left: SizeUtil.normalSpace,
                    right: SizeUtil.normalSpace,
                    top: SizeUtil.midSmallSpace,
                    bottom: SizeUtil.midSmallSpace),
                child: Row(
                  children: <Widget>[
                    Text(
                      S.of(context).cost,
                      style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail),
                    ),
                    Spacer(),
                    Text("520.000d",
                        style:
                        TextStyle(fontSize: SizeUtil.textSizeExpressDetail))
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
                    Text(S.of(context).delivery_fee,
                        style:
                        TextStyle(fontSize: SizeUtil.textSizeExpressDetail)),
                    Spacer(),
                    Text("5.000d",
                        style:
                        TextStyle(fontSize: SizeUtil.textSizeExpressDetail))
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
                    Text(S.of(context).total,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeDefault,
                            color: Colors.black)),
                    Spacer(),
                    Text("525.000d",
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeDefault,
                            color: Colors.red,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              WidgetUtil.getLine(
                  width: SizeUtil.tinySpace,
                  color: ColorUtil.lineColor,
                  margin: EdgeInsets.all(0)),
              RaisedButton(
                onPressed: () {
                  //TODO booking
                },
                color: ColorUtil.primaryColor,
                child: Container(
                  padding: EdgeInsets.all(SizeUtil.midSpace),
                  child: Text(
                    S.of(context).booking_submit.toUpperCase(),
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
        ])));
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }
}
