import 'dart:io';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/checkout/dialogue/confirm_dialogue.dart';
import 'package:baby_garden_flutter/screen/checkout/provider/payment_info_provider.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/order_detail/order_detail_screen.dart';
import 'package:baby_garden_flutter/widget/button/privacy_policy_button.dart';
import 'package:baby_garden_flutter/screen/checkout/widget/rich_text_form.dart';
import 'package:baby_garden_flutter/screen/checkout/widget/title_icon.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/checkout/view_model/checkout_view_model.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  final int bookingId;
  final int totalPrice;
  final String bookingCode;
  final String phone;

  const CheckoutScreen(
      {this.bookingId, this.totalPrice, this.bookingCode, this.phone})
      : super();

  @override
  State<StatefulWidget> createState() {
    return _CheckoutScreenState();
  }
}

class _CheckoutScreenState
    extends BaseStateModel<CheckoutScreen, CheckoutViewModel> {
  final PaymentInfoProvider _paymentInfoProvider = new PaymentInfoProvider();
  final TextEditingController _noteController = new TextEditingController();
  final ValueNotifier<File> uploadImageController =
      new ValueNotifier(new File(""));

  @override
  void initState() {
    _paymentInfoProvider.getListPaymentInfo();
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    String transferContent =
        " ${widget.phone} - ${widget.bookingCode} - ${StringUtil.getPriceText(widget.totalPrice.toString())}";
    return WillPopScope(
      onWillPop: _onBackPress,
      child: Scaffold(
        appBar: getAppBar(
            title: S.of(context).checkout.toUpperCase(),
            centerTitle: true,
            bgColor: ColorUtil.primaryColor,
            titleColor: Colors.white,
            backColor: Colors.white,
            isShowConfirmDialogue: true,
            content: S.of(context).checkout_notice,
            alertTitle: S.of(context).notify),
        body: ListView(
          children: <Widget>[
            TitleIcon(
              padding: const EdgeInsets.all(8.0),
              svgIcon: "shop.svg",
              title: "Shop",
              content: " Vườn Của Bé",
              contentStyle: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontSize: SizeUtil.textSizeExpressDetail,
                  fontWeight: FontWeight.bold),
            ),
            WidgetUtil.getLine(
                margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                color: ColorUtil.lineColor),
            Padding(
              padding: const EdgeInsets.only(left: SizeUtil.notifyHintSpace),
              child: Consumer<PaymentInfoProvider>(builder:
                  (BuildContext context, PaymentInfoProvider value,
                      Widget child) {
                var listInfo = value.listInfo.length > 0
                    ? value.listInfo[value.val]
                    : null;
                return Column(
                  children: <Widget>[
                    TitleIcon(
                      svgIcon: "bank.svg",
                      title: S.of(context).bank,
                      contentWidget: Padding(
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
                      ),
                    ),
                    TitleIcon(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      icon: Icons.credit_card,
                      title: S.of(context).bank_number,
                      content: listInfo != null ? listInfo['account'] : "",
                      isTrailing: true,
                      onTrailingTap: () {
                        Clipboard.setData(
                            ClipboardData(text: listInfo['account']));
                      },
                    ),
                    TitleIcon(
                      iconPadding: const EdgeInsets.only(
                          top: SizeUtil.tinySpace, bottom: SizeUtil.tinySpace),
                      padding: const EdgeInsets.only(bottom: 4.0),
                      icon: Icons.person,
                      title: S.of(context).owner_name,
                      content: listInfo != null ? listInfo['user_name'] : "",
                    ),
                  ],
                );
              }),
            ),
            WidgetUtil.getLine(
                margin: EdgeInsets.only(top: SizeUtil.tinySpace),
                color: ColorUtil.lineColor),
            TitleIcon(
              padding: const EdgeInsets.all(8.0),
              svgIcon: "money.svg",
              title: S.of(context).transfer_info,
              titleStyle: TextStyle(
                  color: ColorUtil.black33,
                  fontSize: SizeUtil.textSizeExpressDetail,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichTextForm(
                        title: S.of(context).contract_code,
                        content: "  ${widget.bookingCode}",
                        contentColor: ColorUtil.primaryColor,
                      ),
                      Spacer(),
                      RichTextForm(
                        title: S.of(context).amount,
                        content:
                            "  ${StringUtil.getPriceText(widget.totalPrice.toString())}",
                        contentColor: ColorUtil.primaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: SizeUtil.defaultSpace,
                            right: SizeUtil.smallSpace,
                            top: SizeUtil.tinySpace,
                            bottom: SizeUtil.tinySpace),
                        child: GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: widget.totalPrice.toString()));
                          },
                          child: SvgIcon(
                            "ic_copy.svg",
                            width: SizeUtil.iconSizeDefault,
                            height: SizeUtil.iconSizeDefault,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Row(
                    children: <Widget>[
                      RichTextForm(
                        title: S.of(context).transfer_content,
                        content: transferContent,
                        contentColor: ColorUtil.primaryColor,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: SizeUtil.smallSpace,
                            top: SizeUtil.tinySpace,
                            bottom: SizeUtil.tinySpace),
                        child: GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: transferContent));
                          },
                          child: SvgIcon(
                            "ic_copy.svg",
                            width: SizeUtil.iconSizeDefault,
                            height: SizeUtil.iconSizeDefault,
                          ),
                        ),
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
            GestureDetector(
              onTap: () {
                ImageUtil.uploadImage(context, (value) {
//                  setState(() {
//                  _pickedImage = value;
//                  widget.onSelectImage(value);
                  uploadImageController.value = value;
//                  });
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: SizeUtil.largeSpace, right: SizeUtil.largeSpace),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeUtil.smallRadius)),
                  border: Border.all(
                    color: ColorUtil.textColor,
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.only(
                    left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: SizeUtil.defaultSpace,
                    ),
                    ValueListenableBuilder<File>(
                      valueListenable: uploadImageController,
                      builder:
                          (BuildContext context, File value, Widget child) {
                        print(value);
                        return value == null || value.path == ""
                            ? SvgIcon("photo-camera.svg",
                                width: MediaQuery.of(context).size.width / 5)
                            : CircleImage(
                                borderRadius: SizeUtil.zeroSpace,
                                imageFile: value,
                                imageUrl: null,
                                width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.width / 5);
                      },
                    ),
                    Text(
                      S.of(context).press_to_upload,
                      style: TextStyle(
                          color: ColorUtil.black33,
                          fontSize: SizeUtil.textSizeNoticeTime),
                    ),
                    SizedBox(
                      height: SizeUtil.defaultSpace,
                    )
                  ],
                ),
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 7,
              margin: EdgeInsets.only(
                  left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
              decoration: BoxDecoration(
                color: ColorUtil.lineColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(SizeUtil.smallRadius)),
                border: Border.all(
                  color: ColorUtil.textColor,
                  width: 1,
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
            PrivacyPolicyButton(),
            MyRaisedButton(
              padding: const EdgeInsets.only(
                  left: SizeUtil.smallSpace,
                  right: SizeUtil.smallSpace,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              onPressed: () async {
                getViewModel().onCheckout(
                    userID: Provider.of<UserProvider>(context, listen: false)
                        .userInfo['id'],
                    bookingId: widget.bookingId.toString(),
                    money: widget.totalPrice.toDouble(),
                    content: transferContent,
                    note: _noteController.text.trim(),
                    file: uploadImageController.value);
                int index = await showDialog(
                    context: context,
                    builder: (BuildContext context) => ConfirmDialogue());
                print(" HOME INDEX $index");
                if (index != null) {
                  if(index>0){
                    push(OrderDetailScreen(
                      bookingId: widget.bookingId.toString(),
                    ));
                  }else {
                    pushAndReplaceAll(MainScreen(index: index), "/main_screen");
                  }
                }else{
                  pushAndReplaceAll(MainScreen(index: 0), "/main_screen");
                }
              },
              text: S.of(context).finish_checkout.toUpperCase(),
              textStyle: TextStyle(
                  fontSize: SizeUtil.textSizeDefault,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
              color: ColorUtil.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _paymentInfoProvider)];
  }

  @override
  CheckoutViewModel initViewModel() {
    return new CheckoutViewModel(context);
  }

  Future<bool> _onBackPress() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        child: new CupertinoAlertDialog(
          title: Text(S.of(context).notify),
          content: Padding(
            padding: EdgeInsets.only(top: SizeUtil.smallSpace),
            child: new Text(S.of(context).checkout_notice),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(S.of(context).yes),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(S.of(context).no),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
