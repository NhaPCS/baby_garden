import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/checkout/widget/rich_text_form.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmDialogue extends StatelessWidget {
  final String bookingId;

  const ConfirmDialogue({Key key, this.bookingId=""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              border: Border.all(
                color: ColorUtil.primaryColor,
                width: 0.7,
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
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
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                  color: ColorUtil.lineColor),
              Text(
                S.of(context).congratulation_booking(""),
                style: TextStyle(
                  fontSize: SizeUtil.textSizeExpressTitle,
                ),
              ),
              SizedBox(
                height: SizeUtil.normalSpace,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: SizeUtil.normalSpace),
                child: RichTextForm(
                  title: S.of(context).order_code_title,
                  content: "  " + bookingId,
                  contentColor: ColorUtil.primaryColor,
                ),
              ),
              SizedBox(
                height: SizeUtil.defaultSpace,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MyRaisedButton(
                    onPressed: () {
                      Navigator.pop(context, 0);
                    },
                    color: ColorUtil.primaryColor,
                    text: S.of(context).continue_buying,
                    textStyle: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  MyRaisedButton(
                    color: ColorUtil.primaryColor,
                    onPressed: () {
                      Navigator.pop(context, 3);
                    },
                    text: S.of(context).view_order,
                    textStyle: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
