import 'package:baby_garden_flutter/dialog/receive_barcode_dialogue.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/booking_detail_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/checkout/checkout_screen.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../order_delivery_info/order_delivery_info_screen.dart';

// TODO-Hung: screen mới thì move ra folder mới, không để chung
class OrderDetailScreen extends StatefulWidget {
  final bool isShowPositiveButton;
  final bool isShowNegativeButton;
  final String title;
  final int state;
  final String bookingId;

  const OrderDetailScreen(
      {Key key,
      this.title,
      this.isShowNegativeButton = false,
      this.isShowPositiveButton = false,
      this.state = 0, this.bookingId = "0"})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OrderDetailScreenState();
  }
}

class _OrderDetailScreenState extends BaseState<OrderDetailScreen> {
  final BookingDetailProvider _bookingDetailProvider = BookingDetailProvider();

  @override
  void initState() {
    // TODO: implement initState
    _bookingDetailProvider.getBookingDetail(widget.bookingId);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    bool isDelivering = widget.state == 4;
    return Scaffold(
        appBar: getAppBar(
          title: widget.title != null
              ? widget.title
              : S.of(context).receive_in_shop,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white,
        ),
        // TODO-Hung: SafeArea de lam gi?
        body: SafeArea(
            child: ListView(children: <Widget>[
          WidgetUtil.getLine(
              width: SizeUtil.smallSpace,
              margin: EdgeInsets.all(0),
              color: Color(0xffDFDFDF)),
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
                    // TODO-Hung: move vao file arb
                    "Mã đơn hàng: VCB19.12.25\nNgày đặt hàng: 20/12/2019 - 12:25",
                    style: TextStyle(height: 1.5),
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        // TODO-Hung: move vao file arb
                          text: "Cung cấp bởi:",
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
              // TODO-Hung: thấy nhiều widget tương đồng, viết ra 1 hàm cho gọn
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
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              children: <Widget>[
                Text("Giao hàng tận nơi.",
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        height: 1.3,
                        color: Colors.black)),
                isDelivering
                    ? SizedBox()
                    : Text(" (Thời gian: 09:00-12:00 22/12/2019)",
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeTiny,
                            height: 1.3,
                            color: Colors.blue)),
              ],
            ),
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
          isDelivering
              ? Column(
            // TODO-Hung: cái đường mô tả đang vận chuyển này hình như dùng nhiều màn. move ra widget riêng
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //TODO delivery info
                    WidgetUtil.getLine(
                        width: 1,
                        margin: EdgeInsets.only(top: SizeUtil.tinySpace)),
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
                          left: SizeUtil.notifyHintSpace,
                          bottom: SizeUtil.tinySpace),
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
                          Column(
                            children: <Widget>[
                              Icon(
                                Icons.radio_button_checked,
                                size: SizeUtil.iconSizeSmall,
                                color: Colors.blue,
                              ),
                              Container(
                                color: Color(0xff6C6C6C),
                                width: 1,
                                height: SizeUtil.defaultSpace,
                              )
                            ],
                          ),
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
                              SizedBox(
                                height: SizeUtil.tinySpace,
                              ),
                              Text(
                                "25-12-2019 15:42",
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeSmall,
                                    color: ColorUtil.textColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : SizedBox(),
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
                  S.of(context).order_info,
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
                    // TODO-Hung: nó là 1 item, để ra widget riêng trong folder item
                    (index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: SizeUtil.midSmallSpace),
                              // TODO-Hung: không add ảnh test vào resource, dùng ảnh mạng trong StringUtil.dummyImage
                              child: Image.asset("photo/order_img.png",
                                  width: MediaQuery.of(context).size.width / 6),
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
                                            fontSize: SizeUtil.textSizeSmall,
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
                    style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail))
              ],
            ),
          ),
          WidgetUtil.getLine(
              width: 1, color: ColorUtil.lineColor, margin: EdgeInsets.all(0)),
          Padding(
            padding: const EdgeInsets.only(
                left: SizeUtil.normalSpace,
                right: SizeUtil.normalSpace,
                top: SizeUtil.midSmallSpace,
                bottom: SizeUtil.midSmallSpace),
            child: Row(
              children: <Widget>[
                Text(S.of(context).delivery_fee,
                    style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail)),
                Spacer(),
                Text("5.000d",
                    style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail))
              ],
            ),
          ),
          WidgetUtil.getLine(
              width: 1, color: ColorUtil.lineColor, margin: EdgeInsets.all(0)),
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
              widget.state==6?Column(
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
                        // TODO-Hung: move to arb file
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
                        // TODO-Hung: move to arb file
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
                ],):SizedBox(),
          WidgetUtil.getLine(
              width: SizeUtil.tinySpace,
              color:
                  isDelivering ? ColorUtil.white : ColorUtil.lineColor,
              margin: EdgeInsets.all(0)),
          widget.isShowPositiveButton
              ? RaisedButton(
                onPressed: () {
                  //TODO booking
                  if (widget.state == 0) {
                    push(CheckoutScreen());
                  } else if (widget.state == 2){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            ReceiveBarCodeDialogue());
                  }else{
                    push(RatingDetailScreen());
                  }
                },
                color: ColorUtil.primaryColor,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(SizeUtil.midSpace),
                  child: Text(
                    widget.state == 0
                        ? S.of(context).checkout.toUpperCase()
                        : widget.state == 2 ? S.of(context).receive.toUpperCase():S.of(context).rating_order,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ):SizedBox(
            height: SizeUtil.smallSpace,),
              // TODO-Hung: dung MyRaisedButton
              widget.isShowNegativeButton?RaisedButton(
                onPressed: () {
                  //TODO booking
                  // TODO-Hung: move to arb file
                  WidgetUtil.showConfirmDialog(context,
                      message: "Bạn có muốn thực sự muốn huỷ ?",
                      title: "Chú ý", positiveClicked: () {
                        Navigator.of(context).pop();
                      }, negativeClick: () {
                        Navigator.of(context).pop();
                      });
                },
                color: ColorUtil.primaryColor,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(SizeUtil.midSpace),
                  child: Text(
                    S.of(context).cancel.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ):SizedBox(
                height: SizeUtil.smallSpace,)
        ])));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _bookingDetailProvider)];
  }
}
