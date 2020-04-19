import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/material.dart';

class GetVoucherCodeDialog extends StatelessWidget {
  final VoidCallback onGetVoucherPress;

  const GetVoucherCodeDialog({Key key, this.onGetVoucherPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeUtil.smallRadius),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: SizeUtil.smallPadding,
                color: ColorUtil.primaryColor,
                child: Text(S.of(context).notify,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeBigger,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Padding(
                padding: SizeUtil.defaultPadding,
                child: Text(
                  S.of(context).getCodeNotifyText,
                  style: TextStyle(fontSize: SizeUtil.textSizeBigger),
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: SizeUtil.defaultSpace,
                  ),
                  Expanded(
                      child: MyRaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: S.of(context).cancelDialog,
                    textStyle: TextStyle(color: Colors.white),
                    color: ColorUtil.colorAccent,
                    borderRadius: SizeUtil.tinyRadius,
                    padding: SizeUtil.normalPadding,
                  )),
                  SizedBox(
                    width: SizeUtil.defaultSpace,
                  ),
                  Expanded(
                      child: MyRaisedButton(
                    onPressed: () async {
                      onGetVoucherPress();
                      Navigator.of(context).pop();
                    },
                    text: S.of(context).agree,
                    textStyle: TextStyle(color: Colors.white),
                    borderRadius: SizeUtil.tinyRadius,
                    color: ColorUtil.blue,
                    padding: SizeUtil.normalPadding,
                  )),
                  SizedBox(
                    width: SizeUtil.defaultSpace,
                  ),
                ],
              ),
              SizedBox(
                height: SizeUtil.defaultSpace,
              ),
            ],
          ),
        ));
  }
}
