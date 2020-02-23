import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';

class RatedDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RatedDetailScreenState();
  }
}

class _RatedDetailScreenState extends BaseState<RatedDetailScreen> {
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
                        Container(
                          child: RatingBar(
                            enable: false,
                            iconColor: ColorUtil.primaryColor,
                            showRateCount: false,
                            isIcon: true,
                            value: 3,
                            alignment: MainAxisAlignment.start,
                          ),
                          alignment: Alignment.centerLeft,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: ColorUtil.gray,
            margin: EdgeInsets.all(SizeUtil.normalSpace),
          ),
          Text(
              "Chất lượng sản phẩm tuyệt vời. Đóng gói sản phẩm \nrất đẹp và chắc chắn."),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(SizeUtil.smallSpace),
                  child: Image.asset("photo/rated_detail_img.png",
                      width: MediaQuery.of(context).size.width / 6),
                ),
              )
            ],
          ),
          Container(child: Text("10-01-2020 12:17"),
          padding: EdgeInsets.only(left: SizeUtil.smallSpace),
          alignment: Alignment.centerLeft,)
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
