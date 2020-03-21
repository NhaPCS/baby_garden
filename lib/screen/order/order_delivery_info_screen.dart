import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';

class OrderDeliveryInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OrderDeliveryInfoScreenState();
  }
}

class _OrderDeliveryInfoScreenState extends BaseState<OrderDeliveryInfoScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
        appBar: getAppBar(
          title: S.of(context).delivery_info,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white,
        ),
        body: SafeArea(
            child: ListView(children: <Widget>[
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
            title: "Đang vận chuyển",
            subTitle: "25-12-2019 15:42",
            targetColor: Colors.blue,
            isShowSeparate: true,
            separateLinePadding: EdgeInsets.only(left: SizeUtil.smallSpace),
          ),
              TrackingItem(
                isFirstItem: false,
                padding: EdgeInsets.only( left: SizeUtil.smallSpace),
                title: "Lưu kho",
                subTitle: "25-12-2019 9:30",
                isShowSeparate: true,
                separateLinePadding: EdgeInsets.only(left: SizeUtil.smallSpace),
              ),
              TrackingItem(
                isFirstItem: false,
                padding: EdgeInsets.only( left: SizeUtil.smallSpace),
                title: "Đang lấy hàng",
                subTitle: "25-12-2019 9:30",
                isShowSeparate: true,
                separateLinePadding: EdgeInsets.only(left: SizeUtil.smallSpace),
              ),
              TrackingItem(
                isFirstItem: false,
                padding: EdgeInsets.only( left: SizeUtil.smallSpace),
                title: "Chờ lấy hàng",
                subTitle: "25-12-2019 9:30",
                isShowSeparate: true,
                separateLinePadding: EdgeInsets.only(left: SizeUtil.smallSpace),
              ),
WidgetUtil.getLine(width: 4,margin: EdgeInsets.all(0),color: Color(0xffDFDFDF))
        ])));
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }
}

class TrackingItem extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets separateLinePadding;
  final bool isShowSeparate;
  final bool isFirstItem;
  final Color targetColor;
  final Color firstLineColor;
  final Color secondLineColor;
  final String title;
  final String subTitle;

  const TrackingItem(
      {Key key,
      this.padding = const EdgeInsets.only(
          left: SizeUtil.normalSpace,
          right: SizeUtil.normalSpace,
          top: SizeUtil.midSmallSpace),
      this.title,
      this.subTitle,
      this.isFirstItem = false,
      this.targetColor = const Color(0xff6C6C6C),
      this.firstLineColor = const Color(0xff6C6C6C),
      this.secondLineColor = const Color(0xff6C6C6C),
      this.separateLinePadding = const EdgeInsets.all(0),
      this.isShowSeparate = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              isFirstItem
                  ? SizedBox()
                  : Container(
                      color: firstLineColor,
                      width: 1,
                      height: SizeUtil.defaultSpace,
                    ),
              Icon(Icons.radio_button_checked,
                size: SizeUtil.iconSizeSmall,
                color: targetColor,
              ),
              Container(
                color: const Color(0xff6C6C6C),
                width: 1,
                height: 24,
              )
            ],
          ),
          SizedBox(
            width: SizeUtil.smallSpace,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeExpressDetail,
                    color: targetColor),
              ),
              SizedBox(
                height: SizeUtil.tinySpace,
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    color: ColorUtil.textColor),
              ),
              isShowSeparate
                  ? WidgetUtil.getLine(width: 1, margin: separateLinePadding,color: Color(0xffDFDFDF))
                  : SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}
