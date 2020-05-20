import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/child_heath/widget/list_suggest_for_child.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/child_heath/widget/child_chart.dart';
import 'package:flutter/material.dart';

class ViewWeightHeight extends StatelessWidget {
  final List<dynamic> testResults;
  final dynamic baby;

  const ViewWeightHeight({Key key, this.testResults, this.baby})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic newestResult = testResults != null && testResults.isNotEmpty
        ? testResults[testResults.length - 1]
        : null;
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
        ChildChart(
          testResults: testResults,
          baby: baby,
        ),
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
              text: S.of(context).child_test_results_evaluate,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: ColorUtil.blueLight)),
          TextSpan(
              text: getTheNewestDate(context, newestResult),
              style: TextStyle(color: ColorUtil.blueLight)),
        ])),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: newestResult == null
                  ? ''
                  : newestResult['type'] == 1
                      ? S.of(context).height_is
                      : S.of(context).weight_is,
              style: TextStyle(color: ColorUtil.textColor)),
          TextSpan(
              text: newestResult == null ? '' : newestResult['result'],
              style: TextStyle(color: ColorUtil.primaryColor)),
        ])),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Text(
          S.of(context).nutrition_consulting,
          style: TextStyle(
              color: ColorUtil.blueLight, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Text(newestResult == null ? '' : newestResult['advice']),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Text(
          S.of(context).suggestion_products,
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

  String getTheNewestDate(BuildContext context, dynamic newestResult) {
    if (newestResult == null) return S.of(context).newest_test_time('');
    return S.of(context).newest_test_time(
        "${DateUtil.formatDDMMyyyy(newestResult['date'])} - ${newestResult['month']}");
  }

  String getEvaluate(BuildContext context, dynamic newestResult) {
    return "${newestResult['type'] == '1' ? S.of(context).height_is : S.of(context).weight_is} ${newestResult == null ? '' : newestResult['result']}";
  }
}
