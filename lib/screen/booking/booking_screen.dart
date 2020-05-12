import 'package:baby_garden_flutter/screen/booking/dialog/change_delivery_address_dialogue.dart';
import 'package:baby_garden_flutter/screen/booking/dialog/change_delivery_time_dialogue.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/provider/receive_address_list_provider.dart';
import 'package:baby_garden_flutter/screen/booking/provider/transfer_method_provider.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/booking/widget/checkout_method.dart';
import 'package:baby_garden_flutter/screen/booking/widget/delivery_method.dart';
import 'package:baby_garden_flutter/screen/booking/widget/input_note.dart';
import 'package:baby_garden_flutter/screen/booking/widget/list_title_custom.dart';
import 'package:baby_garden_flutter/screen/booking/widget/transfer_service.dart';
import 'package:baby_garden_flutter/screen/checkout/checkout_screen.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/widget/button/privacy_policy_button.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/booking/view_model/booking_product_view_model.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  final String shopID;
  final String promoteCode;

  const BookingScreen({this.shopID = '1', this.promoteCode = '123'}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookingScreenState();
  }
}

class _BookingScreenState
    extends BaseStateModel<BookingScreen, BookingProductViewModel>
    with SingleTickerProviderStateMixin {
  ValueNotifier<int> deliveryMethod = new ValueNotifier(2);
  ValueNotifier<int> checkoutMethod = new ValueNotifier(1);
  ValueNotifier<String> receiveTime = new ValueNotifier("");
  String inShopReceiveAddress = "";
  final TransferMethodProvider _transferMethodProvider =
      new TransferMethodProvider();
  final TextEditingController _promoteShipCodeController =
      new TextEditingController();
  final TextEditingController _noteController = new TextEditingController();
  final ValueNotifier<bool> _pointCheckoutValueController =
      ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    _transferMethodProvider.getShips();
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    final totalPrice = Provider.of<CartProvider>(context).price;
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
                        'ic_receive_location.svg',
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
                            String address =
                                value.addressList.length > value.val
                                    ? value.currentAddress
                                    : "";
                            print(address);
                            return Text(
                              address,
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
                        'ic_transfer_info.svg',
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
                              child: ValueListenableBuilder<String>(
                                valueListenable: receiveTime,
                                builder: (BuildContext context, String value,
                                    Widget child) {
                                  return RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: S.of(context).receive_in,
                                          style: TextStyle(
                                              color: ColorUtil.textColor,
                                              fontSize:
                                                  SizeUtil.textSizeSmall)),
                                      TextSpan(
                                          text: value,
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
            content: CheckoutMethod(
              checkoutMethod: checkoutMethod,
              pointCheckoutValueController: _pointCheckoutValueController,
            ),
          ),
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
                  return Text(StringUtil.getPriceText(value.price.toString()),
                      style:
                          TextStyle(fontSize: SizeUtil.textSizeExpressDetail));
                })
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
                Consumer<TransferMethodProvider>(
                  builder: (BuildContext context, TransferMethodProvider value,
                      Widget child) {
                    return Text(
                        StringUtil.getPriceText(
                            (totalPrice - value.price).toString()),
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
          MyRaisedButton(
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
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [
      ChangeNotifierProvider.value(value: _transferMethodProvider),
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
        Provider.of<ReceiveAddressListProvider>(context, listen: false);
    var address;
    if (receiveAddress.addressList.length > receiveAddress.val) {
      address = receiveAddress.addressList[receiveAddress.val];
    }
    //note nếu là nhận hàng tại shop thì không cần check đại chỉ nhận hàng, đơn vị giao hàng
    //todo check thêm thời gian nhận hàng
    if (deliveryMethod.value == 1) {
      if (inShopReceiveAddress == "") {
        WidgetUtil.showMessageDialog(context,
            message: S.of(context).choose_shop_address,
            title: S.of(context).missing_information);
      } else if (receiveTime.value == "") {
        WidgetUtil.showMessageDialog(context,
            message: S.of(context).choose_time_Schedule,
            title: S.of(context).missing_information);
      } else {
        await getViewModel().onBookingProduct(
            widget.shopID.toString(),
            widget.promoteCode.toLowerCase(),
            deliveryMethod.value.toString(),
            checkoutMethod.value.toString(),
            _noteController.text.toString(),
            "",
            inShopReceiveAddress,
            "",
            "",
            "",
            "",
            "",
            "");
      }
    } else {
      //note
      if (address == null) {
        WidgetUtil.showMessageDialog(context,
            message: S.of(context).choose_delivery_address,
            title: S.of(context).missing_information);
      } else {
        await getViewModel().onBookingProduct(
            widget.shopID.toString(),
            widget.promoteCode.toLowerCase(),
            deliveryMethod.value.toString(),
            checkoutMethod.value.toString(),
            _noteController.text.toString(),
            _transferMethodProvider
                .ships[_transferMethodProvider.transferMethod]['id'],
            inShopReceiveAddress,
            _promoteShipCodeController.text.trim(),
            address['userName'],
            address['phone'],
            address['address'],
            address['cityID'],
            address['districtID']);
      }
    }
    if (checkoutMethod.value == 2) {
      RouteUtil.pushReplacement(context, CheckoutScreen(
        bookingId: getViewModel().bookingData['booking_id'],
        bookingCode: getViewModel().bookingData['code'].toString(),
        totalPrice: Provider.of<CartProvider>(context,listen: false).price -
            _transferMethodProvider.price,
        phone: address!=null?address['phone']:"",
      ));
    } else {
      RouteUtil.pushAndReplaceAll(context, MainScreen(index: 1), "/main");
    }
  }
}
