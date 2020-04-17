import 'package:flutter/cupertino.dart';

class ChildInfor extends StatelessWidget {
  final avatar;
  final childName;
  final gender;
  final birthday;
  final healthIndex;
  final lastDayCheck;

  ChildInfor(
      {Key key,
      this.avatar,
      this.childName,
      this.gender,
      this.birthday,
      this.healthIndex,
      this.lastDayCheck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
