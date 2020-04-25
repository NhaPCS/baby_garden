import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/child_heath/dialog/chart_clicked_info_dialog.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChildChart extends StatefulWidget {
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
                    S.of(context).height_cm,
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
                        maxY: 100,
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
                              switch (value.toInt()) {
                                case 0:
                                  return '12';
                                case 1:
                                  return '15';
                                case 2:
                                  return '18';
                                case 3:
                                  return '24';
                                case 4:
                                  return '30';
                                case 5:
                                  return '36';
                                case 6:
                                  return '48';
                                default:
                                  return '';
                              }
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
                            interval: 20,
                            margin: 5,
                            reservedSize: 30,
                          ),
                        ),
                        gridData: FlGridData(
                          show: true,
                          checkToShowHorizontalLine: (value) => value % 5 == 0,
                          getDrawingHorizontalLine: (value) {
                            return const FlLine(
                              color: Colors.transparent,
                              strokeWidth: 0.8,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                            show: true,
                            border: Border(
                                left: BorderSide(
                                    width: 1, color: ColorUtil.lightGray),
                                bottom: BorderSide(
                                    width: 1, color: ColorUtil.lightGray))),
                        barGroups: [
                          getColumnChart(0, 76.2, Color(0xffFF0000)),
                          getColumnChart(1, 36.2, Color(0xffFFD500)),
                          getColumnChart(2, 46.2, Color(0xffFF9100)),
                          getColumnChart(3, 16.2, Color(0xff00BBFF)),
                          getColumnChart(4, 96.2, Color(0xffFF0000)),
                          getColumnChart(5, 56.2, Color(0xff00BBFF)),
                          getColumnChart(6, 26.2, Color(0xffFFD500)),
                        ],
                      ),
                    )),
                    Center(child: Text(
                      S.of(context).age_month,
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          fontWeight: FontWeight.bold),
                    ),)
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData getColumnChart(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
            y: y,
            width: barWidth,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: color),
      ],
    );
  }
}
