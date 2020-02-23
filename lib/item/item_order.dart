import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WidgetUtil.paddingWidget(
            Row(
              children: <Widget>[
                Expanded(child: Text("Mã đơn VCB19.12.25")),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: S.of(context).provided_by,
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          color: ColorUtil.textColor)),
                  TextSpan(
                      text: "Vườn Của Bé",
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          fontWeight: FontWeight.bold,
                          color: ColorUtil.red)),
                ]))
              ],
            ),
            padding: EdgeInsets.only(
                left: SizeUtil.smallSpace,
                right: SizeUtil.smallSpace,
                top: SizeUtil.smallSpace)),
        WidgetUtil.getLine(),
        Row(
          children: <Widget>[
            SizedBox(
              width: SizeUtil.smallSpace,
            ),
            CircleImage(
              width: Provider.of<AppProvider>(context).categoryWidth,
              height: Provider.of<AppProvider>(context).categoryWidth,
              imageUrl: StringUtil.dummyImage,
              borderRadius: 2,
            ),
            SizedBox(
              width: SizeUtil.smallSpace,
            ),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Chăm sóc da mặt từ cơ bản đến nâng cao"),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Text(
                  "Thời gian thực hiện: 120 phút",
                  style: TextStyle(color: ColorUtil.textGray),
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Text(
                  "Ngày sử dung: 14.02.2019 - 10:00",
                  style: TextStyle(color: ColorUtil.textGray),
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    Text(
                      S.of(context).total_order_price,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorUtil.textColor),
                    ),
                    Text(
                      "700.000 đ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: ColorUtil.red),
                    ),
                    SizedBox(
                      width: SizeUtil.smallSpace,
                    )
                  ],
                ),
              ],
            ))
          ],
        ),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        WidgetUtil.getLine(
            width: 5, margin: EdgeInsets.only(top: SizeUtil.smallSpace))
      ],
    );
  }
}
