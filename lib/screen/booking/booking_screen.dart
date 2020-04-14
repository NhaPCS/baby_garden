import 'package:baby_garden_flutter/dialog/change_delivery_address_dialogue.dart';
import 'package:baby_garden_flutter/dialog/change_delivery_time_dialogue.dart';
import 'package:baby_garden_flutter/dialog/credit_transfer_checkout_dialogue.dart';
import 'package:baby_garden_flutter/dialog/point_checkout_dialogue.dart';
import 'package:baby_garden_flutter/dialog/privacy_policy_dialogue.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_added_promo.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/provider/change_delivery_time_provider.dart';
import 'package:baby_garden_flutter/provider/checkout_method_provider.dart';
import 'package:baby_garden_flutter/provider/delivery_method_provider.dart';
import 'package:baby_garden_flutter/provider/notify_switch_provider.dart';
import 'package:baby_garden_flutter/provider/receive_address_list_provider.dart';
import 'package:baby_garden_flutter/provider/shop_location_provider.dart';
import 'package:baby_garden_flutter/provider/transfer_method_provider.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/checkout/checkout_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/booking_product_view_model.dart';
import 'package:baby_garden_flutter/widget/checkbox/custom_radio_button.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/line/dot_line_separator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  var shopID;
  String promoteCode;
  BookingScreen({this.shopID,this.promoteCode}):super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookingScreenState();
  }
}

