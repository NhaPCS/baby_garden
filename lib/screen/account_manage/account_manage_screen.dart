import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/account_manage/dialog/add_child_dialog.dart';
import 'package:baby_garden_flutter/screen/account_manage/widget/child_infor.dart';
import 'package:baby_garden_flutter/screen/address_setting/address_setting_screen.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/change_password/change_password_screen.dart';
import 'package:baby_garden_flutter/screen/child_heath/child_heath_screen.dart';
import 'package:baby_garden_flutter/screen/profile/widget/user_infor.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class AccountManageScreen extends StatefulWidget {
  @override
  _AccountManageScreenState createState() => _AccountManageScreenState();
}

class _AccountManageScreenState extends BaseState<AccountManageScreen> {
  final childInformation = ChildInfor(
    childName: 'Nguyễn Lý Trần Lê Đỗ Hoàng Đinh Huỳnh Hồ Đẹp Trai',
    gender: 'Nam',
    lastDayCheck: '15/06/2011',
    birthday: '15/06/2011',
    healthIndex: 100,
  );

  @override
  Widget buildWidget(BuildContext context) {
    Map<String, String> entry(String title, String content, String icon) {
      return {'title': title, 'content': content, "icon": icon};
    }

    dynamic user = Provider.of<UserProvider>(context).userInfo;
    final List<Map<String, String>> entries = <Map<String, String>>[
      entry(S.of(context).fullname, user == null ? "" : user['name'],
          'pencil.png'),
      entry(S.of(context).mobilePhone, user == null ? "" : user['phone'], ''),
      entry(S.of(context).birthday, user == null ? "" : user['birthday'], ''),
      entry(S.of(context).gender,
          user == null ? "" : user['gender'] == 1 ? "Nam" : "Nữ", ''),
      entry(S.of(context).password, S.of(context).changePassword, 'right.png'),
      entry(S.of(context).address, '', 'right.png'),
    ];

    final List<Map<String, String>> childInforFields = <Map<String, String>>[
      entry(S.of(context).childName, childInformation.childName, 'pencil.png'),
      entry(S.of(context).gender, childInformation.gender, ''),
      entry(S.of(context).birthday, childInformation.birthday, ''),
      entry(S.of(context).healthIndex, S.of(context).moreDetail, 'right.png'),
      entry(S.of(context).lastDayCheck, childInformation.lastDayCheck, ''),
    ];

    return Scaffold(
        appBar: getAppBar(title: S.of(context).accManage),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            // user information
            Container(
                child: UserInfor(
                    onSelectImage: (file) => updateAvatar(context, img: file)),
                decoration: setBorder("bottom", ColorUtil.lineLightGray, 1)),
            // entries
            entriesWidget(entries),

            // children
            Container(
                decoration:
                    setBorder('top', Color.fromRGBO(223, 223, 223, 1), 3),
                width: double.infinity,
                child: childInfor(childInforFields))
          ]),
        ));
  }

  Widget entriesWidget(List<Map<String, String>> entries) {
    final listEntries = List<Widget>();

    entries.asMap().forEach((index, entry) {
      listEntries.add(Container(
        padding: SizeUtil.smallPadding,
        decoration: setBorder('bottom', ColorUtil.lineLightGray, 1),
        child: GestureDetector(
          onTap: () {
            if (index == 5) {
              push(AddressSettingScreen());
            } else if (index == 4) {
              push(ChangePasswordScreen());
            }
          },
          child: Row(
            children: <Widget>[
              Text(entry['title']),
              Spacer(),
              Text(entry['content'],
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: (index == 4)
                          ? ColorUtil.primaryColor
                          : Colors.black)),
              SizedBox(
                width: SizeUtil.smallSpace,
              ),
              Image.asset(
                "photo/${entry['icon']}",
                width: SizeUtil.iconSizeDefault,
                height: SizeUtil.iconSizeDefault,
              ),
            ],
          ),
        ),
      ));
    });

    return Column(children: listEntries.map((e) => e).toList());
  }

  Widget entriesChildInfor(List<Map<String, String>> entries) {
    final listEntries = List<Widget>();

    entries.asMap().forEach((index, entry) {
      listEntries.add(
        Row(
          children: <Widget>[
            Text(entry['title']),
            SizedBox(width: SizeUtil.smallSpace),
            Expanded(
                child: GestureDetector(
              onTap: () {
                if (index == 3) push(ChildHeathScreen());
              },
              child: Text(entry['content'],
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: (index == 3)
                          ? ColorUtil.primaryColor
                          : Colors.black)),
            )),
            SizedBox(
              width: SizeUtil.smallSpace,
            ),
            GestureDetector(
              onTap: () {
                if (index == 3) {
                  push(ChildHeathScreen());
                } else if (index == 0) {
                  // edit child name
                }
              },
              child: Image.asset(
                "photo/${entry['icon']}",
                width: SizeUtil.iconSizeDefault,
                height: SizeUtil.iconSizeDefault,
              ),
            ),
          ],
        ),
      );
      listEntries.add(SizedBox(height: SizeUtil.tinySpace));
    });

    return Column(children: listEntries.map((e) => e).toList());
  }

  Widget childInfor(List<Map<String, String>> childInforFields) {
    return Column(children: <Widget>[
      headerChildInfor(),
      WidgetUtil.getLine(
          color: ColorUtil.lineLightGray, margin: EdgeInsets.all(0)),

      // child information
      Container(
        padding: SizeUtil.smallPadding,
        decoration: setBorder("bottom", ColorUtil.lineLightGray, 1),
        child: Row(children: <Widget>[
          // avatar
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(SizeUtil.tinyRadius),
              child: Image.asset(
                'photo/child_avatar.png',
                width: 92.0,
                height: 92.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: SizeUtil.smallSpace),
          Expanded(
            child: entriesChildInfor(childInforFields),
          ),
          SizedBox(width: SizeUtil.smallSpace)
        ]),
      )
    ]);
  }

  Widget headerChildInfor() {
    return Padding(
      padding: SizeUtil.smallPadding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              S.of(context).childInfor,
              style: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtil.textSizeBigger),
            ),
          ),
          GestureDetector(
            onTap: () {
              // show dialog
              final addChild = AddChildDialog();
              showDialog(
                  context: context,
                  builder: (BuildContext context) => addChild);
            },
            child: Row(children: <Widget>[
              Text(
                S.of(context).addChild,
                style: TextStyle(color: ColorUtil.primaryColor),
              ),
              SizedBox(width: SizeUtil.tinySpace),
              Image.asset("photo/add_child.png",
                  width: SizeUtil.iconSizeBigger,
                  height: SizeUtil.iconSizeBigger)
            ]),
          )
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return null;
  }
}
