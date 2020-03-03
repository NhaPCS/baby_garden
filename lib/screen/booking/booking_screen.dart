import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_added_promo.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/custom_radio_button.dart';
import 'package:baby_garden_flutter/widget/dot_line_separator.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
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

class _BookingScreenState extends BaseState<BookingScreen>
    with SingleTickerProviderStateMixin {
  int deliveryMenthod;

  int shopLocation;

  int checkoutMenthod;

  int transferMenthod;

  int deliveryAddress;

  int receiveTime;

  bool isHasReceiveTime = true;

  bool isUpdatePointCheckout = false;

  bool pointCheckout = false;

  TabController _dayTabControler;

  @override
  void initState() {
    // TODO: implement initState
    _dayTabControler = TabController(vsync: this, length: 3);
    isHasReceiveTime = true;
    deliveryMenthod = 0;
    shopLocation = 0;
    checkoutMenthod = 0;
    transferMenthod = 0;
    deliveryAddress = 0;
    receiveTime = 0;
    pointCheckout = false;
    super.initState();
  }

  setReceiveTime(val) {
    setState(() {
      receiveTime = val;
    });
  }

  setDeliveryAddress(val) {
    print("setDeliveryAddress ${val}");
    setState(() {
      deliveryAddress = val;
    });
  }

  setTransferMenthod(val) {
    setState(() {
      transferMenthod = val;
    });
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
      print("setShopLocation ${val}");
      shopLocation = val;
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(
        child: Text(
          "Thứ hai\n01/02/2020",
          style: TextStyle(
            fontSize: SizeUtil.textSizeSmall,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Tab(
        child: Text(
          "Thứ ba\n02/02/2020",
          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
          textAlign: TextAlign.center,
        ),
      ),
      Tab(
        child: Text(
          "Thứ tư\n03/02/2020",
          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
          textAlign: TextAlign.center,
        ),
      ),
    ];
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
                    showChangeDeliveryAddressDialogue(context);
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
            //TODO receive time
            deliveryMenthod == 1
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
                              showChangeReceiveTimeDialogue(context, myTabs);
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
                : SizedBox(),
            //TODO CHECKOUT MENTHOD
            ListTitleCustom(
              padding: const EdgeInsets.only(
                  left: SizeUtil.normalSpace,
                  right: SizeUtil.normalSpace,
                  top: SizeUtil.midSmallSpace,
                  bottom: SizeUtil.midSmallSpace),
              icon: SvgIcon(
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
                          ..onTap = () => showPrivacyAndPolicyDialogue(context),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CustomRadioButton(
          crossAxisAlignment: CrossAxisAlignment.center,
          titleContent: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'photo/ghn_icon.png',
                width: 40,
                height: 16,
              ),
              SizedBox(
                width: SizeUtil.tinySpace,
              ),
              Text(
                "Giao hàng nhanh",
                style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail),
              ),
            ],
          ),
          subTitle: Text(
            S.of(context).delivery_plan("2 ngày"),
            style: TextStyle(
                fontSize: SizeUtil.textSizeNotiTime, color: ColorUtil.gray),
          ),
          padding: const EdgeInsets.only(
              left: SizeUtil.bigSpacehigher,
              top: SizeUtil.smallSpace,
              bottom: SizeUtil.smallSpace),
          value: 1,
          groupValue: transferMenthod,
          onChanged: (val) {
            setTransferMenthod(val);
          },
        ),
        Container(
            margin: EdgeInsets.only(
              left: SizeUtil.notifyHintSpace,
            ),
            child: MySeparator(
              color: ColorUtil.lineColor,
              paddingLeft: SizeUtil.largeSpace,
            )),
        CustomRadioButton(
          crossAxisAlignment: CrossAxisAlignment.center,
          titleContent: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'photo/ghn_icon.png',
                width: 40,
                height: 16,
              ),
              SizedBox(
                width: SizeUtil.tinySpace,
              ),
              Text(
                "Giao hàng tiết kiệm",
                style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail),
              ),
            ],
          ),
          subTitle: Text(
            S.of(context).delivery_plan("4 ngày"),
            style: TextStyle(
                fontSize: SizeUtil.textSizeNotiTime, color: ColorUtil.gray),
          ),
          padding: const EdgeInsets.only(
              left: SizeUtil.bigSpacehigher,
              top: SizeUtil.smallSpace,
              bottom: SizeUtil.smallSpace),
          value: 2,
          groupValue: transferMenthod,
          onChanged: (val) {
            setTransferMenthod(val);
          },
        ),
        Container(
            margin: EdgeInsets.only(
              left: SizeUtil.notifyHintSpace,
            ),
            child: MySeparator(
              color: ColorUtil.lineColor,
              paddingLeft: SizeUtil.largeSpace,
            )),
        CustomRadioButton(
          crossAxisAlignment: CrossAxisAlignment.center,
          titleContent: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'photo/ghn_icon.png',
                width: 40,
                height: 16,
              ),
              SizedBox(
                width: SizeUtil.tinySpace,
              ),
              Text(
                "Ahamove",
                style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail),
              ),
            ],
          ),
          subTitle: Text(
            S.of(context).delivery_plan("4 giờ"),
            style: TextStyle(
                fontSize: SizeUtil.textSizeNotiTime, color: ColorUtil.gray),
          ),
          padding: const EdgeInsets.only(
              left: SizeUtil.bigSpacehigher,
              top: SizeUtil.smallSpace,
              bottom: SizeUtil.smallSpace),
          value: 3,
          groupValue: transferMenthod,
          onChanged: (val) {
            setTransferMenthod(val);
          },
        ),
        Container(
            margin: EdgeInsets.only(
                left: SizeUtil.notifyHintSpace, bottom: SizeUtil.smallSpace),
            child: MySeparator(
              color: ColorUtil.lineColor,
            )),
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
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                            ),
                            hintText: S.of(context).delivery_code,
                            hintStyle:
                                TextStyle(fontSize: SizeUtil.textSizeSmall),
                            contentPadding: EdgeInsets.only(left: 8, right: 4)),
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
                    )
                  ],
                ),
              ),
              ItemAddedPromo(
                padding: EdgeInsets.only(top: SizeUtil.tinySpace, bottom: 0),
              ),
              ItemAddedPromo(
                padding: EdgeInsets.only(top: SizeUtil.tinySpace, bottom: 0),
              ),
            ],
          ),
        ),
        WidgetUtil.getLine(margin: EdgeInsets.all(0)),
        Padding(
          padding: const EdgeInsets.only(
              left: SizeUtil.smallSpace, top: SizeUtil.smallSpace),
          child: Text(
            S.of(context).booking_note,
            style: TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(SizeUtil.smallSpace),
          child: TextField(
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
  }

  Widget getCheckoutMenthod() {
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
          groupValue: checkoutMenthod,
          onChanged: (val) {
            setCheckoutMenthod(val);
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
          groupValue: checkoutMenthod,
          trailing: InkWell(
            onTap: () {
              showCreditTransferCheckoutDialogue(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: SizeUtil.tinySpace,
                  bottom: SizeUtil.tinySpace,
                  left: SizeUtil.tinySpace),
              child: Text(
                S.of(context).detail,
                style: TextStyle(
                    color: ColorUtil.blue, fontSize: SizeUtil.textSizeSmall),
              ),
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
              GestureDetector(
                onTap: (){
                  setState(() {
                    print("tab change ${pointCheckout}");
                    pointCheckout = !pointCheckout;
                    if(pointCheckout){
                      showPointCheckoutDialogue(context);
                    }
                  });
                },
                child: Text(
                  S.of(context).point_payment(200),
                  style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                ),
              ),
              Spacer(),
              Switch(
                value: pointCheckout,
                onChanged: (val) {
                  print("change ${val}");
                  pointCheckout = val;
                  if(pointCheckout){
                    showPointCheckoutDialogue(context);
                  }
                },
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
          titleContent: Text(S.of(context).delivery_in_shop),
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
                    titleContent:
                        Text("38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội"),
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
                    titleContent:
                        Text("38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội"),
                    padding: const EdgeInsets.only(
                        left: SizeUtil.hugSpace, bottom: SizeUtil.tinySpace),
                    value: 2,
                    groupValue: shopLocation,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setShopLocation(val);
                    },
                  ),
                  CustomRadioButton(
                    titleContent:
                        Text("38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội"),
                    padding: const EdgeInsets.only(
                        left: SizeUtil.hugSpace, bottom: SizeUtil.tinySpace),
                    value: 3,
                    groupValue: shopLocation,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setShopLocation(val);
                    },
                  ),
                  CustomRadioButton(
                    titleContent:
                        Text("38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội"),
                    padding: const EdgeInsets.only(
                        left: SizeUtil.hugSpace, bottom: SizeUtil.tinySpace),
                    value: 4,
                    groupValue: shopLocation,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setShopLocation(val);
                    },
                  ),
                  CustomRadioButton(
                    titleContent:
                        Text("38 Nguyễn Viết Xuân, Thanh Xuân, Hà Nội"),
                    padding: const EdgeInsets.only(
                        left: SizeUtil.hugSpace, bottom: SizeUtil.tinySpace),
                    value: 5,
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
          titleContent: Text(S.of(context).delivery_to_address),
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

  showChangeReceiveTimeDialogue(BuildContext context, List<Tab> myTabs) {
    Dialog simpleDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  right: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  top: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  bottom: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TabBar(
                    controller: _dayTabControler,
                    labelColor: ColorUtil.primaryColor,
                    indicatorColor: ColorUtil.white,
                    unselectedLabelColor: ColorUtil.textColor,
                    tabs: myTabs,
                    onTap: (val) {
                      setState(() =>
                          {isHasReceiveTime = _dayTabControler.index != 1});
                    },
                  ),
                  WidgetUtil.getLine(
                      margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                      color: ColorUtil.lineColor),
                  isHasReceiveTime
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CustomRadioButton(
                              titleContent: Text(
                                "09:00 - 11:00",
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeSmall,
                                    color: Colors.black),
                              ),
                              padding: const EdgeInsets.only(
                                  bottom: SizeUtil.tinySpace,
                                  top: SizeUtil.tinySpace,
                                  left: SizeUtil.smallSpace,
                                  right: SizeUtil.smallSpace),
                              value: 0,
                              groupValue: receiveTime,
                              iconSize: SizeUtil.iconSize,
                              titleSize: SizeUtil.textSizeSmall,
                              onChanged: (val) {
                                setState(() => receiveTime = val);
//                      setDeliveryAddress(val);
                              },
                            ),
                            CustomRadioButton(
                              titleContent: Text(
                                "14:00 - 16:00",
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeSmall,
                                    color: Colors.black),
                              ),
                              padding: const EdgeInsets.only(
                                  bottom: SizeUtil.tinySpace,
                                  top: SizeUtil.tinySpace,
                                  left: SizeUtil.smallSpace,
                                  right: SizeUtil.smallSpace),
                              value: 1,
                              groupValue: receiveTime,
                              iconSize: SizeUtil.iconSize,
                              titleSize: SizeUtil.textSizeSmall,
                              onChanged: (val) {
                                setState(() => receiveTime = val);
//                      setDeliveryAddress(val);
                              },
                            ),
                            CustomRadioButton(
                              titleContent: Text(
                                "19:00 - 21:00",
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeSmall,
                                    color: Colors.black),
                              ),
                              padding: const EdgeInsets.only(
                                  bottom: SizeUtil.tinySpace,
                                  top: SizeUtil.tinySpace,
                                  left: SizeUtil.smallSpace,
                                  right: SizeUtil.smallSpace),
                              value: 2,
                              groupValue: receiveTime,
                              iconSize: SizeUtil.iconSize,
                              titleSize: SizeUtil.textSizeSmall,
                              onChanged: (val) {
                                setState(() => receiveTime = val);
//                      setDeliveryAddress(val);
                              },
                            ),
                          ],
                        )
                      : Column(
                          children: <Widget>[
                            SizedBox(
                              height: SizeUtil.defaultSpace,
                            ),
                            SvgIcon("ic_startup.svg"),
                            Text(
                              "Không có giờ giao hàng",
                              style: TextStyle(
                                  color: ColorUtil.primaryColor,
                                  fontSize: SizeUtil.textSizeSmall),
                            ),
                            Text(
                              "Vui lòng chọn ngày khác",
                              style: TextStyle(
                                  color: ColorUtil.textColor,
                                  fontSize: SizeUtil.textSizeSmall),
                            ),
                            SizedBox(
                              height: SizeUtil.hugSpace,
                            ),
                          ],
                        ),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
