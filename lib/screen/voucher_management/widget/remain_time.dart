import 'dart:async';

import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RemainTime extends StatefulWidget {
  final String endDateText;
  final String endTimeText;
  final Color color;

  const RemainTime({Key key, this.endDateText, this.endTimeText, this.color})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RemainState();
  }
}

class _RemainState extends State<RemainTime> {
  Timer _timer;
  int _start;
  DateTime _endDateTime;
  String _status;

  void startTimer() {
    if (widget.endDateText != null && widget.endTimeText != null) {
      DateTime _endDate = DateFormat("yyyy-MM-dd").parse(widget.endDateText);
      DateTime _endTime = DateFormat("HH:mm").parse(widget.endTimeText);
      _endDateTime = new DateTime(_endDate.year, _endDate.month, _endDate.day,
          _endTime.hour, _endTime.minute, 0);
      DateTime currentTime = DateTime.now();
      if (_endDateTime.isAfter(currentTime)) {
        _start = _endDateTime.millisecondsSinceEpoch -
            currentTime.millisecondsSinceEpoch;
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
        : Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: SizeUtil.tinySpace,
            children: <Widget>[
              Icon(
                Icons.access_time,
                color: widget.color,
                size: SizeUtil.iconSize,
              ),
              Text(
                _status,
                style: TextStyle(color: widget.color),
              )
            ],
          );
  }
}
