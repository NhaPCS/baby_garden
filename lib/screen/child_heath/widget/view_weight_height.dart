import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/child_heath/widget/child_chart.dart';
import 'package:baby_garden_flutter/screen/child_heath/widget/list_suggest_for_child.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ViewWeightHeight extends StatelessWidget {
  final dynamic testResults;
  final dynamic baby;
  final int tab;

  const ViewWeightHeight({Key key, this.testResults, this.baby, this.tab = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isHeightTab = tab == 0;
    dynamic newestResult = getFirstResult(isHeightTab);
    List<dynamic> products =
        newestResult == null || newestResult['suggest'] == null
            ? null
            : newestResult['suggest']['product'];
    String typeText = isHeightTab
        ? S.of(context).height.toLowerCase()
        : S.of(context).weight.toLowerCase();
    String gender = baby['gender'] == "1"
        ? S.of(context).boy.toLowerCase()
        : S.of(context).girl.toLowerCase();
    return ListView(
      padding: SizeUtil.smallPadding,
      children: <Widget>[
        Text(
          S.of(context).chart_for_girl(typeText, gender),
          style:
              TextStyle(color: ColorUtil.textGray, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        ChildChart(
          testResults: testResults != null
              ? (isHeightTab ? testResults['height'] : testResults['weight'])
              : [],
          baby: baby,
          tab: tab,
        ),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Wrap(
          children: List.generate(
              5,
              (index) => getNotice(context,
                  (isHeightTab ? HEIGHTS : WEIGHTS)[index], COLORS[index])),
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
              text: isHeightTab
                  ? S.of(context).height_is
                  : S.of(context).weight_is,
              style: TextStyle(color: ColorUtil.textColor)),
          TextSpan(
              text: newestResult == null
                  ? ''
                  : "${newestResult['value']} ${isHeightTab ? "cm" : "kg"}",
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
        Html(
            data: newestResult == null || newestResult['suggest'] == null
                ? ''
                : newestResult['suggest']['consult']),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Text(
          S.of(context).suggestion_products,
          style: TextStyle(
              color: ColorUtil.blueLight, fontWeight: FontWeight.bold),
        ),
        products == null
            ? SizedBox()
            : ListSuggestForChild(
                products: products,
              )
      ],
    );
  }

  Widget getNotice(BuildContext context, String text, Color color) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
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
        "${DateUtil.formatDDMMyyyy(newestResult['date_check'])} - ${newestResult['month']}");
  }

  String getEvaluate(BuildContext context, dynamic newestResult) {
    return "${newestResult['type'] == '1' ? S.of(context).height_is : S.of(context).weight_is} ${newestResult == null ? '' : newestResult['result']}";
  }

  dynamic getFirstResult(bool isHeightTab) {
    if (testResults == null) return null;
    dynamic data = isHeightTab ? testResults['height'] : testResults['weight'];
    if (data != null && data.isNotEmpty) {
      return data[0];
    }
    return null;
  }
}

const List<String> WEIGHTS = [
  "Trẻ suy dinh dưỡng thể nhẹ cân, mức độ nặng",
  "Trẻ suy dinh dưỡng thể nhẹ cân, mức độ vừa",
  "Trẻ cân nặng bình thường",
  "Trẻ thừa cân",
  "Trẻ béo phì"
];
const List<String> HEIGHTS = [
  "Trẻ suy dinh dưỡng thấp còi, mức độc nặng",
  "Trẻ suy dinh dưỡng thể thấp còi, mức độ vừa",
  "Trẻ chiều cao bình thường",
  "Chiều cao cao hơn so với lứa tuổi",
  "Chiều cao vượt trội so với lứa tuổi"
];
const List<Color> COLORS = [
  Color(0xff002060),
  Color(0xff00B050),
  Color(0xff92D050),
  Color(0xffFFC000),
  Color(0xffFF0000),
];
