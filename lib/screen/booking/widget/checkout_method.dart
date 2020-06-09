import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking/dialog/credit_transfer_checkout_dialogue.dart';
import 'package:baby_garden_flutter/screen/booking/dialog/point_checkout_dialogue.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/switchButton.dart';
import 'package:baby_garden_flutter/widget/checkbox/custom_radio_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class CheckoutMethodWG extends StatefulWidget {
  final ValueNotifier<int> checkoutMethod;
  final ValueNotifier<bool> pointCheckoutValueController;
  final Function onChangePoint;
  final int totalPoint;
  final int currentCheckoutPoint;

  const CheckoutMethodWG(
      {this.checkoutMethod,
      this.pointCheckoutValueController,
      this.onChangePoint,
      this.totalPoint = 0,
      this.currentCheckoutPoint = 0})
      : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CheckoutMethodWGState();
  }
}

class _CheckoutMethodWGState extends BaseState<CheckoutMethodWG> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return ValueListenableBuilder<int>(
      valueListenable: widget.checkoutMethod,
      builder: (BuildContext context, int value, Widget child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CustomRadioButton(
              titleContent: Text(
                S.of(context).cash_payment,
                style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail),
              ),
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpaceHigher,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              value: 1,
              groupValue: value,
              onChanged: (val) {
                widget.checkoutMethod.value = val;
              },
            ),
            CustomRadioButton(
              titleContent: Text(
                S.of(context).credit_transfer_payment,
                style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail),
              ),
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpaceHigher,
                  top: SizeUtil.smallSpace,
                  right: SizeUtil.normalSpace),
              value: 2,
              groupValue: value,
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
                widget.checkoutMethod.value = val;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpaceHigher,
                  bottom: SizeUtil.smallSpace,
                  right: SizeUtil.tinySpace),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      var point = await showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              PointCheckoutDialogue(
                                point: widget.totalPoint,
                              ));
                      if (widget.onChangePoint != null &&
                          point != null &&
                          point > 0) {
                        widget.onChangePoint(point);
                        widget.pointCheckoutValueController.value =
                            !widget.pointCheckoutValueController.value;
                      }
                    },
                    child: Text(
                      S.of(context).point_payment(widget.totalPoint),
                      style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                    ),
                  ),
                  Spacer(),
                  SwitchButton(
                    valueController: widget.pointCheckoutValueController,
                    valueChanged: (result) async {
                      if (result) {
                        var point = await showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                PointCheckoutDialogue(
                                  point: widget.totalPoint,
                                ));
                        if (widget.onChangePoint != null &&
                            point != null &&
                            point > 0) {
                          widget.onChangePoint(point);
                        } else {
                          widget.pointCheckoutValueController.value =
                              !widget.pointCheckoutValueController.value;
                        }
                      }
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

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }
}
