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
  final ValueNotifier<int> valueController;

  const DatePicker(
      {this.onValueChange,
      this.unSelectedColor = ColorUtil.textColor,
      this.valueController})
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
    getDate();
    if(widget.onValueChange!=null)
      widget.onValueChange(dates[0]);
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
              .map((e) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      widget.valueController.value = dates.indexOf(e);
                      print(("DatePicker onvalue change ${widget.onValueChange==null}"));
                      if(widget.onValueChange!=null)
                        widget.onValueChange(dates[widget.valueController.value]);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 2,right: 2,top: 5,bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(width: 1,color: Colors.white)),
                          color: dates.indexOf(e) == value ? ColorUtil.primaryColor : Color(0xffF2F2F2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            e['dow'],
                            style: TextStyle(
                                color: dates.indexOf(e) == value ? Colors.white : widget.unSelectedColor,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeUtil.textSizeNoticeTime),
                          ),
                          Text(
                            e['date'],
                            style: TextStyle(
                                color: dates.indexOf(e) == value ? Colors.white : widget.unSelectedColor,
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

  void getDate() async {
    if (dates == null) {
      dates = List();
      final dowFormat = new DateFormat("EEEE", "vi");
      final dateFormat = new DateFormat("dd/MM/yyyy");
      var now = new DateTime.now();
      for (int i = 0; i <= 6; i++) {
        final date = now.add(new Duration(days: i));
        dates.add({
          'index': i,
          'dow': dowFormat.format(date),
          'date': dateFormat.format(date)
        });
      }
      print("getDate $dates");
    }
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }
}
