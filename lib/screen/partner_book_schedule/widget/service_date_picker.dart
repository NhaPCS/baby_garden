import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';

class ServiceDatePicker extends StatelessWidget {
  final ValueNotifier<String> selectDateController;
  final ValueNotifier<String> selectTimeController;
  final dynamic timeOpen;

  const ServiceDatePicker(
      {Key key,
      this.selectDateController,
      this.selectTimeController,
      this.timeOpen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (timeOpen == null) return SizedBox();
    List<String> keys = new List.of(timeOpen.keys);
    selectDateController.value = '';
    return ValueListenableBuilder<String>(
      valueListenable: selectDateController,
      builder: (context, value, child) {
        selectTimeController.value = '';
        List<String> times = getTimes();
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: keys.map((e) {
                bool _isSelected = e == selectDateController.value;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      selectDateController.value = e;
                    },
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(width: 1, color: Colors.white)),
                        color: _isSelected
                            ? ColorUtil.primaryColor
                            : ColorUtil.unSelectBgColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: AutoSizeText(
                              DateUtil.getDayOfWeek(e),
                              maxFontSize: SizeUtil.textSizeSmall,
                              minFontSize: SizeUtil.textSizeMini,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(
                                  color: _isSelected
                                      ? Colors.white
                                      : ColorUtil.textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          MyText(
                            DateUtil.formatFromYmdToDmy(e),
                            style: TextStyle(
                                color: _isSelected
                                    ? Colors.white
                                    : ColorUtil.textColor,
                                fontSize: SizeUtil.textSizeTiny),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            ValueListenableBuilder(
                valueListenable: selectTimeController,
                builder: (context, timeValue, child) {
                  return GridView.builder(
                      shrinkWrap: true,
                      itemCount: times.length,
                      padding: EdgeInsets.all(0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7, childAspectRatio: 1.7),
                      itemBuilder: (context, index) {
                        bool _selectable = selectDateController.value != null &&
                            selectDateController.value.isNotEmpty;
                        bool _enable =
                            timeOpen[selectDateController.value] != null
                                ? (timeOpen[selectDateController.value]
                                        [(index + 1).toString()] ??
                                    false)
                                : false;
                        bool _isSelected =
                            times[index] == selectTimeController.value;
                        return InkWell(
                            onTap: () {
                              if (_enable &&
                                  selectDateController.value.isNotEmpty &&
                                  _selectable) {
                                selectTimeController.value = times[index];
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(1),
                              alignment: Alignment.center,
                              color: _isSelected
                                  ? ColorUtil.primaryColor
                                  : (_enable || !_selectable
                                      ? ColorUtil.lineColor
                                      : ColorUtil.red),
                              child: Text(
                                times[index],
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeSmall,
                                    color: _isSelected
                                        ? Colors.white
                                        : (_enable || !_selectable
                                            ? ColorUtil.textColor
                                            : Colors.white)),
                                textAlign: TextAlign.center,
                              ),
                            ));
                      });
                })
          ],
        );
      },
    );
  }

  List<String> getTimes() {
    return List.generate(24, (index) => "${index + 1}:00");
  }
}
