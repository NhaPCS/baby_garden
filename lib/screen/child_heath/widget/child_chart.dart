import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/child_heath/dialog/chart_clicked_info_dialog.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChildChart extends StatefulWidget {
  final List<dynamic> testResults;

  const ChildChart({Key key, this.testResults}) : super(key: key);

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
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return ChartClickedInfoDialog();
            });
      },
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                        maxY: getMaxValue(),
                        groupsSpace: 12,
                        barTouchData: BarTouchData(
                          enabled: false,
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            textStyle: const TextStyle(
                                color: ColorUtil.textColor,
                                fontSize: SizeUtil.textSizeSmall),
                            getTitles: (double value) {
                              return widget.testResults[value.toInt()]['month'];
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
                            interval: isHeightTab() ? 50 : 5,
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
                                .map((e) => getColumnChart(e['month'],
                                    e['value'], getStatusColor(e['status'])))
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
      ),
    );
  }

  bool isHeightTab() {
    return widget.testResults == null ||
        widget.testResults.isEmpty ||
        widget.testResults[0]['type'] == '1';
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

  BarChartGroupData getColumnChart(var month, var value, Color color) {
    print("MONTH ${int.parse(month)}");
    return BarChartGroupData(
      x: int.parse(month),
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
