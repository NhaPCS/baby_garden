import 'package:baby_garden_flutter/dialog/receive_barcode_dialogue.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/product_order_item.dart';
import 'package:baby_garden_flutter/provider/booking_detail_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/checkout/checkout_screen.dart';
import 'package:baby_garden_flutter/screen/checkout/widget/rich_text_form.dart';
import 'package:baby_garden_flutter/screen/checkout/widget/title_icon.dart';
import 'package:baby_garden_flutter/screen/order_detail/widget/order_form.dart';
import 'package:baby_garden_flutter/screen/order_detail/widget/order_info.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../order_delivery_info/order_delivery_info_screen.dart';

class OrderDetailScreen extends StatefulWidget {
  final String bookingId;

  const OrderDetailScreen({Key key, this.bookingId = "0"}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OrderDetailScreenState();
  }
}

class _OrderDetailScreenState extends BaseState<OrderDetailScreen> {
  final BookingDetailProvider _bookingDetailProvider = BookingDetailProvider();
  bool isShowPositiveButton = false;
  bool isShowNegativeButton = false;
  bool isDelivering = false;
  String title = "";
  String positiveTitle = "";
  BookingState state = BookingState.NONE;

  @override
  void initState() {
    // TODO: implement initState
    _bookingDetailProvider.getBookingDetail(widget.bookingId);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Consumer<BookingDetailProvider>(builder:
        (BuildContext context, BookingDetailProvider value, Widget child) {
      dynamic data = value.bookingDetailData;
      if (data == null) {
        return Container();
      } else {
        initView(int.parse(data['active']), data['is_receive'], data['status']);
        return Scaffold(
            appBar: getAppBar(
              title: title,
              centerTitle: true,
              bgColor: ColorUtil.primaryColor,
              titleColor: Colors.white,
              backColor: Colors.white,
            ),
            body: ListView(children: <Widget>[
              WidgetUtil.getLine(
                  width: SizeUtil.smallSpace,
                  margin: EdgeInsets.all(0),
                  color: ColorUtil.lineService),
              Container(
                  color: ColorUtil.bgService,
                  padding: const EdgeInsets.only(
                      left: SizeUtil.normalSpace,
                      right: SizeUtil.normalSpace,
                      top: SizeUtil.midSmallSpace,
                      bottom: SizeUtil.midSmallSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        S.of(context).order_header(data['code'],
                            data['date_booking'] + " " + data['time_booking']),
                        style: TextStyle(height: 1.5),
                      ),
                      RichTextForm(
                          title: S.of(context).supply_by,
                          titleStyle: TextStyle(
                              color: ColorUtil.textColor,
                              fontWeight: FontWeight.normal,
                              height: 1.5),
                          content: data['shop_name'],
                          contentStyle: TextStyle(
                              color: ColorUtil.primaryColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              //TODO delivery address
              WidgetUtil.getLine(width: 1, margin: EdgeInsets.all(0)),
              OrderInfo(
                svgIcon: "ic_receive_location.svg",
                title: S.of(context).delivery_address,
                content: data['user_address'],
              ),
              OrderInfo(
                svgIcon: 'ic_receive_method.svg',
                title: S.of(context).type_of_delivery,
                content: "Giao hàng tận nơi.",
                contentNote: isDelivering
                    ? null
                    : " (Thời gian: 09:00-12:00 22/12/2019)",
              ),
              OrderInfo(
                svgIcon: 'ic_payment_method.svg',
                title: S.of(context).type_of_checkout,
                content: "Chuyển khoản qua tài khoản ngân hàng",
              ),
              isDelivering
                  ? OrderInfo(
                      svgIcon: 'order_delivering.svg',
                      title: S.of(context).delivery_info,
                      content:
                          "Đơn vị vận chuyển: Giao hàng nhanh (dự kiến giao hàng\ntrước 27/12/2019)",
                      isShowSeparateLine: false,
                      iconSize: SizeUtil.iconSizeSmall,
                      isTrailing: true,
                      trailingText: "Xem lộ trình",
                      onTrailingTap: () {
                        push(OrderDeliveryInfoScreen());
                      },
                      contentWidget: Padding(
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
                                  color: ColorUtil.trackingTargetColor,
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
                                  S.of(context).delivering,
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
                    )
                  : SizedBox(),
              //TODO type of checkout
              OrderInfo(
                svgIcon: 'order_info.svg',
                title: S.of(context).order_info,
                contentWidget: Padding(
                  padding: EdgeInsets.only(
                      left: SizeUtil.normalSpace, bottom: SizeUtil.tinySpace),
                  child: Column(
                      children: List.generate(
                          data["list_product"].length,
                          (index) => ProductOrderItem(
                                title: data["list_product"][index]['name'],
                                skuTitle: data["list_product"][index]
                                    ['product_id'],
                                price: data["list_product"][index]['price'],
                                productCount: data["list_product"][index]
                                    ['number'],
                              ))),
                ),
              ),
              WidgetUtil.getLine(
                  width: SizeUtil.tinySpace,
                  margin: EdgeInsets.all(0),
                  color: Color(0xffDFDFDF)),
              OrderForm(
                title: S.of(context).cost,
                content: StringUtil.getPriceText("520000"),
              ),
              WidgetUtil.getLine(
                  width: 1,
                  color: ColorUtil.lineColor,
                  margin: EdgeInsets.all(0)),
              OrderForm(
                title: S.of(context).delivery_fee,
                content: StringUtil.getPriceText("5000"),
              ),
              WidgetUtil.getLine(
                  width: 1,
                  color: ColorUtil.lineColor,
                  margin: EdgeInsets.all(0)),
              OrderForm(
                title: S.of(context).total,
                titleStyle: TextStyle(
                    fontSize: SizeUtil.textSizeDefault, color: Colors.black),
                content: StringUtil.getPriceText("525000"),
                contentStyle: TextStyle(
                    fontSize: SizeUtil.textSizeDefault,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              state == BookingState.CANCEL
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        WidgetUtil.getLine(
                            width: 1,
                            color: ColorUtil.lineColor,
                            margin: EdgeInsets.all(0)),
                        OrderForm(
                          title: S.of(context).cancel_by,
                          content: "người đặt",
                          contentStyle: TextStyle(
                              fontSize: SizeUtil.textSizeExpressDetail,
                              color: ColorUtil.primaryColor),
                        ),
                        WidgetUtil.getLine(
                            width: 1,
                            color: ColorUtil.lineColor,
                            margin: EdgeInsets.all(0)),
                        OrderForm(
                          title: S.of(context).cancel_time,
                          content: "12/01/2020 13:40",
                        ),
                        WidgetUtil.getLine(
                            width: 1,
                            color: ColorUtil.lineColor,
                            margin: EdgeInsets.all(0)),
                        OrderForm(
                          title: S.of(context).cancel_reason,
                          content: S.of(context).change_service_type,
                        ),
                      ],
                    )
                  : SizedBox(),
              WidgetUtil.getLine(
                  width: SizeUtil.tinySpace,
                  color: isDelivering ? ColorUtil.white : ColorUtil.lineColor,
                  margin: EdgeInsets.all(0)),
              isShowNegativeButton
                  ? MyRaisedButton(
                      onPressed: onNegativeClick,
                      text: state == BookingState.WAITING_CHECKOUT
                          ? S.of(context).checkout.toUpperCase()
                          : state == BookingState.RECEIVE_IN_SHOP
                              ? S.of(context).receive.toUpperCase()
                              : S.of(context).rating_order,
                      color: ColorUtil.primaryColor,
                      textStyle: TextStyle(
                          fontSize: SizeUtil.textSizeDefault,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    )
                  : SizedBox(
                      height: SizeUtil.smallSpace,
                    ),
              isShowNegativeButton
                  ? MyRaisedButton(
                      onPressed: () {
                        WidgetUtil.showConfirmDialog(context,
                            message: S.of(context).cancel_question,
                            title: S.of(context).attention,
                            positiveClicked: () {
                          Navigator.of(context).pop();
                        }, negativeClick: () {
                          Navigator.of(context).pop();
                        });
                      },
                      textStyle: TextStyle(
                          fontSize: SizeUtil.textSizeDefault,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                      text: S.of(context).cancel.toUpperCase(),
                      color: ColorUtil.primaryColor,
                    )
                  : SizedBox(
                      height: SizeUtil.smallSpace,
                    )
            ]));
      }
    });
  }

  void initView(int active, String receiveInShop, String status) {
    state = BookingState.values[active];
    if (status == "1") {
      state = BookingState.WAITING_CHECKOUT;
    } else if (receiveInShop == "1") {
      state = BookingState.RECEIVE_IN_SHOP;
    }
    switch (state) {
      case BookingState.WAITING_CONFIRM: //đã đặt
        title = S.of(context).waiting_confirm;
        isShowPositiveButton = true;
        isShowNegativeButton = true;
        break;
      case BookingState.CONFIRM: //xác nhận
        break;
      case BookingState.SUCCESS: //hoàn thành
        isShowPositiveButton = true;
        title = S.of(context).success_order;
        break;
      case BookingState.CANCEL: //huỷ
        isShowPositiveButton = true;
        title = S.of(context).canceled_order;
        break;
      case BookingState.RECEIVE_IN_SHOP:
        title = S.of(context).receive_in_shop;
        isShowPositiveButton = true;
        isShowNegativeButton = true;
        break;
      case BookingState.WAITING_CHECKOUT:
        title = S.of(context).waiting_checkout;
        isShowPositiveButton = true;
        isShowNegativeButton = true;
        break;
      case BookingState.PACKING: //đang đóng gói
        title = S.of(context).packing;
        break;
      case BookingState.IN_DELIVERY: //đang vận chuyển
        isDelivering = true;
        title = S.of(context).in_delivery;
        break;
      default:
        break;
    }
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _bookingDetailProvider)];
  }

  void onNegativeClick() {
    //TODO booking
    if (state == BookingState.WAITING_CHECKOUT) {
      push(CheckoutScreen());
    } else if (state == BookingState.RECEIVE_IN_SHOP) {
      showDialog(
          context: context,
          builder: (BuildContext context) => ReceiveBarCodeDialogue());
    } else {
      push(RatingDetailScreen());
    }
  }
}
