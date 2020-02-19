import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/profile/user_infor.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class AccountManage extends StatefulWidget {
  @override
  _AccountManageState createState() => _AccountManageState();
}

class _AccountManageState extends BaseState<AccountManage> {
  final GetListProvider _getListProvider = GetListProvider();
  final UserInfor userInfor = UserInfor(
    username: "Quyền Anh đẹp trai",
    mobilePhone: "0338305xxx",
    joinDate: "13/2/2020",
    password: "xxx",
    address: "universe",
    birthday: "17/5/93",
    gender: "male",
  );

  List<Widget> listWidget;

  @override
  Widget buildWidget(BuildContext context) {
    Map<String, String> entry(String title, String content, String icon) {
      return {'title': title, 'content': content, "icon": icon};
    }

    final List<Map<String, String>> entries = <Map<String, String>>[
      entry(S.of(context).fullname, userInfor.username, 'pencil.png'),
      entry(S.of(context).mobilePhone, userInfor.mobilePhone, ''),
      entry(S.of(context).birthday, userInfor.birthday, ''),
      entry(S.of(context).gender, userInfor.gender, ''),
      entry(S.of(context).password, S.of(context).changePassword, 'right.png'),
      entry(S.of(context).address, userInfor.address, 'right.png'),
    ];

    return Scaffold(
        appBar: getAppBar(title: S.of(context).accManage),
        body: Column(children: <Widget>[
          // user information
          Container(
            child: this.userInfor,
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Color.fromRGBO(206, 206, 206, 1)),
            )),
          ),
          // entries
          Container(
            child: entriesWidget(entries),
          ),
          // children
          Container(child: childInfor())
        ]));
  }

  Widget entriesWidget(List<Map<String, String>> entries) {
    return Container(
      height: 350,
      child: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.only(left: 11.0, right: 11),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Color.fromRGBO(206, 206, 206, 1)),
              )),
              height: 38,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(entries[index]['title']),
                  Container(
                    margin: EdgeInsets.only(left: 180),
                    child: Text(entries[index]['content'],
                        style: TextStyle(
                            color: (index == 4)
                                ? ColorUtil.primaryColor
                                : ColorUtil.black33)),
                  ),
                  Image.asset(
                    "photo/${entries[index]['icon']}",
                    width: 11,
                    height: 11,
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget childInfor() {
    return Column(children: <Widget>[
      // title & add child button

      // child information
      Column(children: <Widget>[
        Row(children: <Widget>[
          // avatar

          // properties
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("ten be  "),
                  Text("Quyen Anh dep trai")
                ],
              )
            ],
          )
        ])
      ]),
    ]);
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
