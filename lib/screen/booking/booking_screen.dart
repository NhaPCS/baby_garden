import 'dart:math';

import 'package:baby_garden_flutter/provider/privacy_provider.dart';
import 'package:baby_garden_flutter/screen/booking/dialog/change_delivery_address_dialogue.dart';
import 'package:baby_garden_flutter/screen/booking/dialog/change_delivery_time_dialogue.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/provider/receive_address_list_provider.dart';
import 'package:baby_garden_flutter/screen/booking/provider/transfer_method_provider.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/booking/provider/user_point_provider.dart';
import 'package:baby_garden_flutter/screen/booking/widget/checkout_method.dart';
import 'package:baby_garden_flutter/screen/booking/widget/delivery_method.dart';
import 'package:baby_garden_flutter/screen/booking/widget/input_note.dart';
import 'package:baby_garden_flutter/screen/booking/widget/list_title_custom.dart';
import 'package:baby_garden_flutter/screen/booking/widget/transfer_service.dart';
import 'package:baby_garden_flutter/screen/checkout/checkout_screen.dart';
import 'package:baby_garden_flutter/screen/checkout/dialogue/confirm_dialogue.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/screen/order_detail/order_detail_screen.dart';
import 'package:baby_garden_flutter/widget/button/privacy_policy_button.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/booking/view_model/booking_product_view_model.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  final String shopID;
  final List<dynamic> promotions;
  final String shopName;

  const BookingScreen({this.shopID, this.promotions, this.shopName = ""})
      : super();

  @override
  State<StatefulWidget> createState() {
    return _BookingScreenState();
  }
}

