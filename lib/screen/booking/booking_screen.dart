import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/custom_radio_button.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookingScreenState();
  }
}

class _BookingScreenState extends BaseState<BookingScreen> {
  int deliveryMenthod;

  int shopLocation;

  int checkoutMenthod;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deliveryMenthod = 0;
    shopLocation = 0;
    checkoutMenthod = 0;
  }

  setCheckoutMenthod(val) {
    setState(() {
      checkoutMenthod = val;
    });
  }

  setSelectDeliveryMenthod(val) {
    setState(() {
      deliveryMenthod = val;
    });
  }

  setShopLocation(val) {
    setState(() {
      shopLocation = val;
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return SafeArea(
      child: Scaffold(
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
                child: Text(
                  "Lê Văn Lĩnh - 0975 441 005\n28 Phan Kế Bính\nPhường Cống Vị, Quận Ba Đình, Hà Nội",
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                      height: 1.3,
                      color: Colors.black),
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
            //TODO CHECKOUT MENTHOD
            ListTitleCustom(
              padding: const EdgeInsets.only(
                  left: SizeUtil.normalSpace,
                  right: SizeUtil.normalSpace,
                  top: SizeUtil.midSmallSpace,
                  bottom: SizeUtil.midSmallSpace),
              icon: Image.asset(
                'photo/ic_payment_method.png',
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
              content: Padding(
                padding: EdgeInsets.only(
                    left: SizeUtil.bigSpacehigher,
                    top: SizeUtil.tinySpace,
                    bottom: SizeUtil.tinySpace),
                child: getTransferService()
              ),
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
                        text: "Đồng ý với ",
                        style: TextStyle(
                            color: ColorUtil.textColor,
                            fontSize: SizeUtil.textSizeSmall)),
                    TextSpan(
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => print('Show policy and privacy'),
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
                  onPressed: () {
                    //TODO booking
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
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }

  Widget getTransferService() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CustomRadioButton(
          label: S
              .of(context)
              .delivery_in_shop,
          titleContent: Column(children: <Widget>[
            Row(children: <Widget>[
//              SvgIcon(),
              Text(S
                  .of(context)
                  .delivery_in_shop,style: TextStyle(fontSize: SizeUtil.textSizeSmall),),
            ],),
            Text(S
                .of(context)
                .delivery_plan(2),style: TextStyle(fontSize: SizeUtil.textSizeTiny,color: ColorUtil.gray),),
          ],),
          padding: const EdgeInsets.only(
              left: SizeUtil.bigSpacehigher,
              top: SizeUtil.smallSpace,
              bottom: SizeUtil.smallSpace),
          value: 1,
          groupValue: checkoutMenthod,
          onChanged: (val) {
            setCheckoutMenthod(val);
          },
        ),
        CustomRadioButton(
          label: S
              .of(context)
              .delivery_to_address,
          padding: const EdgeInsets.only(
              left: SizeUtil.bigSpacehigher,
              top: SizeUtil.smallSpace,
              right: SizeUtil.normalSpace),
          value: 2,
          groupValue: checkoutMenthod,
          trailing: InkWell(
            onTap: () {
              print(" click asd     ");
            },
            child: Text(
              S
                  .of(context)
                  .detail,
              style: TextStyle(
                  color: ColorUtil.blue, fontSize: SizeUtil.textSizeSmall),
            ),
          ),
          onChanged: (val) {
            setCheckoutMenthod(val);
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
              Text(
                S.of(context).point_payment(200),
                style: TextStyle(fontSize: SizeUtil.textSizeSmall),
              ),
              Spacer(),
              Switch(
                value: true,
                onChanged: (bool newValue) {},
                activeColor: ColorUtil.primaryColor,
                inactiveThumbColor: ColorUtil.gray,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getCheckoutMenthod() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CustomRadioButton(
          label: S.of(context).delivery_in_shop,
          padding: const EdgeInsets.only(
              left: SizeUtil.bigSpacehigher,
              top: SizeUtil.smallSpace,
              bottom: SizeUtil.smallSpace),
          value: 1,
          groupValue: checkoutMenthod,
          onChanged: (val) {
            setCheckoutMenthod(val);
          },
        ),
        CustomRadioButton(
          label: S.of(context).delivery_to_address,
          padding: const EdgeInsets.only(
              left: SizeUtil.bigSpacehigher,
              top: SizeUtil.smallSpace,
              right: SizeUtil.normalSpace),
          value: 2,
          groupValue: checkoutMenthod,
          trailing: InkWell(
            onTap: (){
              print(" click asd     ");
            },
            child: Text(
              S.of(context).detail,
              style: TextStyle(
                  color: ColorUtil.blue, fontSize: SizeUtil.textSizeSmall),
            ),
          ),
          onChanged: (val) {
            setCheckoutMenthod(val);
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
              Text(
                S.of(context).point_payment(200),
                style: TextStyle(fontSize: SizeUtil.textSizeSmall),
              ),
              Spacer(),
              Switch(
                value: true,
                onChanged: (bool newValue) {},
                activeColor: ColorUtil.primaryColor,
                inactiveThumbColor: ColorUtil.gray,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getDeliveryMenthod() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CustomRadioButton(
          label: S.of(context).delivery_in_shop,
          padding: const EdgeInsets.only(
              left: SizeUtil.bigSpacehigher,
              top: SizeUtil.smallSpace,
              bottom: SizeUtil.smallSpace),
          value: 1,
          groupValue: deliveryMenthod,
          onChanged: (val) {
            setSelectDeliveryMenthod(val);
          },
        ),
        deliveryMenthod == 1
            ? Column(
                children: <Widget>[
                  CustomRadioButton(
                    label: "38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội",
                    padding: const EdgeInsets.only(
                        left: SizeUtil.hugSpace, bottom: SizeUtil.tinySpace),
                    value: 1,
                    groupValue: shopLocation,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setShopLocation(val);
                    },
                  ),
                  CustomRadioButton(
                    label: "38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội",
                    padding: const EdgeInsets.only(
                        top: SizeUtil.tinySpace,
                        left: SizeUtil.hugSpace,
                        bottom: SizeUtil.tinySpace),
                    value: 2,
                    groupValue: shopLocation,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setShopLocation(val);
                    },
                  ),
                  CustomRadioButton(
                    label: "38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội",
                    padding: const EdgeInsets.only(
                        top: SizeUtil.tinySpace,
                        left: SizeUtil.hugSpace,
                        bottom: SizeUtil.tinySpace),
                    value: 3,
                    groupValue: shopLocation,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setShopLocation(val);
                    },
                  ),
                  CustomRadioButton(
                    label: "38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội",
                    padding: const EdgeInsets.only(
                        top: SizeUtil.tinySpace,
                        left: SizeUtil.hugSpace,
                        bottom: SizeUtil.tinySpace),
                    value: 4,
                    groupValue: shopLocation,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setShopLocation(val);
                    },
                  ),
                  CustomRadioButton(
                    label: "38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội",
                    padding: const EdgeInsets.only(
                        top: SizeUtil.tinySpace,
                        left: SizeUtil.hugSpace,
                        bottom: SizeUtil.tinySpace),
                    value: 5,
                    groupValue: shopLocation,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setShopLocation(val);
                    },
                  ),
                  CustomRadioButton(
                    label: "38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội",
                    padding: const EdgeInsets.only(
                        top: SizeUtil.tinySpace,
                        left: SizeUtil.hugSpace,
                        bottom: SizeUtil.tinySpace),
                    value: 6,
                    groupValue: shopLocation,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setShopLocation(val);
                    },
                  ),
                ],
              )
            : SizedBox(),
        CustomRadioButton(
          label: S.of(context).delivery_to_address,
          padding: const EdgeInsets.only(
              left: SizeUtil.bigSpacehigher,
              top: SizeUtil.smallSpace,
              bottom: SizeUtil.smallSpace),
          value: 2,
          groupValue: deliveryMenthod,
          onChanged: (val) {
            setSelectDeliveryMenthod(val);
          },
        ),
      ],
    );
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
