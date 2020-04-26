import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/order_delivery_info/widget/tracking_item.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class OrderDeliveryInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderDeliveryInfoScreenState();
  }
}

class _OrderDeliveryInfoScreenState extends BaseState<OrderDeliveryInfoScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          title: S.of(context).delivery_info,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white,
        ),
        body: ListView(children: <Widget>[
          WidgetUtil.getLine(
              width: SizeUtil.smallSpace,
              margin: EdgeInsets.all(0),
              color: Color(0xffDFDFDF)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: SizeUtil.midSmallSpace),
                  child: Image.asset("photo/order_img.png",
                      width: MediaQuery.of(context).size.width / 6),
                ),
                SizedBox(
                  width: SizeUtil.tinySpace,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: SizeUtil.smallSpace,
                    ),
                    Text(
                      "Đơn hàng VCB19.12.25",
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeExpressTitle,
                          color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: SizeUtil.tinySpace,
                    ),
                    Text(
                      "Đơn vị vận chuyển: Giao hàng nhanh",
                      style: TextStyle(
                          height: 1.5,
                          fontSize: SizeUtil.textSizeExpressTitle,
                          color: ColorUtil.textColor),
                      textAlign: TextAlign.start,
                    ),
                  ],
                )
              ],
            ),
          ),
          WidgetUtil.getLine(
              width: 1, margin: EdgeInsets.only(left: SizeUtil.smallSpace)),
          TrackingItem(
            isFirstItem: true,
            padding: EdgeInsets.only(
                top: SizeUtil.smallSpace, left: SizeUtil.smallSpace),
            title: S.of(context).delivering,
            subTitle: "25-12-2019 15:42",
            targetColor: Colors.blue,
            isShowSeparate: true,
            separateLinePadding: EdgeInsets.only(left: SizeUtil.smallSpace),
          ),
          TrackingItem(
            isFirstItem: false,
            padding: EdgeInsets.only(left: SizeUtil.smallSpace),
            title: "Lưu kho",
            subTitle: "25-12-2019 9:30",
            isShowSeparate: true,
            separateLinePadding: EdgeInsets.only(left: SizeUtil.smallSpace),
          ),
          TrackingItem(
            isFirstItem: false,
            padding: EdgeInsets.only(left: SizeUtil.smallSpace),
            title: "Đang lấy hàng",
            subTitle: "25-12-2019 9:30",
            isShowSeparate: true,
            separateLinePadding: EdgeInsets.only(left: SizeUtil.smallSpace),
          ),
          TrackingItem(
            isFirstItem: false,
            padding: EdgeInsets.only(left: SizeUtil.smallSpace),
            title: "Chờ lấy hàng",
            subTitle: "25-12-2019 9:30",
            isShowSeparate: true,
            separateLinePadding: EdgeInsets.only(left: SizeUtil.smallSpace),
          ),
          WidgetUtil.getLine(
              width: 4, margin: EdgeInsets.all(0), color: Color(0xffDFDFDF))
        ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}