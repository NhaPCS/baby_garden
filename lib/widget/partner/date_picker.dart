import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nested/nested.dart';

//todo notdone
class DatePicker extends StatefulWidget {
  final ValueChanged<dynamic> onValueChange;
  final Color unSelectedColor;
  final Color unSelectedBackgroundColor;
  final ValueNotifier<int> valueController;
  final Color selectedBackgroundColor;
  final Color selectedTextColor;
  final double titleSize;
  final bool isTitleBold;

  const DatePicker(
      {this.onValueChange,
      this.unSelectedColor = ColorUtil.textColor,
      this.valueController,
      this.selectedBackgroundColor = ColorUtil.primaryColor,
      this.selectedTextColor = Colors.white,
      this.unSelectedBackgroundColor = ColorUtil.unSelectBgColor,
      this.titleSize= SizeUtil.textSizeNoticeTime,
      this.isTitleBold = true})
      : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DatePickerState();
  }
}

class _DatePickerState extends BaseState<DatePicker>
    with TickerProviderStateMixin {
  List<dynamic> dates;

  @override
  void initState() {
    // TODO: implement initState
    dates = DateUtil.getDate();
    if (widget.onValueChange != null) widget.onValueChange(dates[0]);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return ValueListenableBuilder<int>(
      valueListenable: widget.valueController,
      builder: (context, value, child) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: dates
              .map(
                (e) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      widget.valueController.value = dates.indexOf(e);
                      print(
                          ("DatePicker onvalue change ${widget.onValueChange == null}"));
                      if (widget.onValueChange != null)
                        widget
                            .onValueChange(dates[widget.valueController.value]);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(width: 1, color: Colors.white)),
                        color: dates.indexOf(e) == value
                            ? widget.selectedBackgroundColor
                            : widget.unSelectedBackgroundColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            e['dow'],
                            style: TextStyle(
                                color: dates.indexOf(e) == value
                                    ? widget.selectedTextColor
                                    : widget.unSelectedColor,
                                fontWeight: widget.isTitleBold?FontWeight.bold:FontWeight.normal,
                                fontSize: widget.titleSize),
                          ),
                          Text(
                            e['date'],
                            style: TextStyle(
                                color: dates.indexOf(e) == value
                                    ? widget.selectedTextColor
                                    : widget.unSelectedColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 6),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }
}
