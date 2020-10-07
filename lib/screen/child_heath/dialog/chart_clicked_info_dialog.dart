import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:flutter/material.dart';

class ChartClickedInfoDialog extends StatelessWidget {
  final dynamic testResult;
  final dynamic baby;
  final int tab;

  const ChartClickedInfoDialog({Key key, this.testResult, this.baby, this.tab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      title: Text(
        S.of(context).check_result,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: ColorUtil.blueLight,
            fontWeight: FontWeight.bold,
            fontSize: SizeUtil.textSizeDefault),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleImage(
                width: 100,
                height: 100,
                borderRadius: 10,
                imageUrl: testResult['img'],
              ),
              SizedBox(
                width: SizeUtil.smallSpace,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: S.of(context).baby,
                        style: TextStyle(
                            color: ColorUtil.textGray,
                            fontSize: SizeUtil.textSizeDefault)),
                    TextSpan(
                        text: " ${baby['name']}",
                        style: TextStyle(
                            color: ColorUtil.primaryColor,
                            fontSize: SizeUtil.textSizeDefault))
                  ])),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: S.of(context).birthday_is,
                        style: TextStyle(
                            color: ColorUtil.textGray,
                            fontSize: SizeUtil.textSizeDefault)),
                    TextSpan(
                        text: " ${baby['birthday']}",
                        style: TextStyle(
                            color: ColorUtil.primaryColor,
                            fontSize: SizeUtil.textSizeDefault))
                  ])),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: S.of(context).check_date_is,
                        style: TextStyle(
                            color: ColorUtil.textGray,
                            fontSize: SizeUtil.textSizeDefault)),
                    TextSpan(
                        text: " ${testResult['date_check']}",
                        style: TextStyle(
                            color: ColorUtil.primaryColor,
                            fontSize: SizeUtil.textSizeDefault))
                  ])),
                ],
              )),
            ],
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: tab == 0
                    ? S.of(context).height_is
                    : S.of(context).weight_is,
                style: TextStyle(
                    color: ColorUtil.textGray,
                    fontSize: SizeUtil.textSizeDefault)),
            TextSpan(
                text: getValueText(),
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: SizeUtil.textSizeDefault)),
            TextSpan(
                text: S.of(context).rank_is,
                style: TextStyle(
                    color: ColorUtil.textGray,
                    fontSize: SizeUtil.textSizeDefault)),
            TextSpan(
                text: testResult == null ? '' : (testResult['category'] ?? ''),
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: SizeUtil.textSizeDefault))
          ])),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: S.of(context).test_result_is,
                style: TextStyle(
                    color: ColorUtil.textGray,
                    fontSize: SizeUtil.textSizeDefault)),
            TextSpan(
                text:
                    " ${testResult['suggest'] == null ? '' : StringUtil.removeHtml((testResult['suggest']['consult'] ?? ''))}",
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: SizeUtil.textSizeDefault))
          ])),
        ],
      ),
    );
  }

  String getValueText() {
    if (tab == 0) {
      return " ${testResult['value']}cm";
    } else {
      return " ${testResult['value']}kg";
    }
  }
}
