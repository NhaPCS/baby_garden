import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/child_heath/list_suggest_for_child.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/chart/child_chart.dart';
import 'package:flutter/material.dart';

class ViewWeightHeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: SizeUtil.smallPadding,
      children: <Widget>[
        Text(
          S.of(context).chart_for_girl,
          style:
              TextStyle(color: ColorUtil.textGray, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        ChildChart(),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Wrap(
          children: [
            getNotice(context, S.of(context).normal_height, Color(0xff00BBFF)),
            getNotice(
                context, S.of(context).greater_than_age, Color(0xffFFD500)),
            getNotice(context, S.of(context).suy_dinh_duong_normal,
                Color(0xffFF9100)),
            getNotice(context, S.of(context).sdd_nang, Color(0xffFF0000)),
          ],
        ),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Đánh giá kết quả: ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: ColorUtil.blueLight)),
          TextSpan(
              text: "(Lần kiểm tra mới nhất: 15/06/2019 - 36 tháng)",
              style: TextStyle(color: ColorUtil.blueLight)),
        ])),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Chiều cao: ",
              style: TextStyle(color: ColorUtil.textColor)),
          TextSpan(
              text: "Trẻ suy dinh dưỡng thể thấp còi, mức độ vừa",
              style: TextStyle(color: ColorUtil.primaryColor)),
        ])),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Text(
          "Tư vấn dinh dưỡng:",
          style: TextStyle(
              color: ColorUtil.blueLight, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Text(
            "Bé đang hơi khiêm tốn chiều cao một chút, bố mẹ có thể bổ sung thêm dinh dưỡng, hoặc xem lại chế độ ăn cho bé đã p..."),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Text(
          "Sản phẩm gợi ý:",
          style: TextStyle(
              color: ColorUtil.blueLight, fontWeight: FontWeight.bold),
        ),
        ListSuggestForChild(),
        ListSuggestForChild()
      ],
    );
  }

  Widget getNotice(BuildContext context, String text, Color color) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.46,
      child: Row(
        children: <Widget>[
          Container(
            width: 30,
            height: 10,
            margin: EdgeInsets.only(right: SizeUtil.smallSpace),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Expanded(child: Text(text))
        ],
      ),
    );
  }
}
