import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CheckoutScreenState();
  }
}

class _CheckoutScreenState extends BaseState<CheckoutScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return SafeArea(
        child: Scaffold(
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
            child: Column(
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
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: S.of(context).bank,
                            style: TextStyle(
                                color: ColorUtil.textColor,
                                fontSize: SizeUtil.textSizeExpressDetail)),
                        TextSpan(
                            text: " Vietcombank",
                            style: TextStyle(
                                color: ColorUtil.blue,
                                fontSize: SizeUtil.textSizeExpressDetail))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: SizeUtil.smallSpace,
                          right: SizeUtil.smallSpace,
                          top: SizeUtil.tinySpace,
                          bottom: SizeUtil.tinySpace),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorUtil.primaryColor,
                        size: SizeUtil.iconSizeBigger,
                      ),
                    )
                  ],
                ),
                Row(
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
                            text: " 0011004057146",
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: SizeUtil.tinySpace, bottom: SizeUtil.tinySpace),
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
                            text: " Vũ Thị Hài",
                            style: TextStyle(
                                color: ColorUtil.blue,
                                fontSize: SizeUtil.textSizeExpressDetail))
                      ]),
                    )
                  ],
                )
              ],
            ),
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
                        ..onTap = () => print(" asjkd"),
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
    ));
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }
}