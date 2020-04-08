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
    return _RatedDetailScreenState();
  }
}

class _RatedDetailScreenState extends BaseState<RatedDetailScreen> {
  @override
  Widget buildWidget(BuildContext context) {
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
            // TODO-Hung: bỏ được cái column này đi thì tốt, có thể dùng RichText
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Container(
                  // TODO-Hung: Column set đc left mà, bỏ cái Container này đi
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
                  // TODO-Hung: Column set đc left mà, bỏ cái Container này đi
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
                  // TODO-Hung: Column set đc left mà, bỏ cái Container này đi
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
          // TODO-Hung: dung WigetUtil.getLine
          Container(
            margin: EdgeInsets.only(
                top: SizeUtil.smallSpace, bottom: SizeUtil.tinySpace),
            height: SizeUtil.tinySpace,
            color: ColorUtil.lineColor,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: SizeUtil.smallSpace,
                right: SizeUtil.smallSpace,
                top: SizeUtil.tinySpace),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("photo/order_img.png",
                    width: MediaQuery.of(context).size.width / 6),
                Expanded(
                  // TODO-Hung: thay Container = Padding
                  child: Container(
                    padding: EdgeInsets.only(left: SizeUtil.smallSpace),
                    child: Column(
                      children: <Widget>[
                        // TODO-Hung: Column set đc left mà, bỏ cái Container này đi
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
                        // TODO-Hung: Column set đc left mà, bỏ cái Container này đi
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            S.of(context).supply_by_supplier("Vườn của bé"),
                            style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                          ),
                        ),
                        // TODO-Hung: Column set đc left mà, bỏ cái Container này đi
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
          // TODO-Hung: dung WidgetUtil.getLine
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: ColorUtil.gray,
            margin: EdgeInsets.all(SizeUtil.normalSpace),
          ),
          Padding(
            padding: const EdgeInsets.only(left: SizeUtil.normalSpace),
            child: Text(
                "Chất lượng sản phẩm tuyệt vời. Đóng gói sản phẩm \nrất đẹp và chắc chắn."),
          ),
          Row(
            children: <Widget>[
              // TODO-Hung: Sao row nay lại chỉ có 1 widget? bỏ row đi
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      left: SizeUtil.normalSpace,
                      right: SizeUtil.normalSpace,
                      top: SizeUtil.smallSpace,
                      bottom: SizeUtil.smallSpace),
                  // TODO-Hung: k cho anh test vào photo, dùng StringUtil.dummyImage
                  child: Image.asset("photo/rated_detail_img.png",
                      width: MediaQuery.of(context).size.width / 6),
                ),
              )
            ],
          ),
          // TODO-Hung: Column set đc left mà, bỏ cái Container này đi
          Container(
            child: Text("10-01-2020 12:17"),
            padding: EdgeInsets.only(left: SizeUtil.smallSpace),
            alignment: Alignment.centerLeft,
          )
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return null;
  }
}
