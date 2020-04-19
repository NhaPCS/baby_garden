import 'dart:io';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/profile/widget/change_avatar.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfor extends StatelessWidget {
  final ValueChanged<File> onSelectImage;
  const UserInfor({Key key, this.onSelectImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
        builder: (BuildContext context, UserProvider value, Widget child) {
      var user = value.userInfo;
      return Container(
        padding: EdgeInsets.only(
            left: SizeUtil.smallSpace,
            top: SizeUtil.normalSpace,
            bottom: SizeUtil.normalSpace),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Color.fromRGBO(206, 206, 206, 1)),
        )),
        child: Wrap(
          spacing: SizeUtil.smallSpace,
          children: <Widget>[
            ChangeAvatar(
                avatarUrl: user['avatar'], onSelectImage: onSelectImage),
            Wrap(
              direction: Axis.vertical,
              spacing: SizeUtil.tinySpace,
              children: <Widget>[
                MyText(
                  user['name'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtil.textSizeBigger),
                ),
                MyText(user['phone']),
                Text(
                    "${S.of(context).joinDate}: ${DateUtil.formatDDMMyyyy(user['date'])}")
              ],
            ),
          ],
        ),
      );
    });
  }
}
