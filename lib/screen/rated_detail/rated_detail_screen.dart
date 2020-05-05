import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Text(
                  S.of(context).order_with_code("VCB19.12.25"),
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault,
                      color: ColorUtil.textColor),
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Text(
                  S.of(context).order_date("25/12/2019 12:25"),
                  style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Text(
                  S.of(context).receiving_date("25/12/2019 12:25"),
                  style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          WidgetUtil.getLine(
            margin: EdgeInsets.only(
                top: SizeUtil.smallSpace, bottom: SizeUtil.tinySpace),
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
                  child: Padding(
                    padding: EdgeInsets.only(left: SizeUtil.smallSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          S.of(context).order_title,
                          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: SizeUtil.tinySpace,
                        ),
                        Text(
                          S.of(context).supply_by_supplier("Vườn của bé"),
                          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                        ),
                        RatingBar(
                          enable: false,
                          iconColor: ColorUtil.primaryColor,
                          showRateCount: false,
                          isIcon: true,
                          value: 3,
                          alignment: MainAxisAlignment.start,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          WidgetUtil.getLine(
            margin: EdgeInsets.all(SizeUtil.normalSpace),
            color: ColorUtil.gray,
          ),
          Padding(
            padding: const EdgeInsets.only(left: SizeUtil.normalSpace),
            child: Text(
                "Chất lượng sản phẩm tuyệt vời. Đóng gói sản phẩm \nrất đẹp và chắc chắn."),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeUtil.normalSpace,
                right: SizeUtil.normalSpace,
                top: SizeUtil.smallSpace,
                bottom: SizeUtil.smallSpace),
            child: CachedNetworkImage(imageUrl: StringUtil.dummyImage,width: MediaQuery.of(context).size.width / 2)
          ),
          Text("10-01-2020 12:17")
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return null;
  }
}
