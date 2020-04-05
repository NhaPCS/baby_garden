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
  String _status;

  void startTimer() {
    if (widget.startTime != null && widget.endTime != null) {
      _startDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(widget.startTime);
      _endDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(widget.endTime);
      DateTime _now = DateTime.now();
      if (!_now.isAfter(_startDate)) {
        _status = S.of(context).time_pending;
        return;
      }
      if (!_now.isBefore(_endDate)) {
        _status = S.of(context).time_ended;
        return;
      }
      _start =
          _endDate.millisecondsSinceEpoch - _startDate.millisecondsSinceEpoch;
      _timer = new Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          _start = _start - 1000;
          _status = DateFormat("HH:mm:ss")
              .format(new DateTime.fromMillisecondsSinceEpoch(_start));
          if (_start <= 0) {
            _timer.cancel();
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _status == null
        ? SizedBox(
            width: 0,
            height: 0,
          )
        : MyRaisedButton(
            onPressed: () {},
            padding: EdgeInsets.only(
                left: SizeUtil.smallSpace,
                right: SizeUtil.smallSpace,
                top: SizeUtil.tinySpace,
                bottom: SizeUtil.tinySpace),
            textStyle: TextStyle(
                color: Colors.white, fontSize: SizeUtil.textSizeSmall),
            text: _status,
            borderRadius: SizeUtil.bigRadius,
          );
  }
}
