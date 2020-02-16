import 'package:flutter/material.dart';

class UserInfor extends StatelessWidget {
  UserInfor({Key key, this.username, this.mobilePhone, this.joinDate})
      : super(key: key);

  final username;
  final mobilePhone;
  final joinDate;

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
            child: CircleAvatar(
              radius: 50,
              backgroundImage: ExactAssetImage("photo/profile_avatar.png"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 15),
                  child: Text(
                    username,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              Text(mobilePhone),
              SizedBox(height: 15),
              Text(joinDate)
            ],
          ),
        ],
      ),
    );
  }
}