//                      showBookingScheduleSuccess(context);
//                      setState(()=>{isHasReceiveTime = true});
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(SizeUtil.smallRadius),
                    )),
                    color: ColorUtil.primaryColor,
                    child: Text(
                      S.of(context).confirm,
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            );
          },
        ));
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }

  showChangeDeliveryAddressDialogue(BuildContext context) {
    Dialog simpleDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  right: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  top: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  bottom: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: SizeUtil.midSmallSpace,
                        bottom: SizeUtil.midSmallSpace),
                    child: Text(
                      S.of(context).change_delivery_address,
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontSize: SizeUtil.textSizeExpressTitle,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  WidgetUtil.getLine(
                      margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                      color: ColorUtil.lineColor),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  CustomRadioButton(
                    titleContent: Text(
                      "Lê Văn Lĩnh - 0975 441 005\n28 Phan Kế Bính\nPhường Cống Vị, Quận Ba Đình, Hà Nội",
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          color: Colors.black),
                    ),
                    padding: const EdgeInsets.only(
                        bottom: SizeUtil.tinySpace,
                        top: SizeUtil.tinySpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    value: 0,
                    groupValue: deliveryAddress,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setState(() => deliveryAddress = val);
//                      setDeliveryAddress(val);
                    },
                  ),
                  CustomRadioButton(
                    titleContent: Text(
                      "Lê Văn Lĩnh - 0975 441 005\n28 Phan Kế Bính\nPhường Cống Vị, Quận Ba Đình, Hà Nội",
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          color: Colors.black),
                    ),
                    padding: const EdgeInsets.only(
                        bottom: SizeUtil.tinySpace,
                        top: SizeUtil.tinySpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    value: 1,
                    groupValue: deliveryAddress,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setState(() => deliveryAddress = val);
//                      setDeliveryAddress(val);
                    },
                  ),
                  CustomRadioButton(
                    titleContent: Text(
                      "Lê Văn Lĩnh - 0975 441 005\n28 Phan Kế Bính\nPhường Cống Vị, Quận Ba Đình, Hà Nội",
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          color: Colors.black),
                    ),
                    padding: const EdgeInsets.only(
                        bottom: SizeUtil.tinySpace,
                        top: SizeUtil.tinySpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    value: 2,
                    groupValue: deliveryAddress,
                    iconSize: SizeUtil.iconSize,
                    titleSize: SizeUtil.textSizeSmall,
                    onChanged: (val) {
                      setState(() => deliveryAddress = val);
//                      setDeliveryAddress(val);
                    },
                  ),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          showAddingAddressDialogue(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(SizeUtil.smallRadius),
                        )),
                        color: ColorUtil.primaryColor,
                        child: Text(
                          S.of(context).add_new,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: SizeUtil.defaultSpace,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
//                      showBookingScheduleSuccess(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(SizeUtil.smallRadius),
                        )),
                        color: ColorUtil.primaryColor,
                        child: Text(
                          S.of(context).confirm,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ));
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }

  showPrivacyAndPolicyDialogue(BuildContext context) {
    Dialog simpleDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            border: Border(
              left: BorderSide(
                color: ColorUtil.primaryColor,
                width: 0.7,
              ),
              right: BorderSide(
                color: ColorUtil.primaryColor,
                width: 0.7,
              ),
              top: BorderSide(
                color: ColorUtil.primaryColor,
                width: 0.7,
              ),
              bottom: BorderSide(
                color: ColorUtil.primaryColor,
                width: 0.7,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: SizeUtil.midSmallSpace,
                    bottom: SizeUtil.midSmallSpace),
                child: Text(
                  S.of(context).policy_privacy,
                  style: TextStyle(
                      color: ColorUtil.primaryColor,
                      fontSize: SizeUtil.textSizeExpressTitle,
                      fontWeight: FontWeight.bold),
                ),
              ),
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                  color: ColorUtil.lineColor),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                  child: Text(S.of(context).overral_policy,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.bold,fontSize: SizeUtil.textSizeSmall),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                  child: Text(S.of(context).policy_1,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.normal,fontSize: SizeUtil.textSizeSmall),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                  child: Text(S.of(context).privacy,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.bold,fontSize: SizeUtil.textSizeSmall),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                  child: Text(S.of(context).privacy_1,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.normal,fontSize: SizeUtil.textSizeSmall),),
                ),
              ],),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeUtil.smallRadius),
                      )),
                  color: ColorUtil.primaryColor,
                  child: Text(
                    S.of(context).confirm,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ));
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }

  showCreditTransferCheckoutDialogue(BuildContext context) {
    Dialog simpleDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            border: Border(
              left: BorderSide(
                color: ColorUtil.primaryColor,
                width: 0.7,
              ),
              right: BorderSide(
                color: ColorUtil.primaryColor,
                width: 0.7,
              ),
              top: BorderSide(
                color: ColorUtil.primaryColor,
                width: 0.7,
              ),
              bottom: BorderSide(
                color: ColorUtil.primaryColor,
                width: 0.7,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: SizeUtil.midSmallSpace,
                    bottom: SizeUtil.midSmallSpace),
                child: Text(
                  S.of(context).credit_transfer,
                  style: TextStyle(
                      color: ColorUtil.primaryColor,
                      fontSize: SizeUtil.textSizeExpressTitle,
                      fontWeight: FontWeight.bold),
                ),
              ),
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                  color: ColorUtil.lineColor),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).delivery_in_place,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.bold,fontSize: SizeUtil.textSizeSmall),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).delivery_policy,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.normal,fontSize: SizeUtil.textSizeSmall),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).get_in_shop,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.bold,fontSize: SizeUtil.textSizeSmall),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).checkout_policy,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.normal,fontSize: SizeUtil.textSizeSmall),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).checkout_policy_overal,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.normal,fontSize: SizeUtil.textSizeSmall),),
                  ),
                ],),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeUtil.smallRadius),
                      )),
                  color: ColorUtil.primaryColor,
                  child: Text(
                    S.of(context).confirm,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ));
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }

  showPointCheckoutDialogue(BuildContext context) {
    Dialog simpleDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: StatefulBuilder(
          //TODO update radio and tabcontroller state
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  right: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  top: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  bottom: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: SizeUtil.midSmallSpace,
                        bottom: SizeUtil.midSmallSpace),
                    child: Text(
                      S.of(context).point_payment_title,
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontSize: SizeUtil.textSizeExpressTitle,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  WidgetUtil.getLine(
                      margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                      color: ColorUtil.lineColor),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.tinySpace, top: SizeUtil.tinySpace),
                    child: Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: S.of(context).current_point,
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeSmall,
                                    color: ColorUtil.textColor,
                                    fontWeight: FontWeight.normal)),
                            TextSpan(
                                text: " 200 điểm",
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeSmall,
                                    color: ColorUtil.primaryColor,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        ),
                        Icon(
                          Icons.cached,
                          size: SizeUtil.iconSize,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.tinySpace, top: SizeUtil.smallSpace),
                    child: Row(
                      children: <Widget>[
                        Text(S.of(context).point_for_booking,
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: ColorUtil.textColor)),
                        Container(
                          width: 45,
                          height: 20,
                          child: TextField(
                            onChanged: (string) {
                              setState(() => {
                                isUpdatePointCheckout == false
                                    ? isUpdatePointCheckout = true
                                    : print("nothing")
                              });
                            },
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: ColorUtil.primaryColor,
                                fontWeight: FontWeight.bold),
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                                ),
                                hintText: "100",
                                hintStyle: TextStyle(
                                    fontSize: SizeUtil.textSizeSmall,
                                    color: ColorUtil.primaryColor,
                                    fontWeight: FontWeight.bold),
                                contentPadding: EdgeInsets.only(
                                    left: 2, right: 2, top: 2, bottom: 2)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, top: SizeUtil.smallSpace),
                    child: Text(
                      S.of(context).point_payment_policy,
                      style: TextStyle(
                          color: Colors.blue, fontSize: SizeUtil.textSizeSmall),
                    ),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  isUpdatePointCheckout
                      ? Center(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() => {isUpdatePointCheckout = false});
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(SizeUtil.smallRadius),
                          )),
                      color: ColorUtil.primaryColor,
                      child: Text(
                        S.of(context).update,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(SizeUtil.smallRadius),
                            )),
                        color: ColorUtil.primaryColor,
                        child: Text(
                          S.of(context).cancel,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: SizeUtil.defaultSpace,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
//                      showBookingScheduleSuccess(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(SizeUtil.smallRadius),
                            )),
                        color: ColorUtil.primaryColor,
                        child: Text(
                          S.of(context).confirm,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ));
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }

  showAddingAddressDialogue(BuildContext context) {
    Dialog simpleDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  right: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  top: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                  bottom: BorderSide(
                    color: ColorUtil.primaryColor,
                    width: 0.7,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: SizeUtil.midSmallSpace,
                        bottom: SizeUtil.midSmallSpace),
                    child: Text(
                      S.of(context).add_delivery_address,
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontSize: SizeUtil.textSizeExpressTitle,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  WidgetUtil.getLine(
                      margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                      color: ColorUtil.lineColor),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  MyTextField(
                    hint: S.of(context).enter_receiver_name,
                    title: S.of(context).add_receiver,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: false,
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).enter_receive_phone,
                    title: S.of(context).phone,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    inputType: TextInputType.phone,
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: false,
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).enter_address,
                    title: S.of(context).delivery_address,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: false,
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).choose_province,
                    title: S.of(context).province,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: true,
                    onTrailingTap: () {},
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).choose_district,
                    title: S.of(context).district,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: true,
                    onTrailingTap: () {},
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).choose_sub_district,
                    title: S.of(context).sub_district,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: true,
                    onTrailingTap: () {},
                    isBorder: false,
                  ),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: CircleCheckbox(
                        padding: const EdgeInsets.only(
                            left: SizeUtil.tinySpace,
                            right: 0,
                            top: 0,
                            bottom: 0),
                        checkBg: Icons.check_box,
                        text: Text(
                          S.of(context).set_delivery_address,
                          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                        ),
                        uncheckBg: Icons.check_box_outline_blank,
                        color: ColorUtil.gray),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(SizeUtil.smallRadius),
                        )),
                        color: ColorUtil.primaryColor,
                        child: Text(
                          S.of(context).cancel,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: SizeUtil.defaultSpace,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
//                      showBookingScheduleSuccess(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(SizeUtil.smallRadius),
                        )),
                        color: ColorUtil.primaryColor,
                        child: Text(
                          S.of(context).add_new,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ));
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
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
