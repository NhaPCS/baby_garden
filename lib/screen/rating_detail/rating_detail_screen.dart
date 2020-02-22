import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';

class RatingDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RatingDetailScreenState();
  }
}

class _RatingDetailScreenState extends BaseState<RatingDetailScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorUtil.primaryColor));
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).order_rating("vcb19.12.15"),
        centerTitle: true,
        bgColor: ColorUtil.primaryColor,
        titleColor: Colors.white,
        backColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).order_with_code("VCB19.12.25"),
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: ColorUtil.textColor),
                  ),
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).order_date("25/12/2019 12:25"),
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).receiving_date("25/12/2019 12:25"),
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: SizeUtil.smallSpace, bottom: SizeUtil.tinySpace),
            height: SizeUtil.tinySpace,
            color: ColorUtil.lineColor,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
            child: Row(
              children: <Widget>[
                Image.asset("photo/logo.png",
                    width: MediaQuery.of(context).size.width / 6),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: SizeUtil.smallSpace),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            S.of(context).order_title,
                            style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: SizeUtil.tinySpace,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            S.of(context).supply_by_supplier("Vườn của bé"),
                            style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: SizeUtil.tinySpace, bottom: SizeUtil.smallSpace),
            child: RatingBar(
              enable: true,
              value: 0,
              isIcon: true,
              showRateCount: false,
              iconColor: ColorUtil.primaryColor,
              starSize: SizeUtil.iconSizeBig,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
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
                TextField(
                  style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                  decoration: InputDecoration(
                      hintText: S.of(context).rating_hint,
                      border: InputBorder.none),
                ),
                SizedBox(
                  height: SizeUtil.normalSpace,
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(
                SizeUtil.smallSpace,
              ),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(SizeUtil.smallRadius),
                )),
                color: ColorUtil.blueForgotPass,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      //todo alignment center content
                      child: SizedBox(),
                    ),
                    Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: SizeUtil.smallSpace,
                    ),
                    Text(
                      S.of(context).add_image,
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              )),
          Expanded(
            child: SizedBox(),
          ),
          Container(
              padding: const EdgeInsets.all(
                SizeUtil.smallSpace,
              ),
              width: MediaQuery.of(context).size.width,
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
                  S.of(context).send_rating,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal),
                ),
              )),
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
