import 'dart:async';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountDownTime extends StatefulWidget {
  final String startTime;
  final String endTime;

  const CountDownTime(
      {Key key, @required this.startTime, @required this.endTime})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CountdownState();
  }
}

class _CountdownState extends State<CountDownTime> {
  Timer _timer;
  int _start;
  DateTime _startDate;
  DateTime _endDate;
  ValueNotifier<String> _status = new ValueNotifier(null);

  void startTimer() {
    if (widget.startTime != null && widget.endTime != null) {
      _startDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(widget.startTime);
      _endDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(widget.endTime);
      print("START ${_startDate}  ${_endDate}  ${DateTime.now()}");
      DateTime _now = DateTime.now();
      if (!_now.isAfter(_startDate)) {
        _status.value = S.of(context).time_pending;
        return;
      }
      if (!_now.isBefore(_endDate)) {
        _status.value = S.of(context).time_ended;
        return;
      }
      _start = _endDate.millisecondsSinceEpoch - _now.millisecondsSinceEpoch;
      if (_timer != null) {
        _timer.cancel();
      }
      _timer = new Timer.periodic(Duration(seconds: 1), (Timer timer) {
        _start = _start - 1000;
        _status.value = DateFormat("HH:mm:ss").format(
            new DateTime.fromMillisecondsSinceEpoch(_start, isUtc: true));
        if (_start <= 0) {
          _timer.cancel();
          _status.value = null;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return ValueListenableBuilder(
        valueListenable: _status,
        builder: (context, value, child) {
          if (value == null) return SizedBox();
          return MyRaisedButton(
            onPressed: () {},
            padding: EdgeInsets.only(
                left: SizeUtil.smallSpace,
                right: SizeUtil.smallSpace,
                top: SizeUtil.tinySpace,
                bottom: SizeUtil.tinySpace),
            textStyle: TextStyle(
                color: Colors.white, fontSize: SizeUtil.textSizeSmall),
            text: _status.value,
            borderRadius: SizeUtil.bigRadius,
          );
        });
  }
}
