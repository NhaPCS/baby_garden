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

  final childInformation = ChildInfor(
    childName: 'Hùng gay',
    gender: 'male',
    lastDayCheck: '15/06/2011',
    birthday: '15/06/2011',
    healthIndex: 100,
  );

  void sampleBtnTap(int index) {
    print(index);
  }

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

    final List<Map<String, String>> childInforFields = <Map<String, String>>[
      entry(S.of(context).childName, childInformation.childName, 'pencil.png'),
      entry(S.of(context).gender, childInformation.gender, ''),
      entry(S.of(context).birthday, childInformation.birthday, ''),
      entry(S.of(context).healthIndex, S.of(context).moreDetail, 'right.png'),
      entry(S.of(context).lastDayCheck, childInformation.lastDayCheck, ''),
    ];

    return Scaffold(
        appBar: getAppBar(title: S.of(context).accManage),
        body: Column(children: <Widget>[
          // user information
          Container(
              child: this.userInfor,
              decoration:
                  setBorder("bottom", Color.fromRGBO(206, 206, 206, 1), 1)),
          // entries
          Container(
            child: entriesWidget(entries),
          ),
          // children
          Container(
              decoration: setBorder('top', Color.fromRGBO(223, 223, 223, 1), 3),
              width: double.infinity,
              child: childInfor(childInforFields))
        ]));
  }

  Widget entriesWidget(List<Map<String, String>> entries) {
    return Container(
      height: 228,
      child: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(left: 11.0, right: 11),
              decoration:
                  setBorder('bottom', Color.fromRGBO(206, 206, 206, 1), 1),
              height: 38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(entries[index]['title']),
                  Expanded(
                      child: Text(entries[index]['content'],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: (index == 4)
                                  ? ColorUtil.primaryColor
                                  : Colors.black))),
                  SizedBox(
                    width: SizeUtil.smallSpace,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("dep trai");
                    },
                    child: Image.asset(
                      "photo/${entries[index]['icon']}",
                      width: 11,
                      height: 11,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget entriesChildInfor(List<Map<String, String>> entries) {
    return Container(
      height: 111,
      child: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(left: 11.0, right: 11),
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(entries[index]['title']),
                  Expanded(
                      child: Text(entries[index]['content'],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: (index == 3)
                                  ? ColorUtil.primaryColor
                                  : Colors.black))),
                  SizedBox(
                    width: SizeUtil.smallSpace,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("dep trai");
                    },
                    child: Image.asset(
                      "photo/${entries[index]['icon']}",
                      width: 11,
                      height: 11,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget childInfor(List<Map<String, String>> childInforFields) {
    return Column(children: <Widget>[
      headerChildInfor(),
      // child information
      Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: setBorder("bottom", Color.fromRGBO(206, 206, 206, 1), 1),
          child: Row(children: <Widget>[
            // avatar
            Container(
              margin: EdgeInsets.only(bottom: 13),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  'photo/child_avatar.png',
                  width: 92.0,
                  height: 92.0,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 111,
                child: entriesChildInfor(childInforFields),
              ),
            ),
          ]),
        )
      ]),
    ]);
  }

  Widget headerChildInfor() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 38,
      decoration: setBorder("bottom", Color.fromRGBO(206, 206, 206, 1), 1),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              S.of(context).childInfor,
              style: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("dep trai");
            },
            child: Row(children: <Widget>[
              Text(
                S.of(context).addChild,
                style: TextStyle(color: ColorUtil.primaryColor),
              ),
              SizedBox(width: 5),
              Image.asset("photo/add_child.png", width: 22, height: 22)
            ]),
          )
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
