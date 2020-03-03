import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
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
        appBar: getAppBar(title: S.of(context).checkout.toUpperCase(),
            centerTitle: true,
            bgColor: ColorUtil.primaryColor,
            titleColor: Colors.white,
            backColor: Colors.white),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                SvgIcon("shop.svg",width: SizeUtil.iconSize,height: SizeUtil.iconSize,),
                  SizedBox(width: SizeUtil.smallSpace,)
                , RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Shop",
                        style: TextStyle(color: ColorUtil.textColor,fontSize: SizeUtil.textSizeExpressDetail,fontWeight: FontWeight.normal)
                      ),
                      TextSpan(
                          text: " Vườn Của Bé",
                          style: TextStyle(color: ColorUtil.primaryColor,fontSize: SizeUtil.textSizeExpressDetail,fontWeight: FontWeight.bold)
                      )
                    ]
                  ),
                )
              ],),
            ),
            Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SvgIcon("bank.svg",width: SizeUtil.iconSize,height: SizeUtil.iconSize,),
                    SizedBox(width: SizeUtil.smallSpace,)
                    , RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: "Shop",
                                style: TextStyle(color: ColorUtil.textColor,fontSize: SizeUtil.textSizeExpressDetail,fontWeight: FontWeight.normal)
                            ),
                            TextSpan(
                                text: " Vườn Của Bé",
                                style: TextStyle(color: ColorUtil.primaryColor,fontSize: SizeUtil.textSizeExpressDetail,fontWeight: FontWeight.bold)
                            )
                          ]
                      ),
                    )
                  ],),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SvgIcon("shop.svg",width: SizeUtil.iconSize,height: SizeUtil.iconSize,),
                    SizedBox(width: SizeUtil.smallSpace,)
                    , RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: "Shop",
                                style: TextStyle(color: ColorUtil.textColor,fontSize: SizeUtil.textSizeExpressDetail,fontWeight: FontWeight.normal)
                            ),
                            TextSpan(
                                text: " Vườn Của Bé",
                                style: TextStyle(color: ColorUtil.primaryColor,fontSize: SizeUtil.textSizeExpressDetail,fontWeight: FontWeight.bold)
                            )
                          ]
                      ),
                    )
                  ],),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SvgIcon("shop.svg",width: SizeUtil.iconSize,height: SizeUtil.iconSize,),
                    SizedBox(width: SizeUtil.smallSpace,)
                    , RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: "Shop",
                                style: TextStyle(color: ColorUtil.textColor,fontSize: SizeUtil.textSizeExpressDetail,fontWeight: FontWeight.normal)
                            ),
                            TextSpan(
                                text: " Vườn Của Bé",
                                style: TextStyle(color: ColorUtil.primaryColor,fontSize: SizeUtil.textSizeExpressDetail,fontWeight: FontWeight.bold)
                            )
                          ]
                      ),
                    )
                  ],)
              ],
            )
          ],
        ),
      )
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }
}
