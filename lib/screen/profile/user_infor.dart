import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/circle_image.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';

class UserInfor extends StatelessWidget {
  final dynamic user;

  const UserInfor({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: Color.fromRGBO(206, 206, 206, 1)),
      )),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 11, right: 11),
            child: CircleImage(
              imageUrl: user == null ? StringUtil.dummyImage : user['avatar'],
              width: 50,
              height: 50,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 15),
                  child: MyText(
                    user['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              MyText(user['phone']),
              SizedBox(height: 15),
              Text("${S.of(context).joinDate}: ${user['date']}")
            ],
          ),
        ],
      ),
    );
  }
}

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
