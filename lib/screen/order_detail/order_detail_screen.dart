import 'package:baby_garden_flutter/dialog/receive_barcode_dialogue.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/product_order_item.dart';
import 'package:baby_garden_flutter/provider/booking_detail_provider.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/checkout/checkout_screen.dart';
import 'package:baby_garden_flutter/screen/checkout/widget/rich_text_form.dart';
import 'package:baby_garden_flutter/screen/order_detail/view_model/order_detail_view_model.dart';
import 'package:baby_garden_flutter/screen/order_detail/widget/order_form.dart';
import 'package:baby_garden_flutter/screen/order_detail/widget/order_info.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../order_delivery_info/order_delivery_info_screen.dart';

class OrderDetailScreen extends StatefulWidget {
  final String bookingId;
  final String title;

  const OrderDetailScreen({Key key, this.bookingId = "0", this.title = ""})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OrderDetailScreenState();
  }
}

class _OrderDetailScreenState
    extends BaseStateModel<OrderDetailScreen, OrderDetailViewModel> {
  final BookingDetailProvider _bookingDetailProvider = BookingDetailProvider();
  bool isShowPositiveButton = false;
  bool isShowNegativeButton = false;
  bool isDelivering = false;
  bool isShowCheckout = false;
  String title = "";
  String positiveTitle = "";
  BookingState state = BookingState.NONE;
  int costMoney = 0;

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
        costMoney = int.parse(data['total_money']) +
            int.parse(data['ship_money']) -
            int.parse(data['promotion_value']) -
            int.parse(data['promotion_ship']);
        initView(int.parse(data['active']), data['is_receive'], data['status'],
            data['payment'], data['is_rate']);
        return Scaffold(
            appBar: getAppBar(
              title: widget.title == ""
                  ? title.replaceAll("\n", " ")
                  : widget.title,
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
              data['is_receive'] == "1"
                  ? SizedBox()
                  : OrderInfo(
                      svgIcon: "ic_receive_location.svg",
                      title: S.of(context).delivery_address,
                      content: getFullAddress(),
                    ),
              OrderInfo(
                  svgIcon: 'ic_receive_method.svg',
                  title: S.of(context).type_of_delivery,
                  content: state == BookingState.RECEIVE_IN_SHOP
                      ? S.of(context).receive_in_shop
                      : S.of(context).delivery_in_place,
                  contentNote:
                      "${data['time_ship']}\n${data['address'] ?? ''}"),
              OrderInfo(
                svgIcon: 'ic_payment_method.svg',
                title: S.of(context).type_of_checkout,
                content: data['payment'] == "1"
                    ? S.of(context).cash_payment
                    : S.of(context).credit_transfer_payment,
              ),
              //todo-hung thời gian dự kiến giao hàng, lỗi separate line
              isDelivering
                  ? OrderInfo(
                      svgIcon: 'order_delivering.svg',
                      title: S.of(context).delivery_info,
                      content: S.of(context).delivery_service_header(
                          "Giao hàng nhanh (dự kiến giao hàng\ntrước 27/12/2019)"),
                      isShowSeparateLine: false,
                      iconSize: SizeUtil.iconSizeSmall,
                      isTrailing: true,
                      trailingText: S.of(context).view_delivery,
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
                                  data['time_ship'],
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
                                imageUrl: data['list_product'][index]
                                                ['image'] !=
                                            null &&
                                        data['list_product'][index]['image']
                                            .isNotEmpty
                                    ? data['list_product'][index]['image'][0]
                                    : '',
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
                content: StringUtil.getPriceText(
                    (int.parse(data['total_money']) -
                            int.parse(data['promotion_value']))
                        .toString()),
              ),
              WidgetUtil.getLine(
                  width: 1,
                  color: ColorUtil.lineColor,
                  margin: EdgeInsets.all(0)),
              OrderForm(
                title: S.of(context).delivery_fee,
                content: StringUtil.getPriceText(
                    (int.parse(data['ship_money']) -
                            int.parse(data['promotion_ship']))
                        .toString()),
              ),
              WidgetUtil.getLine(
                  width: 1,
                  color: ColorUtil.lineColor,
                  margin: EdgeInsets.all(0)),
              OrderForm(
                title: S.of(context).total,
                titleStyle: TextStyle(
                    fontSize: SizeUtil.textSizeDefault, color: Colors.black),
                content: StringUtil.getPriceText(costMoney.toString()),
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
                          content: data['cancel_by'] == "1"
                              ? S.of(context).cancel_by_owner
                              : S.of(context).cancel_by_shop,
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
                          content: data['time_cancel'],
                        ),
                        WidgetUtil.getLine(
                            width: 1,
                            color: ColorUtil.lineColor,
                            margin: EdgeInsets.all(0)),
                        OrderForm(
                          title: S.of(context).cancel_reason,
                          content: data["reason_cancel"],
                        ),
                      ],
                    )
                  : SizedBox(),
              WidgetUtil.getLine(
                  width: SizeUtil.tinySpace,
                  color: isDelivering ? ColorUtil.white : ColorUtil.lineColor,
                  margin: EdgeInsets.all(0)),
              isShowCheckout
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: SizeUtil.defaultSpace,
                          right: SizeUtil.defaultSpace),
                      child: MyRaisedButton(
                        padding: EdgeInsets.only(
                            top: SizeUtil.smallSpace,
                            bottom: SizeUtil.smallSpace),
                        onPressed: () {
                          push(CheckoutScreen(
                            shopId: data['shop_id'],
                            bookingId: int.parse(widget.bookingId),
                            bookingCode: data['code'].toString(),
                            totalPrice: costMoney,
                            phone: data['user_phone'],
                            shopName: data['shop_name'],
                          ));
                        },
                        text: S.of(context).checkout.toUpperCase(),
                        color: ColorUtil.primaryColor,
                        textStyle: TextStyle(
                            fontSize: SizeUtil.textSizeDefault,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : SizedBox(),
              isShowPositiveButton
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: SizeUtil.defaultSpace,
                          right: SizeUtil.defaultSpace),
                      child: MyRaisedButton(
                        padding: EdgeInsets.only(
                            top: SizeUtil.smallSpace,
                            bottom: SizeUtil.smallSpace),
                        onPressed: () {
                          onPositiveClick(data['id']);
                        },
                        text: state == BookingState.RECEIVE_IN_SHOP
                            ? S.of(context).receive.toUpperCase()
                            : S.of(context).rating_order,
                        color: ColorUtil.primaryColor,
                        textStyle: TextStyle(
                            fontSize: SizeUtil.textSizeDefault,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : SizedBox(
                      height: SizeUtil.smallSpace,
                    ),
              isShowNegativeButton
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: SizeUtil.defaultSpace,
                          right: SizeUtil.defaultSpace),
                      child: MyRaisedButton(
                        padding: EdgeInsets.only(
                            top: SizeUtil.smallSpace,
                            bottom: SizeUtil.smallSpace),
                        onPressed: () {
                          WidgetUtil.showConfirmDialog(
                            context,
                            message: S.of(context).cancel_question,
                            title: S.of(context).attention,
                            positiveClicked: () async {
                              await getViewModel().onCancelBooking(context,
                                  bookingId: widget.bookingId);
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        textStyle: TextStyle(
                            fontSize: SizeUtil.textSizeDefault,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        text: S.of(context).cancel.toUpperCase(),
                        color: ColorUtil.primaryColor,
                      ),
                    )
                  : SizedBox(
                      height: SizeUtil.smallSpace,
                    )
            ]));
      }
    });
  }

  void initView(int active, String receiveInShop, String status, String payment,
      String isRate) {
    state = BookingState.values[active];
    if (state != BookingState.CANCEL) {
      isShowCheckout = status == CheckoutStatus.UN_PAY.index.toString() &&
          payment == CheckoutMethod.CREDIT_TRANSFER.index.toString();
      if (receiveInShop == "1") {
        state = BookingState.RECEIVE_IN_SHOP;
      } else if (status == "1") {
        state = BookingState.WAITING_CHECKOUT;
      }
    }

    switch (state) {
      case BookingState.WAITING_CONFIRM: //đã đặt
        title = S.of(context).waiting_confirm;
        isShowPositiveButton = false;
        isShowNegativeButton = true;
        break;
      case BookingState.CONFIRM: //xác nhận
        title = S.of(context).waiting_confirm;
        break;
      case BookingState.SUCCESS: //hoàn thành
        isShowPositiveButton = isRate != "1";
        title = S.of(context).success_order;
        break;
      case BookingState.CANCEL: //huỷ
        isShowPositiveButton = isRate != "1";
        title = S.of(context).canceled_order;
        break;
      case BookingState.RECEIVE_IN_SHOP:
        title = S.of(context).receive_in_shop;
        isShowPositiveButton = true;
        isShowNegativeButton = true;
        break;
      case BookingState.WAITING_CHECKOUT:
        title = S.of(context).waiting_checkout;
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

  void onPositiveClick(bookingId) async {
    //TODO booking
    if (state == BookingState.RECEIVE_IN_SHOP) {
      showDialog(
          context: context,
          builder: (BuildContext context) => ReceiveBarCodeDialogue(
              _bookingDetailProvider.bookingDetailData['code']));
    } else {
      await push(RatingDetailScreen(
        bookingId: bookingId,
      ));
      _bookingDetailProvider.getBookingDetail(widget.bookingId);
    }
  }

  String getFullAddress() {
    if (_bookingDetailProvider.bookingDetailData == null) return '';
    String userAddress =
        _bookingDetailProvider.bookingDetailData['user_address'] ?? '';
    String userName =
        "${_bookingDetailProvider.bookingDetailData['user_name']}," ?? '';
    String userPhone =
        "${_bookingDetailProvider.bookingDetailData['user_phone']}," ?? '';
    return "$userName $userPhone $userAddress";
  }

  @override
  OrderDetailViewModel initViewModel() {
    // TODO: implement initViewModel
    return new OrderDetailViewModel(context);
  }
}
