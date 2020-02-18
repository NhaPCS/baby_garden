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
  @override
  Widget buildWidget(BuildContext context) {
    final List<Map<String, String>> entries = <Map<String, String>>[
      {'title': S.of(context).fullname, 'content': userInfor.username},
      {'title': S.of(context).mobilePhone, 'content': userInfor.mobilePhone},
      {'title': S.of(context).birthday, 'content': userInfor.birthday},
      {'title': S.of(context).gender, 'content': userInfor.gender},
      {'title': S.of(context).password, 'content': userInfor.password},
      {'title': S.of(context).address, 'content': userInfor.address}
    ];

    return Scaffold(
        appBar: getAppBar(title: S.of(context).accManage),
        body: Column(children: <Widget>[
          Container(
              // user information
              child: this.userInfor),
          Container(
            child: entriesWidget(entries),
          ),
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
              padding: const EdgeInsets.only(left: 11.0),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Color.fromRGBO(206, 206, 206, 1)),
              )),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(entries[index]['title']),
                  Text(entries[index]['content'])
                ],
              ),
            );
          }),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
