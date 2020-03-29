import 'dart:async';

import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountDownTime extends StatefulWidget {
  final int seconds;

  const CountDownTime({Key key, @required this.seconds}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CountdownState();
  }
}

class _CountdownState extends State<CountDownTime> {
  Timer _timer;
  int _start;

  void startTimer() {
    _start = widget.seconds * 1000;
    _timer = new Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _start = _start - 1000;
        if (_start <= 0) {
          _timer.cancel();
        }
      });
    });
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
    return MyRaisedButton(
      onPressed: () {},
      padding: EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.tinySpace,
          bottom: SizeUtil.tinySpace),
      textStyle:
      TextStyle(color: Colors.white, fontSize: SizeUtil.textSizeSmall),
      text: DateFormat("HH:mm:ss").format(new DateTime.fromMillisecondsSinceEpoch(_start)),
      borderRadius: SizeUtil.bigRadius,
    );
  }
}
