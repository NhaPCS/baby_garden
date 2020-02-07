import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySwitcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MySwitcherState();
  }
}

class _MySwitcherState extends State<MySwitcher> {
  bool state = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: state,
      onChanged: (selected) {
        setState(() {
          state = !state;
        });
      },
      activeColor: ColorUtil.blue,
    );
  }
}