class _BookingScreenState
    extends BaseStateModel<BookingScreen, BookingProductViewModel>
    with SingleTickerProviderStateMixin {
  final ChangeDeliveryTimeProvider _changeDeliveryTimeProvider =
      new ChangeDeliveryTimeProvider();
  final DeliveryMethodProvider _deliveryMethodProvider =
      new DeliveryMethodProvider();
  final ShopLocationProvider _shopLocationProvider = new ShopLocationProvider();
  final NotifySwitchProvider _notifySwitchProvider = new NotifySwitchProvider();
  final CheckoutMethodProvider _checkoutMethodProvider =
      new CheckoutMethodProvider();
  final TransferMethodProvider _transferMethodProvider =
      new TransferMethodProvider();
 final TextEditingController  _promoteShipCodeController = new TextEditingController();
 final TextEditingController  _noteController = new TextEditingController();

  TabController _dayTabControler;

  @override
  void initState() {
    // TODO: implement initState
    _dayTabControler = TabController(vsync: this, length: 3);
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
          ListTitleCustom(
            padding: const EdgeInsets.only(
                left: SizeUtil.normalSpace,
                right: SizeUtil.normalSpace,
                top: SizeUtil.midSmallSpace,
                bottom: SizeUtil.midSmallSpace),
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
                      builder: (_) => ChangeDeliveryAddressDialogue());
                },
                child: Text(
                  S.of(context).change,
                  style: TextStyle(
                      color: ColorUtil.blueLight,
                      fontSize: SizeUtil.textSizeSmall),
                )),
            content: Padding(
              padding: EdgeInsets.only(
                  left: SizeUtil.bigSpacehigher,
                  top: SizeUtil.tinySpace,
                  bottom: SizeUtil.tinySpace),
              child: Consumer<ReceiveAddressListProvider>(
                builder: (BuildContext context,
                    ReceiveAddressListProvider value, Widget child) {
                  String address = value.addressList.length > value.val
                      ? value.currentAddress
                      : "";
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
          ),
          //TODO delivery menthod
          ListTitleCustom(
            padding: const EdgeInsets.only(
                left: SizeUtil.normalSpace,
                right: SizeUtil.normalSpace,
                top: SizeUtil.midSmallSpace,
                bottom: SizeUtil.midSmallSpace),
            icon: SvgIcon(
              'ic_receive_method.svg',
              width: SizeUtil.iconSizeDefault,
              height: SizeUtil.iconSizeDefault,
            ),
            title: S.of(context).type_of_delivery,
            content: getDeliveryMenthod(),
          ),
          //TODO receive time
          Consumer<DeliveryMethodProvider>(
            builder: (BuildContext context, DeliveryMethodProvider value,
                Widget child) {
              return value.deliveryMenthod == 1
                  ? ListTitleCustom(
                      padding: const EdgeInsets.only(
                          left: SizeUtil.normalSpace,
                          right: SizeUtil.normalSpace,
                          top: SizeUtil.midSmallSpace,
                          bottom: SizeUtil.midSmallSpace),
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
                              child: RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: S.of(context).receive_in,
                                      style: TextStyle(
                                          color: ColorUtil.textColor,
                                          fontSize: SizeUtil.textSizeSmall)),
                                  TextSpan(
                                      text: "09:00 - 11:00 02/02/2020",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: SizeUtil.textSizeSmall))
                                ]),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print("chaskdkasn das d");
                                showDialog(
                                    context: context,
                                    builder: (_) => ChangeDeliveryTimeDialogue(
                                          dayTabControler: _dayTabControler,
                                          changeDeliveryTimeProvider:
                                              _changeDeliveryTimeProvider,
                                        ));
//                            showChangeReceiveTimeDialogue(context, myTabs);
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
            padding: const EdgeInsets.only(
                left: SizeUtil.normalSpace,
                right: SizeUtil.normalSpace,
                top: SizeUtil.midSmallSpace,
                bottom: SizeUtil.midSmallSpace),
            icon: SvgIcon(
              'ic_payment_method.svg',
              width: SizeUtil.iconSizeDefault,
              height: SizeUtil.iconSizeDefault,
            ),
            title: S.of(context).type_of_checkout,
            content: getCheckoutMenthod(),
          ),
          //TODO transfer menthod
          ListTitleCustom(
              padding: const EdgeInsets.only(
                  left: SizeUtil.normalSpace,
                  right: SizeUtil.normalSpace,
                  top: SizeUtil.midSmallSpace,
                  bottom: SizeUtil.midSmallSpace),
              icon: SvgIcon(
                'ic_transfer_method.svg',
                width: SizeUtil.iconSizeDefault,
                height: SizeUtil.iconSizeDefault,
              ),
              title: S.of(context).delivery_service,
              content: getTransferService()),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  //todo change icon
                },
                child: SvgIcon(
                  'select_icon.svg',
                  width: SizeUtil.iconSizeDefault,
                  height: SizeUtil.iconSizeDefault,
                ),
              ),
              SizedBox(
                width: SizeUtil.smallSpace,
              ),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      recognizer: new TapGestureRecognizer()..onTap = () => {},
                      text: "Đồng ý với ",
                      style: TextStyle(
                          color: ColorUtil.textColor,
                          fontSize: SizeUtil.textSizeSmall)),
                  TextSpan(
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                PrivacyAndPolicyDialogue()),
                      text: "Chính sách & Điều khoản dịch vụ ",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: SizeUtil.textSizeSmall)),
                  TextSpan(
                      text: "của Shop",
                      style: TextStyle(
                          color: ColorUtil.textColor,
                          fontSize: SizeUtil.textSizeSmall)),
                ]),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.only(
                  left: SizeUtil.smallSpace,
                  right: SizeUtil.smallSpace,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () async {
                  //TODO booking
                  var receiveAddress = Provider.of<ReceiveAddressListProvider>(context,listen: false);
                  var address;
                  if (receiveAddress.addressList.length>receiveAddress.val){
                    address = receiveAddress.addressList[receiveAddress.val];
                  }
                  if (address==null){
                    WidgetUtil.showMessageDialog(context, message: "Vui lòng nhập địa chỉ nhận hàng ", title: "Thiếu thông tin");
                  }else {
                    var data = await getViewModel().onBookingProduct( widget.shopID.toString(), widget.promoteCode.toLowerCase(),
                        _deliveryMethodProvider.deliveryMenthod.toString(), _checkoutMethodProvider.checkoutMenthod.toString(),
                        _noteController.text.toString(), _transferMethodProvider.ships[_transferMethodProvider.transferMenthod]['id'], "address", _promoteShipCodeController.text.trim(), address['userName'], address['phone'],
                        address['address'], address['cityID'], address['districtID']);
//                  print("book : don vi van chuyen ${_transferMethodProvider.ships[_transferMethodProvider.transferMenthod]['id']} ${_promoteShipCodeController.text.trim()} ${address['userName']} ${address['phone']} ${address['address']} ${address['cityID']} ${address['districtID']}");
                    push(CheckoutScreen());
                  }

                },
                color: ColorUtil.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(SizeUtil.tinyRadius),
                )),
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
              )),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [
      ChangeNotifierProvider.value(value: _changeDeliveryTimeProvider),
      ChangeNotifierProvider.value(value: _deliveryMethodProvider),
      ChangeNotifierProvider.value(value: _shopLocationProvider),
      ChangeNotifierProvider.value(value: _notifySwitchProvider),
      ChangeNotifierProvider.value(value: _checkoutMethodProvider),
      ChangeNotifierProvider.value(value: _transferMethodProvider),
    ];
  }

  Widget getTransferService() {
    return Consumer<TransferMethodProvider>(
      builder:
          (BuildContext context, TransferMethodProvider value, Widget child) {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
                children: value.ships
                    .map((e) => Column(
                          children: <Widget>[
                            CustomRadioButton(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              titleContent: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CachedNetworkImage(
                                    imageUrl: e['img'],
                                    width: 40,
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: SizeUtil.tinySpace,
                                  ),
                                  Text(
                                    e['name'],
                                    style: TextStyle(
                                        fontSize:
                                            SizeUtil.textSizeExpressDetail),
                                  ),
                                ],
                              ),
                              subTitle: Text(
                                e['note'],
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeNotiTime,
                                    color: ColorUtil.gray),
                              ),
                              padding: const EdgeInsets.only(
                                  left: SizeUtil.bigSpacehigher,
                                  top: SizeUtil.smallSpace,
                                  bottom: SizeUtil.smallSpace,
                                  right: SizeUtil.normalSpace),
                              value: value.ships.indexOf(e),
                              groupValue: value.transferMenthod,
                              onChanged: (val) {
                                _transferMethodProvider.onChange(val);
                              },
                              trailing: Row(
                                children: <Widget>[
                                  Text(
                                    e['price'],
                                    style: TextStyle(
                                      fontSize: SizeUtil.textSizeTiny,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeUtil.tinySpace,
                                  ),
                                  Text(
                                    e['price_discount'],
                                    style: TextStyle(
                                      fontSize: SizeUtil.textSizeSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                  left: SizeUtil.notifyHintSpace,
                                ),
                                child: MySeparator(
                                  color: ColorUtil.lineColor,
                                  paddingLeft: SizeUtil.largeSpace,
                                ))
                          ],
                        ))
                    .toList()),
            Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpacehigher,
                  bottom: SizeUtil.smallSpace,
                  right: SizeUtil.tinySpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    S.of(context).enter_delivery_code,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Container(
                    height: SizeUtil.delivery_code_height,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                            obscureText: false,
                            controller: _promoteShipCodeController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                hintText: S.of(context).delivery_code,
                                hintStyle:
                                    TextStyle(fontSize: SizeUtil.textSizeSmall),
                                contentPadding:
                                    EdgeInsets.only(left: 8, right: 4)),
                          ),
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        ),
                        RaisedButton(
                          onPressed: () {
                            //TODO booking
                          },
                          color: ColorUtil.primaryColor,
                          shape: RoundedRectangleBorder(),
                          child: Container(
                            padding: EdgeInsets.all(SizeUtil.midSpace),
                            child: Text(
                              S.of(context).apply.toUpperCase(),
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeSmall,
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        ),
                      ],
                    ),
                  ),
                  ItemAddedPromo(
                    padding:
                        EdgeInsets.only(top: SizeUtil.tinySpace, bottom: 0),
                  ),
                  ItemAddedPromo(
                    padding:
                        EdgeInsets.only(top: SizeUtil.tinySpace, bottom: 0),
                  ),
                ],
              ),
            ),
            WidgetUtil.getLine(margin: EdgeInsets.all(0)),
            //todo note
            Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.smallSpace, top: SizeUtil.smallSpace),
              child: Text(
                S.of(context).booking_note,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.smallSpace,
                  right: SizeUtil.midSpace,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              child: TextField(
                controller: _noteController,
                style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                obscureText: false,
                decoration: InputDecoration(
                    fillColor: Color(0xffF3F3F3),
                    filled: true,
                    border: OutlineInputBorder(),
                    hintText: S.of(context).enter_your_note,
                    hintStyle: TextStyle(fontSize: SizeUtil.textSizeSmall),
                    contentPadding: EdgeInsets.only(left: 8, right: 4, top: 4)),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget getCheckoutMenthod() {
    return Consumer<CheckoutMethodProvider>(
      builder:
          (BuildContext context, CheckoutMethodProvider value, Widget child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CustomRadioButton(
              titleContent: Text(
                S.of(context).cash_payment,
                style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail),
              ),
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpacehigher,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              value: 1,
              groupValue: value.checkoutMenthod,
              onChanged: (val) {
                _checkoutMethodProvider.onChange(val);
              },
            ),
            CustomRadioButton(
              titleContent: Text(
                S.of(context).credit_transfer_payment,
                style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail),
              ),
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpacehigher,
                  top: SizeUtil.smallSpace,
                  right: SizeUtil.normalSpace),
              value: 2,
              groupValue: value.checkoutMenthod,
              trailing: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          CreditTransferCheckoutDialogue());
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: SizeUtil.tinySpace,
                      bottom: SizeUtil.tinySpace,
                      left: SizeUtil.tinySpace),
                  child: Text(
                    S.of(context).detail,
                    style: TextStyle(
                        color: ColorUtil.blue,
                        fontSize: SizeUtil.textSizeSmall),
                  ),
                ),
              ),
              onChanged: (val) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        CreditTransferCheckoutDialogue());
                _checkoutMethodProvider.onChange(val);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpacehigher,
                  bottom: SizeUtil.smallSpace,
                  right: SizeUtil.tinySpace),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        print("tab change ${_notifySwitchProvider.isEnable}");
                        _notifySwitchProvider.onChange();
                        if (_notifySwitchProvider.isEnable) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  PointCheckoutDialogue());
                        }
                      });
                    },
                    child: Text(
                      S.of(context).point_payment(
                          Provider.of<UserProvider>(context).userInfo['point']),
                      style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                    ),
                  ),
                  Spacer(),
                  Consumer<NotifySwitchProvider>(
                    builder: (BuildContext context, NotifySwitchProvider value,
                        Widget child) {
                      return Switch(
                        value: value.isEnable,
                        onChanged: (val) {
                          print("change ${_notifySwitchProvider.isEnable}");
                          _notifySwitchProvider.onChange();
                          if (_notifySwitchProvider.isEnable) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    PointCheckoutDialogue());
                          }
                        },
                        activeColor: ColorUtil.primaryColor,
                        inactiveThumbColor: ColorUtil.gray,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget getDeliveryMenthod() {
    return Consumer<DeliveryMethodProvider>(
      builder:
          (BuildContext context, DeliveryMethodProvider value, Widget child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CustomRadioButton(
              titleContent: Text(S.of(context).delivery_in_shop),
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpacehigher,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              value: 1,
              groupValue: value.deliveryMenthod,
              onChanged: (val) {
                _deliveryMethodProvider.onChange(val);
              },
            ),
            //todo shop location
            value.deliveryMenthod == 1
                ? Consumer<ShopLocationProvider>(
                    builder: (BuildContext context, ShopLocationProvider value,
                        Widget child) {
                      return Column(
                        children: <Widget>[
                          CustomRadioButton(
                            titleContent:
                                Text("38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội"),
                            padding: const EdgeInsets.only(
                                left: SizeUtil.hugSpace,
                                bottom: SizeUtil.tinySpace),
                            value: 1,
                            groupValue: value.shopLocation,
                            iconSize: SizeUtil.iconSize,
                            titleSize: SizeUtil.textSizeSmall,
                            onChanged: (val) {
                              _shopLocationProvider.onChange(val);
                            },
                          ),
                          CustomRadioButton(
                            titleContent:
                                Text("38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội"),
                            padding: const EdgeInsets.only(
                                left: SizeUtil.hugSpace,
                                bottom: SizeUtil.tinySpace),
                            value: 2,
                            groupValue: value.shopLocation,
                            iconSize: SizeUtil.iconSize,
                            titleSize: SizeUtil.textSizeSmall,
                            onChanged: (val) {
                              _shopLocationProvider.onChange(val);
                            },
                          ),
                          CustomRadioButton(
                            titleContent:
                                Text("38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội"),
                            padding: const EdgeInsets.only(
                                left: SizeUtil.hugSpace,
                                bottom: SizeUtil.tinySpace),
                            value: 3,
                            groupValue: value.shopLocation,
                            iconSize: SizeUtil.iconSize,
                            titleSize: SizeUtil.textSizeSmall,
                            onChanged: (val) {
                              _shopLocationProvider.onChange(val);
                            },
                          ),
                          CustomRadioButton(
                            titleContent:
                                Text("38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội"),
                            padding: const EdgeInsets.only(
                                left: SizeUtil.hugSpace,
                                bottom: SizeUtil.tinySpace),
                            value: 4,
                            groupValue: value.shopLocation,
                            iconSize: SizeUtil.iconSize,
                            titleSize: SizeUtil.textSizeSmall,
                            onChanged: (val) {
                              _shopLocationProvider.onChange(val);
                            },
                          ),
                          CustomRadioButton(
                            titleContent:
                                Text("38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội"),
                            padding: const EdgeInsets.only(
                                left: SizeUtil.hugSpace,
                                bottom: SizeUtil.tinySpace),
                            value: 5,
                            groupValue: value.shopLocation,
                            iconSize: SizeUtil.iconSize,
                            titleSize: SizeUtil.textSizeSmall,
                            onChanged: (val) {
                              _shopLocationProvider.onChange(val);
                            },
                          ),
                        ],
                      );
                    },
                  )
                : SizedBox(),
            CustomRadioButton(
              titleContent: Text(S.of(context).delivery_to_address),
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpacehigher,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              value: 2,
              groupValue: value.deliveryMenthod,
              onChanged: (val) {
                _deliveryMethodProvider.onChange(val);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  BookingProductViewModel initViewModel() {
    // TODO: implement initViewModel
    return new BookingProductViewModel(context);
  }
}

class ListTitleCustom extends StatelessWidget {
  final Widget icon;
  final String title;
  final Widget trailing;
  final double iconAndTitleSpace;
  final EdgeInsets padding;
  final Widget content;

  const ListTitleCustom(
      {Key key,
      this.icon,
      this.title,
      this.trailing,
      this.iconAndTitleSpace = SizeUtil.smallSpace,
      this.padding = const EdgeInsets.only(
          left: SizeUtil.normalSpace,
          right: SizeUtil.normalSpace,
          top: SizeUtil.midSmallSpace,
          bottom: SizeUtil.midSmallSpace),
      this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: padding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              icon != null ? icon : SizedBox(),
              SizedBox(
                width: iconAndTitleSpace,
              ),
              Text(title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeExpressTitle,
                      color: Colors.black)),
              Spacer(),
              trailing != null ? trailing : SizedBox(),
            ],
          ),
        ),
        WidgetUtil.getLine(
            color: ColorUtil.lineColor, margin: EdgeInsets.all(0), width: 1),
        content != null ? content : SizedBox(),
        WidgetUtil.getLine(
            color: ColorUtil.lineColor, margin: EdgeInsets.all(0), width: 6),
      ],
    );
  }
}
