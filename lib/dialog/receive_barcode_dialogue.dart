import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:barcode_generator/barcode_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReceiveBarCodeDialogue extends StatelessWidget {
  final String code;

  ReceiveBarCodeDialogue(this.code);

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
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: SizeUtil.bigSpaceHigher,
              ),
              BarcodeGenerator(
                witdth: double.infinity,
                height: 100,
                fromString: code,
                codeType: BarCodeType.kBarcodeFormatCode128,
              ),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              MyText(
                code,
                style: TextStyle(
                    color: ColorUtil.textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: SizeUtil.textSizeLogo),
              ),
              SizedBox(
                height: SizeUtil.defaultSpace,
              ),
              Text(
                S.of(context).barcode_note,
                style: TextStyle(
                    color: ColorUtil.textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: SizeUtil.textSizeExpressDetail),
              ),
              SizedBox(
                height: SizeUtil.bigSpaceHigher,
              ),
            ],
          ),
        ));
  }
}
