import 'dart:math';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/child_heath/dialog/chart_clicked_info_dialog.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChildChart extends StatefulWidget {
  final List<dynamic> testResults;
  final dynamic baby;
  final int tab;

  const ChildChart({Key key, this.testResults, this.baby, this.tab}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChildChartState();
}

class ChildChartState extends State<ChildChart> {
  static const double barWidth = 22;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double maxValue = getMaxValue();
    return AspectRatio(
      aspectRatio: 1.5,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        child: Padding(
          padding: SizeUtil.smallPadding,
          child: Row(
            children: <Widget>[
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  isHeightTab()
                      ? S.of(context).height_cm
                      : S.of(context).weight_kg,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceEvenly,
                      maxY: maxValue,
                      groupsSpace: 12,
                      barTouchData: BarTouchData(
//                        touchTooltipData: BarTouchTooltipData(),
                          enabled: true,
                          touchCallback: (barRes) {
                            if (barRes != null &&
                                barRes.spot != null &&
                                barRes.spot.touchedBarGroupIndex != null) {
                              try {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ChartClickedInfoDialog(
                                        testResult: widget.testResults[
                                            barRes.spot.touchedBarGroupIndex],
                                        baby: widget.baby,
                                        tab: widget.tab
                                      );
                                    });
                              } on Exception catch (e) {}
                            }
                          }),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          textStyle: const TextStyle(
                              color: ColorUtil.textColor,
                              fontSize: SizeUtil.textSizeSmall),
                          getTitles: (double value) {
                            return widget.testResults == null
                                ? '0'
                                : getMonthText(
                                    widget.testResults[value.toInt()]);
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          textStyle: const TextStyle(
                              color: ColorUtil.textColor, fontSize: 10),
                          getTitles: (double value) {
                            if (value == 0) {
                              return '';
                            }
                            return '${value.toInt()}';
                          },
                          interval: maxValue/10,
                          margin: 5,
                          reservedSize: 30,
                        ),
                      ),
                      gridData: FlGridData(
                        show: false,
                      ),
                      borderData: FlBorderData(
                          show: true,
                          border: Border(
                              left: BorderSide(
                                  width: 1, color: ColorUtil.lightGray),
                              bottom: BorderSide(
                                  width: 1, color: ColorUtil.lightGray))),
                      barGroups: widget.testResults == null
                          ? []
                          : widget.testResults
                              .map((e) => getColumnChart(
                                  getMonth(e), e['value'], Color(0xffFF0000)))
                              .toList(),
                    ),
                  )),
                  Center(
                    child: Text(
                      S.of(context).age_month,
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  bool isHeightTab() {
    return widget.tab==0;
  }

  double getMaxValue() {
    if (widget.testResults == null || widget.testResults.isEmpty) return 100;
    double maxValue = double.parse(widget.testResults[0]['value']);
    widget.testResults.forEach((element) {
      double value = double.parse(element['value']);
      if (value > maxValue) {
        maxValue = value;
      }
    });
    return maxValue;
  }

  Color getStatusColor(var status) {
    print("typeOf ${status.runtimeType}");
    switch (status) {
      case "1":
        return Color(0xff00BBFF);
      case "2":
        return Color(0xffFFD500);
      case "3":
        return Color(0xffFF9100);
      case "4":
        return Color(0xffFF0000);
      default:
        return Color(0xff00BBFF);
    }
  }

  double getMonth(dynamic data) {
    if (data != null && data['children_date_old'] != null) {
      return (data['children_date_old'] ?? 0) / 30;
    }
    return 0;
  }

  String getMonthText(dynamic data) {
    if (data != null && data['children_date_old'] != null) {
      int days = data['children_date_old'];
      if (days > 30 * 12) return "${(days / (30 * 12)).toStringAsFixed(2)} năm";
      if (days < 30) return "$days ngày";
      return "${(days / 30).toStringAsFixed(2)} tháng";
    }
    return '';
  }

  BarChartGroupData getColumnChart(double month, var value, Color color) {
    return BarChartGroupData(
      x: month.round(),
      barRods: [
        BarChartRodData(
            y: double.parse(value),
            width: barWidth,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: color),
      ],
    );
  }
}