class _BookingScreenState
    extends BaseStateModel<BookingScreen, BookingProductViewModel>
    with SingleTickerProviderStateMixin {
  ValueNotifier<int> deliveryMethod = new ValueNotifier(2);
  ValueNotifier<int> checkoutMethod = new ValueNotifier(1);
  ValueNotifier<dynamic> receiveTime =
      new ValueNotifier({"data": "", "id": "0"});
  String inShopReceiveAddress = "";
  final TransferMethodProvider _transferMethodProvider =
      new TransferMethodProvider();
  final TextEditingController _promoteShipCodeController =
      new TextEditingController();
  final TextEditingController _noteController = new TextEditingController();
  final ValueNotifier<bool> _pointCheckoutValueController =
      ValueNotifier(false);
  final UserPointProvider _pointProvider = new UserPointProvider();
  int checkoutPoint = 0;
  int totalPriceAfterFix = 0;
  int totalPrice = 0;

  @override
  void initState() {
    _pointProvider.getPoint(context, shopId: widget.shopID);
    Provider.of<ReceiveAddressListProvider>(context, listen: false).getData();
    totalPriceAfterFix = getTotalPrice();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (Provider.of<PrivacyProvider>(context).privacy == null)
      Provider.of<PrivacyProvider>(context).getPrivacy();
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).booking,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white),
      body: ListView(
        children: <Widget>[
          //TODO delivery address
          ValueListenableBuilder<int>(
            valueListenable: deliveryMethod,
            builder: (BuildContext context, int value, Widget child) {
              return value == 1
                  ? SizedBox()
                  : ListTitleCustom(
                      icon: SvgIcon(
                        'passage-of-time.svg',
                        width: SizeUtil.iconSizeDefault,
                        height: SizeUtil.iconSizeDefault,
                      ),
                      title: S.of(context).delivery_address,
                      trailing: InkWell(
                          onTap: () {
                            // Show address list
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    ChangeDeliveryAddressDialogue());
                          },
                          child: Text(
                            S.of(context).change,
                            style: TextStyle(
                                color: ColorUtil.blueLight,
                                fontSize: SizeUtil.textSizeSmall),
                          )),
                      content: Padding(
                        padding: EdgeInsets.only(
                            left: SizeUtil.bigSpaceHigher,
                            top: SizeUtil.tinySpace,
                            bottom: SizeUtil.tinySpace),
                        child: Consumer<ReceiveAddressListProvider>(
                          builder: (BuildContext context,
                              ReceiveAddressListProvider value, Widget child) {
                            if (value.addressList == null) return SizedBox();
                            if (value.selectedAddress != null) {
                              _transferMethodProvider.getShips(
                                  shopId: widget.shopID,
                                  districtId:
                                      value.selectedAddress['district_id'],
                                  wardId: value.selectedAddress['ward_id'],
                                  userAddress:
                                      value.selectedAddress['address']);
                            }
                            return MyText(
                              value.addressList == null ||
                                      value.addressList.isEmpty
                                  ? ''
                                  : StringUtil.getFullAddress(
                                      value.addressList[value.selectedIndex],
                                      hasBreak: true),
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeSmall,
                                  height: 1.3,
                                  color: Colors.black),
                            );
                          },
                        ),
                      ),
                    );
            },
          ),
          //TODO delivery method
          ListTitleCustom(
            icon: SvgIcon(
              'ic_receive_method.svg',
              width: SizeUtil.iconSizeDefault,
              height: SizeUtil.iconSizeDefault,
            ),
            title: S.of(context).type_of_delivery,
            content: DeliveryMethod(
              deliveryMethod: deliveryMethod,
              shopId: widget.shopID,
              inShopAddressValueChanged: (receiveAddress) {
                inShopReceiveAddress = receiveAddress;
              },
            ),
          ),
          //TODO receive time
          ValueListenableBuilder<int>(
            valueListenable: deliveryMethod,
            builder: (BuildContext context, int value, Widget child) {
              return value == 1
                  ? ListTitleCustom(
                      icon: SvgIcon(
                        'passage-of-time.svg',
                        width: SizeUtil.iconSizeDefault,
                        height: SizeUtil.iconSizeDefault,
                      ),
                      title: S.of(context).receive_time,
                      content: Padding(
                        padding: EdgeInsets.only(
                            left: SizeUtil.notifyHintSpace,
                            right: SizeUtil.normalSpace,
                            top: SizeUtil.midSpace,
                            bottom: SizeUtil.midSpace),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ValueListenableBuilder<dynamic>(
                                valueListenable: receiveTime,
                                builder: (BuildContext context, dynamic value,
                                    Widget child) {
                                  print(value);
                                  return RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: S.of(context).receive_in,
                                          style: TextStyle(
                                              color: ColorUtil.textColor,
                                              fontSize:
                                                  SizeUtil.textSizeSmall)),
                                      TextSpan(
                                          text: value["data"],
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: SizeUtil.textSizeSmall))
                                    ]),
                                  );
                                },
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                var data = await showDialog(
                                    context: context,
                                    builder: (_) => ChangeDeliveryTimeDialogue(
                                          shopId: widget.shopID,
                                        ));
                                if (data != null) {
                                  receiveTime.value = data;
                                }
                              },
                              child: Text(
                                S.of(context).change,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: SizeUtil.textSizeSmall),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : SizedBox();
            },
          ),
          //TODO CHECKOUT MENTHOD
          ListTitleCustom(
              icon: SvgIcon(
                'ic_payment_method.svg',
                width: SizeUtil.iconSizeDefault,
                height: SizeUtil.iconSizeDefault,
              ),
              title: S.of(context).type_of_checkout,
              content: Consumer<UserPointProvider>(
                builder: (BuildContext context, UserPointProvider value,
                    Widget child) {
                  return CheckoutMethodWG(
                    onChangePoint: (pointVal) {
                      checkoutPoint = pointVal;
                      _transferMethodProvider.onNotify();
                    },
                    totalPrice: totalPrice,
                    totalPoint: value.totalPoint,
                    checkoutMethod: checkoutMethod,
                    pointCheckoutValueController: _pointCheckoutValueController,
                  );
                },
              )),
          //TODO transfer menthod
          ValueListenableBuilder<int>(
            valueListenable: deliveryMethod,
            builder: (BuildContext context, int value, Widget child) {
              return value == 1
                  ? SizedBox()
                  : ListTitleCustom(
                      icon: SvgIcon(
                        'ic_transfer_method.svg',
                        width: SizeUtil.iconSizeDefault,
                        height: SizeUtil.iconSizeDefault,
                      ),
                      title: S.of(context).delivery_service,
                      content: TransferService(
                        transferMethodProvider: _transferMethodProvider,
                        promoteShipCodeController: _promoteShipCodeController,
                      ));
            },
          ),
          InputNote(
            noteController: _noteController,
          ),
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
                Text(StringUtil.getPriceText(totalPrice.toString()),
                    style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail))
              ],
            ),
          ),
          WidgetUtil.getLine(
              width: 1, color: ColorUtil.lineColor, margin: EdgeInsets.all(0)),
          ValueListenableBuilder<bool>(
            valueListenable: _pointCheckoutValueController,
            builder: (BuildContext context, bool value, Widget child) {
              if (!value) {
                return SizedBox();
              } else {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: SizeUtil.normalSpace,
                          right: SizeUtil.normalSpace,
                          top: SizeUtil.midSmallSpace,
                          bottom: SizeUtil.midSmallSpace),
                      child: Row(
                        children: <Widget>[
                          Text(S.of(context).point_checkout,
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeExpressDetail)),
                          Spacer(),
                          Consumer<TransferMethodProvider>(builder:
                              (BuildContext context,
                                  TransferMethodProvider value, Widget child) {
                            return Text(
                                "- ${StringUtil.getPriceText((checkoutPoint * 1000).toString())}",
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeExpressDetail,
                                    color: ColorUtil.blue));
                          })
                        ],
                      ),
                    ),
                    WidgetUtil.getLine(
                        width: 1,
                        color: ColorUtil.lineColor,
                        margin: EdgeInsets.all(0)),
                  ],
                );
              }
            },
          ),
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
                Consumer<TransferMethodProvider>(builder: (BuildContext context,
                    TransferMethodProvider value, Widget child) {
                  return Text(
                      StringUtil.getPriceText(
                          value.getDiscountFee().toString()),
                      style:
                          TextStyle(fontSize: SizeUtil.textSizeExpressDetail));
                })
              ],
            ),
          ),
          WidgetUtil.getLine(
              width: 1, color: ColorUtil.lineColor, margin: EdgeInsets.all(0)),
          Consumer<TransferMethodProvider>(
            builder: (BuildContext context, TransferMethodProvider value,
                Widget child) {
              return value.coupon != null
                  ? Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: SizeUtil.normalSpace,
                              right: SizeUtil.normalSpace,
                              top: SizeUtil.midSmallSpace,
                              bottom: SizeUtil.midSmallSpace),
                          child: Row(
                            children: <Widget>[
                              Text(S.of(context).ship_promote,
                                  style: TextStyle(
                                      fontSize:
                                          SizeUtil.textSizeExpressDetail)),
                              Spacer(),
                              Consumer<TransferMethodProvider>(builder:
                                  (BuildContext context,
                                      TransferMethodProvider value,
                                      Widget child) {
                                return Text(
                                    "- ${StringUtil.getPriceText((value.getDiscountValue()).toString())}",
                                    style: TextStyle(
                                        fontSize:
                                            SizeUtil.textSizeExpressDetail,
                                        color: ColorUtil.blue));
                              })
                            ],
                          ),
                        ),
                        WidgetUtil.getLine(
                            width: 1,
                            color: ColorUtil.lineColor,
                            margin: EdgeInsets.all(0)),
                      ],
                    )
                  : SizedBox();
            },
          ),
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
                Consumer<TransferMethodProvider>(
                  builder: (BuildContext context, TransferMethodProvider value,
                      Widget child) {
                    return Text(
                        StringUtil.getPriceText((totalPrice +
                                value.getDiscountFee() -
                                checkoutPoint * 1000)
                            .toString()),
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeDefault,
                            color: Colors.red,
                            fontWeight: FontWeight.bold));
                  },
                )
              ],
            ),
          ),
          WidgetUtil.getLine(
              width: 1,
              color: ColorUtil.lineColor,
              margin: EdgeInsets.only(bottom: SizeUtil.smallSpace)),
          PrivacyPolicyButton(),
          Padding(
            padding: SizeUtil.defaultPadding,
            child: MyRaisedButton(
              onPressed: onCompleteBooking,
              color: ColorUtil.primaryColor,
              text: S.of(context).booking_submit.toUpperCase(),
              textStyle: TextStyle(
                  fontSize: SizeUtil.textSizeDefault,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
              padding: const EdgeInsets.only(
                  left: SizeUtil.smallSpace,
                  right: SizeUtil.smallSpace,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
            ),
          ),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [
      ChangeNotifierProvider.value(value: _transferMethodProvider),
      ChangeNotifierProvider.value(value: _pointProvider),
    ];
  }

  @override
  BookingProductViewModel initViewModel() {
    // TODO: implement initViewModel
    return new BookingProductViewModel(context);
  }

  void onCompleteBooking() async {
    //TODO booking
    var receiveAddress =
        Provider.of<ReceiveAddressListProvider>(context, listen: false)
            .selectedAddress;
    //note nếu là nhận hàng tại shop thì không cần check đại chỉ nhận hàng, đơn vị giao hàng
    //todo check thêm thời gian nhận hàng
    if (deliveryMethod.value == DeliveryMethodState.RECEIVE_IN_SHOP.index) {
      if (inShopReceiveAddress == "") {
        WidgetUtil.showMessageDialog(context,
            message: S.of(context).choose_shop_address,
            title: S.of(context).missing_information);
      } else if (receiveTime.value["data"] == "") {
        WidgetUtil.showMessageDialog(context,
            message: S.of(context).choose_time_Schedule,
            title: S.of(context).missing_information);
      } else {
        await onBookingProduct();
        if (checkoutMethod.value == CheckoutMethod.CREDIT_TRANSFER.index) {
          print(getViewModel().bookingData['booking_id']);
          RouteUtil.pushReplacement(
              context,
              CheckoutScreen(
                bookingId: getViewModel().bookingData['booking_id'],
                bookingCode: getViewModel().getFinishedBookingCode(),
                totalPrice: totalPriceAfterFix,
                phone: receiveAddress['phone'] ?? '',
                shopName: widget.shopName,
              ));
        } else {
          int index = await showDialog(
              context: context,
              builder: (BuildContext context) => ConfirmDialogue(
                    bookingCode: getViewModel().getFinishedBookingCode(),
                  ));
          pushAndReplaceAll(MainScreen(index: index), "/main_screen");
        }
        Provider.of<CartProvider>(context, listen: false).getMyCart();
      }
    } else {
      if (receiveAddress == null) {
        WidgetUtil.showMessageDialog(context,
            message: S.of(context).choose_delivery_address,
            title: S.of(context).missing_information);
      } else {
        bool done = await onBookingProduct();
        if (checkoutMethod.value == CheckoutMethod.CREDIT_TRANSFER.index) {
          print(getViewModel().bookingData['booking_id']);
          RouteUtil.pushReplacement(
              context,
              CheckoutScreen(
                bookingId: getViewModel().bookingData['booking_id'],
                bookingCode: getViewModel().getFinishedBookingCode(),
                totalPrice: totalPriceAfterFix,
                phone: receiveAddress['phone'] ?? '',
                shopName: widget.shopName,
              ));
        } else {
          if (!done) return;
          int index = await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => ConfirmDialogue(
                  bookingCode: getViewModel().getFinishedBookingCode()));
          if (index > 0) {
            RouteUtil.pushReplacement(
                context,
                OrderDetailScreen(
                  bookingId:
                      getViewModel().bookingData['booking_id'].toString(),
                ));
          } else {
            pushAndReplaceAll(MainScreen(index: index), "/main_screen");
          }
        }
        Provider.of<CartProvider>(context, listen: false).getMyCart();
      }
    }
  }

  Future<bool> onBookingProduct() async {
    var receiveAddress =
        Provider.of<ReceiveAddressListProvider>(context, listen: false)
            .selectedAddress;
    bool isReceiveInShop =
        deliveryMethod.value == DeliveryMethodState.RECEIVE_IN_SHOP.index;
    bool done = await getViewModel().onBookingProduct(
      context,
      shopID: widget.shopID,
      promoteCode: widget.promotions == null
          ? ''
          : widget.promotions.map<String>((e) => e['code']).toList().join(','),
      isReceiveInShop: deliveryMethod.value.toString(),
      timeId: receiveTime.value != null ? receiveTime.value['id'] : '',
      paymentMethod: checkoutMethod.value.toString(),
      note: _noteController.text.toString().trim(),
      address: isReceiveInShop ? inShopReceiveAddress : '',
      userName: isReceiveInShop ? '' : receiveAddress['name'],
      userPhone: isReceiveInShop ? '' : receiveAddress['phone'],
      userAddress: isReceiveInShop ? '' : receiveAddress['address'],
      cityID: isReceiveInShop ? '' : receiveAddress['city_id'],
      districtID: isReceiveInShop ? '' : receiveAddress['district_id'],
      wardId: isReceiveInShop ? '' : receiveAddress['ward_id'],
      point: checkoutPoint.toString(),
      shipCoupon: isReceiveInShop
          ? ''
          : _transferMethodProvider.coupon == null
              ? ''
              : _transferMethodProvider.selectedCouponCode ?? '',
      shipCode:
          isReceiveInShop ? '' : _transferMethodProvider.selectedTransfer ?? '',
    );
    return done;
  }

  int getTotalPrice() {
    totalPrice = max(
        Provider.of<CartProvider>(context, listen: false).getShopTotalPrice() -
            getPromotionsPrice(),
        0);
    return max(
        totalPrice +
            _transferMethodProvider.getDiscountFee() -
            checkoutPoint * 1000,
        0);
  }

  int getPromotionsPrice() {
    if (widget.promotions == null || widget.promotions.isEmpty) return 0;
    int total = 0;
    widget.promotions.forEach((element) {
      try {
        total += int.parse(element['value'] ?? '0');
      } on Exception catch (e) {}
    });
    return total;
  }
}
