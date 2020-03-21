import 'package:baby_garden_flutter/screen/child_heath/chart_clicked_info_dialog.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChildChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChildChartState();
}

class ChildChartState extends State<ChildChart> {
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);

  static const double barWidth = 22;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                maxY: 20,
                groupsSpace: 12,
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    textStyle: const TextStyle(
                        color: ColorUtil.textColor, fontSize: 10),
                    margin: 10,
                    rotateAngle: 0,
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
                    rotateAngle: 45,
                    getTitles: (double value) {
                      if (value == 0) {
                        return '';
                      }
                      return '${value.toInt()}';
                    },
                    interval: 5,
                    margin: 8,
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
                  show: false,
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        y: 15.1,
                        width: barWidth,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        rodStackItem: const [
                          BarChartRodStackItem(2, 2, Color(0xffFFD500)),
                        ],
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        y: 14,
                        width: barWidth,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        rodStackItem: const [
                          BarChartRodStackItem(14, 14, Color(0xffFF9100)),
                        ],
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        y: 13,
                        width: barWidth,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        rodStackItem: const [
                          BarChartRodStackItem(1.5, 1.5, Color(0xff00B9FF)),
                        ],
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        y: 13.5,
                        width: barWidth,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        rodStackItem: const [
                          BarChartRodStackItem(13.5, 13.5, Color(0xff19bfff)),
                        ],
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(
                        y: 18,
                        width: barWidth,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        rodStackItem: const [
                          BarChartRodStackItem(2, 2, Color(0xff00B9FF)),
                        ],
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 5,
                    barRods: [
                      BarChartRodData(
                        y: 17,
                        width: barWidth,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        rodStackItem: const [
                          BarChartRodStackItem(17, 17, Color(0xffFF0000)),
                        ],
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 6,
                    barRods: [
                      BarChartRodData(
                        y: 16,
                        width: barWidth,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        rodStackItem: const [
                          BarChartRodStackItem(17, 17, Color(0xffFF0000)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
