import 'package:baby_garden_flutter/generated/l10n.dart';
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
        )
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
