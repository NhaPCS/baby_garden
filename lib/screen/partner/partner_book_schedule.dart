import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class PartnerBookScheduleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PartnerBookScheduleScreenState();
  }
}

class _PartnerBookScheduleScreenState
    extends BaseState<PartnerBookScheduleScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).vcb_express.toUpperCase()),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                "photo/partner_item_img.png",
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: SizeUtil.midSmallSpace,right: SizeUtil.midSmallSpace,top: SizeUtil.tinySpace,bottom: SizeUtil.tinySpace),
                      decoration: BoxDecoration(
                        color: Color(0xffF6F6F6),
                        borderRadius: BorderRadius.all(Radius.circular(SizeUtil.smallRadius))
                      ),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Image.asset(
                            "photo/comment_img.png",
                            width: SizeUtil.iconSizeDefault,
                            height: SizeUtil.iconSizeDefault,
                          ),
                          SizedBox(
                            width: SizeUtil.tinySpace,
                          ),
                          Text(
                            "12",
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: ColorUtil.textColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeUtil.tinySpace,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: SizeUtil.midSmallSpace,right: SizeUtil.midSmallSpace,top: SizeUtil.tinySpace,bottom: SizeUtil.tinySpace),
                      decoration: BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.all(Radius.circular(SizeUtil.smallRadius))
                      ),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Image.asset(
                            "photo/heart.png",
                            width: SizeUtil.iconSizeDefault,
                            height: SizeUtil.iconSizeDefault,
                          ),
                          SizedBox(
                            width: SizeUtil.tinySpace,
                          ),
                          Text(
                            "234",
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: ColorUtil.textColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return null;
  }
}
