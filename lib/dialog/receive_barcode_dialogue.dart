import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReceiveBarCodeDialogue extends StatelessWidget{
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
              SizedBox(height: SizeUtil.bigSpacehigher,),
              SvgIcon('barcode-of-square-shape.svg'),
              SizedBox(height: SizeUtil.smallSpace,),
              Text("HD253628", style: TextStyle(color: ColorUtil.textColor,
                  fontWeight: FontWeight.normal,
                  fontSize: SizeUtil.textSizeLogo),),
              SizedBox(height: SizeUtil.defaultSpace,),
              Text(S.of(context).barcode_note, style: TextStyle(color: ColorUtil.textColor,
                  fontWeight: FontWeight.normal,
                  fontSize: SizeUtil.textSizeExpressDetail),),
              SizedBox(height: SizeUtil.bigSpacehigher,),
            ],
          ),
        ));
  }

}