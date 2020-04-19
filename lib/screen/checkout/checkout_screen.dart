import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/checkout/provider/payment_info_provider.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/checkout/view_model/checkout_view_model.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckoutScreenState();
  }
}

class _CheckoutScreenState
    extends BaseStateModel<CheckoutScreen, CheckoutViewModel> {
  final PaymentInfoProvider _paymentInfoProvider = new PaymentInfoProvider();
  final TextEditingController _noteController = new TextEditingController();

  @override
  void initState() {
    _paymentInfoProvider.getListPaymentInfo();
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).checkout.toUpperCase(),
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SvgIcon(
                  "shop.svg",
                  width: SizeUtil.iconSize,
                  height: SizeUtil.iconSize,
                ),
                SizedBox(
                  width: SizeUtil.smallSpace,
                ),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "Shop",
                        style: TextStyle(
                            color: ColorUtil.textColor,
                            fontSize: SizeUtil.textSizeExpressDetail,
                            fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: " Vườn Của Bé",
                        style: TextStyle(
                            color: ColorUtil.primaryColor,
                            fontSize: SizeUtil.textSizeExpressDetail,
                            fontWeight: FontWeight.bold))
                  ]),
                )
              ],
            ),
          ),
          WidgetUtil.getLine(
              margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
              color: ColorUtil.lineColor),
          Padding(
            padding: const EdgeInsets.only(left: SizeUtil.notifyHintSpace),
            // TODO-Hung: cái consumer này phải đặt bao ngoài dropDown chứ?
            // mà nếu chỉ bound dropdow thì vứt ra 1 cái widget riêng cho đẹp. Nếu widget này không dùng chung thì để ở trong folder hiện tại thôi
            child: Consumer<PaymentInfoProvider>(builder: (BuildContext context,
                PaymentInfoProvider value, Widget child) {
              var listInfo =
                  value.listInfo.length > 0 ? value.listInfo[value.val] : null;
              return Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SvgIcon(
                        "bank.svg",
                        width: SizeUtil.iconSize,
                        height: SizeUtil.iconSize,
                      ),
                      SizedBox(
                        width: SizeUtil.smallSpace,
                      ),
                      Text(S.of(context).bank,
                          style: TextStyle(
                              color: ColorUtil.textColor,
                              fontSize: SizeUtil.textSizeExpressDetail)),
                      // TODO-Hung: move thằng này ra Widget riêng
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropdownButton<int>(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: ColorUtil.primaryColor,
                              size: SizeUtil.iconSizeBigger,
                            ),
                            style: TextStyle(
                                color: ColorUtil.blue,
                                fontSize: SizeUtil.textSizeExpressDetail),
                            underline: SizedBox(),
                            value: value.val,
                            onChanged: (val) {
                              _paymentInfoProvider.onChangeBank(val);
                            },
                            items: List.generate(
                                value.listInfo.length,
                                (index) => new DropdownMenuItem(
                                    child: Text(
                                        value.listInfo[index]['bank_name']),
                                    value: index))),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.credit_card,
                          size: SizeUtil.iconMidSize,
                          color: ColorUtil.primaryColor,
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        ),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: S.of(context).bank_number,
                                style: TextStyle(
                                    color: ColorUtil.textColor,
                                    fontSize: SizeUtil.textSizeExpressDetail)),
                            TextSpan(
                                text:
                                    listInfo != null ? listInfo['account'] : "",
                                style: TextStyle(
                                    color: ColorUtil.blue,
                                    fontSize: SizeUtil.textSizeExpressDetail))
                          ]),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: SizeUtil.smallSpace,
                              right: SizeUtil.smallSpace,
                              top: SizeUtil.tinySpace,
                              bottom: SizeUtil.tinySpace),
                          child: GestureDetector(
                              onTap: () {
                                //TODO coppy
                              },
                              child: SvgIcon(
                                "ic_copy.svg",
                                width: SizeUtil.iconSizeDefault,
                                height: SizeUtil.iconSizeDefault,
                              )),
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: SizeUtil.tinySpace,
                              bottom: SizeUtil.tinySpace),
                          child: Icon(
                            Icons.person,
                            size: SizeUtil.iconMidSize,
                            color: ColorUtil.primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        ),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: S.of(context).owner_name,
                                style: TextStyle(
                                    color: ColorUtil.textColor,
                                    fontSize: SizeUtil.textSizeExpressDetail)),
                            TextSpan(
                                text: listInfo != null
                                    ? listInfo['user_name']
                                    : "",
                                style: TextStyle(
                                    color: ColorUtil.blue,
                                    fontSize: SizeUtil.textSizeExpressDetail))
                          ]),
                        )
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
          WidgetUtil.getLine(
              margin: EdgeInsets.only(top: SizeUtil.tinySpace),
              color: ColorUtil.lineColor),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SvgIcon(
                  "money.svg",
                  width: SizeUtil.iconSize,
                  height: SizeUtil.iconSize,
                  color: Colors.red,
                ),
                SizedBox(
                  width: SizeUtil.smallSpace,
                ),
                Text(S.of(context).transfer_info,
                    style: TextStyle(
                        color: ColorUtil.black33,
                        fontSize: SizeUtil.textSizeExpressDetail,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // TODO-Hung: cái rich text dùng nhiều nhỉ, viết hàm tạo riêng đi
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: S.of(context).contract_code,
                            style: TextStyle(
                                color: ColorUtil.grayLine,
                                fontSize: SizeUtil.textSizeExpressDetail)),
                        TextSpan(
                            text: "  VCB355125",
                            style: TextStyle(
                                color: ColorUtil.primaryColor,
                                fontSize: SizeUtil.textSizeExpressDetail))
                      ]),
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: S.of(context).amount,
                            style: TextStyle(
                                color: ColorUtil.grayLine,
                                fontSize: SizeUtil.textSizeExpressDetail)),
                        TextSpan(
                            text: "  425.000",
                            style: TextStyle(
                                color: ColorUtil.primaryColor,
                                fontSize: SizeUtil.textSizeExpressDetail))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: SizeUtil.defaultSpace,
                          right: SizeUtil.smallSpace,
                          top: SizeUtil.tinySpace,
                          bottom: SizeUtil.tinySpace),
                      child: GestureDetector(
                          onTap: () {
                            //TODO coppy
                          },
                          child: SvgIcon(
                            "ic_copy.svg",
                            width: SizeUtil.iconSizeDefault,
                            height: SizeUtil.iconSizeDefault,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: S.of(context).transfer_content,
                            style: TextStyle(
                                color: ColorUtil.grayLine,
                                fontSize: SizeUtil.textSizeExpressDetail)),
                        TextSpan(
                            text: "  0975441005 - VCB355125 - 425000",
                            style: TextStyle(
                                color: ColorUtil.primaryColor,
                                fontSize: SizeUtil.textSizeExpressDetail))
                      ]),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: SizeUtil.defaultSpace,
                          right: SizeUtil.smallSpace,
                          top: SizeUtil.tinySpace,
                          bottom: SizeUtil.tinySpace),
                      child: GestureDetector(
                          onTap: () {
                            //TODO coppy
                          },
                          child: SvgIcon(
                            "ic_copy.svg",
                            width: SizeUtil.iconSizeDefault,
                            height: SizeUtil.iconSizeDefault,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          WidgetUtil.getLine(
              margin: EdgeInsets.only(
                  top: SizeUtil.tinySpace, bottom: SizeUtil.smallSpace),
              color: ColorUtil.lineColor),
          //TODO upload image
          Container(
            margin: EdgeInsets.only(
                left: SizeUtil.largeSpace, right: SizeUtil.largeSpace),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(SizeUtil.smallRadius)),
              // TODO-Hung: border 4 hướng giống nhau thì dùng Border.all
              border: Border(
                left: BorderSide(
                  color: ColorUtil.textColor,
                  width: 1,
                ),
                right: BorderSide(
                  color: ColorUtil.textColor,
                  width: 1,
                ),
                top: BorderSide(
                  color: ColorUtil.textColor,
                  width: 1,
                ),
                bottom: BorderSide(
                  color: ColorUtil.textColor,
                  width: 1,
                ),
              ),
            ),
            padding: EdgeInsets.only(
                left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeUtil.defaultSpace,
                ),
                SvgIcon("photo-camera.svg",
                    width: MediaQuery.of(context).size.width / 5),
                Text(
                  S.of(context).press_to_upload,
                  style: TextStyle(
                      color: ColorUtil.black33,
                      fontSize: SizeUtil.textSizeNotiTime),
                ),
                SizedBox(
                  height: SizeUtil.defaultSpace,
                )
              ],
            ),
          ),
          SizedBox(
            height: SizeUtil.tinySpace,
          ),
          Center(
              child: Text(
            S.of(context).upload_notice,
            style: TextStyle(
                color: ColorUtil.textColor,
                fontSize: SizeUtil.textSizeExpressDetail),
          )),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          //TODO input note
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 7,
            margin: EdgeInsets.only(
                left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
            decoration: BoxDecoration(
              color: ColorUtil.lineColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(SizeUtil.smallRadius)),
              // TODO-Hung: border 4 hướng giống nhau thì dùng Border.all
              border: Border(
                left: BorderSide(
                  color: ColorUtil.textColor,
                  width: 1,
                ),
                right: BorderSide(
                  color: ColorUtil.textColor,
                  width: 1,
                ),
                top: BorderSide(
                  color: ColorUtil.textColor,
                  width: 1,
                ),
                bottom: BorderSide(
                  color: ColorUtil.textColor,
                  width: 1,
                ),
              ),
            ),
            child: TextField(
              style: TextStyle(fontSize: SizeUtil.textSizeSmall),
              obscureText: false,
              controller: _noteController,
              decoration: InputDecoration(
                  fillColor: ColorUtil.lineColor,
                  filled: true,
                  enabledBorder: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(SizeUtil.bigRadius)),
                    borderSide:
                        const BorderSide(color: ColorUtil.white, width: 0.0),
                  ),
                  focusColor: ColorUtil.white,
                  hoverColor: ColorUtil.white,
                  hintText: S.of(context).enter_your_note,
                  hintStyle: TextStyle(fontSize: SizeUtil.textSizeSmall),
                  contentPadding: EdgeInsets.only(
                    left: 2,
                    right: 4,
                  )),
            ),
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Center(
              child: Text(
            S.of(context).checkout_note,
            style: TextStyle(
                color: ColorUtil.textColor,
                fontSize: SizeUtil.textSizeExpressDetail),
          )),
          WidgetUtil.getLine(
              margin: EdgeInsets.only(
                  top: SizeUtil.smallSpace, bottom: SizeUtil.smallSpace),
              width: SizeUtil.smallSpace),
          //TODO submid
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
                  print("ajsdaks das d");
                  getViewModel().onCheckout(
                      userID: Provider.of<UserProvider>(context, listen: false)
                          .userInfo['id'],
                      bookingId: 1,
                      money: 7182368123,
                      content: _noteController.text.trim(),
                      note: _noteController.text.trim());
                  showConfirmDialogue(context);
                },
                color: ColorUtil.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(SizeUtil.tinyRadius),
                )),
                child: Container(
                  padding: EdgeInsets.all(SizeUtil.midSpace),
                  child: Text(
                    S.of(context).finish_checkout.toUpperCase(),
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
    return [ChangeNotifierProvider.value(value: _paymentInfoProvider)];
  }

  showPrivacyAndPolicyDialogue(BuildContext context) {
    // TODO-Hung: vứt dialog ra folder dialog, k để chung ở đây
    Dialog simpleDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            // TODO-Hung: border 4 hướng giống nhau thì dùng Border.all
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
              // TODO-Hung: bỏ padding ra ngoài column, nhiều padding con quá
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.smallSpace,
                        top: SizeUtil.tinySpace,
                        right: SizeUtil.tinySpace),
                    child: Text(
                      S.of(context).overral_policy,
                      style: TextStyle(
                          color: ColorUtil.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeUtil.textSizeSmall),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.smallSpace,
                        top: SizeUtil.tinySpace,
                        right: SizeUtil.tinySpace),
                    child: Text(
                      S.of(context).policy_1,
                      style: TextStyle(
                          color: ColorUtil.textColor,
                          fontWeight: FontWeight.normal,
                          fontSize: SizeUtil.textSizeSmall),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.smallSpace,
                        top: SizeUtil.tinySpace,
                        right: SizeUtil.tinySpace),
                    child: Text(
                      S.of(context).privacy,
                      style: TextStyle(
                          color: ColorUtil.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeUtil.textSizeSmall),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.smallSpace,
                        top: SizeUtil.tinySpace,
                        right: SizeUtil.tinySpace),
                    child: Text(
                      S.of(context).privacy_1,
                      style: TextStyle(
                          color: ColorUtil.textColor,
                          fontWeight: FontWeight.normal,
                          fontSize: SizeUtil.textSizeSmall),
                    ),
                  ),
                ],
              ),
              Center(
                // TODO-Hung: dùng MyRaisedButton
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
    showDialog(context: context, builder: (_) => simpleDialog);
  }

  showConfirmDialogue(BuildContext context) {
    // TODO-Hung: vứt dialog ra folder dialog, k để chung ở đây
    Dialog simpleDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            // TODO-Hung: dùng Border.all
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // TODO-Hung: thấy giao diện làm xong đâu cần center? bỏ center đi, padding thấy cũng đặt bao ngoài column đc mà?
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: SizeUtil.midSmallSpace,
                      bottom: SizeUtil.midSmallSpace),
                  child: Text(
                    S.of(context).booking_success,
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontSize: SizeUtil.textSizeExpressTitle,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                  color: ColorUtil.lineColor),
              Center(
                child: Text(
                  S.of(context).congratulation_booking(" Moon "),
                  style: TextStyle(
                    fontSize: SizeUtil.textSizeExpressTitle,
                  ),
                ),
              ),
              SizedBox(
                height: SizeUtil.normalSpace,
              ),
              Padding(
                padding: const EdgeInsets.only(left: SizeUtil.normalSpace),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: S.of(context).order_code_title,
                        style: TextStyle(
                            color: ColorUtil.grayLine,
                            fontSize: SizeUtil.textSizeExpressDetail)),
                    TextSpan(
                        text: "  VCB355125",
                        style: TextStyle(
                            color: ColorUtil.primaryColor,
                            fontSize: SizeUtil.textSizeExpressDetail))
                  ]),
                ),
              ),
              SizedBox(
                height: SizeUtil.defaultSpace,
              ),
              // TODO-Hung: k cần center ở đây
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // TODO-Hung: dùng MyRaisedButton
                    RaisedButton(
                      onPressed: () {
                        pushAndReplaceAll(MainScreen(), "/main_screen");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(SizeUtil.smallRadius),
                      )),
                      color: ColorUtil.primaryColor,
                      child: Text(
                        S.of(context).continue_buying,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // TODO-Hung: dùng MyRaisedButton
                    RaisedButton(
                      onPressed: () {
                        pushAndReplaceAll(
                            MainScreen(
                              index: 3,
                            ),
                            "/main_screen");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(SizeUtil.smallRadius),
                      )),
                      color: ColorUtil.primaryColor,
                      child: Text(
                        S.of(context).view_order,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }

  @override
  CheckoutViewModel initViewModel() {
    return new CheckoutViewModel(context);
  }
}
