// import 'package:baby_garden_flutter/provider/change_index_provider.dart';
// import 'package:baby_garden_flutter/screen/home/home_screen.dart';
// import 'package:baby_garden_flutter/util/resource.dart';
// import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/profile/userInfor.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen> {
  final GetListProvider _getListProvider = GetListProvider();

  final UserInfor userInfor = UserInfor(
    username: "Quyền Anh đẹp trai",
    mobilePhone: "0338305xxx",
    joinDate: "13/2/2020",
  );
  @override
  Widget buildWidget(BuildContext context) {
    final List<Map<String, String>> entries = <Map<String, String>>[
      {'icon': 'profile_user', 'title': S.of(context).accManage},
      {'icon': 'profile_numbers', 'title': S.of(context).pointManage},
      {'icon': 'profile_alarm', 'title': S.of(context).remindManage},
      {'icon': 'profile_discount', 'title': S.of(context).voucherManage},
      {'icon': 'profile_heart', 'title': S.of(context).favoriteProduct},
      {'icon': 'profile_care', 'title': S.of(context).favoritePatner},
      {'icon': 'profile_past', 'title': S.of(context).seenProduct},
      {'icon': 'profile_help', 'title': S.of(context).customerHelper},
      {'icon': 'profile_settings', 'title': S.of(context).setting},
    ];

    return Scaffold(
        appBar: getAppBar(title: S.of(context).myProfile),
        body: Column(children: <Widget>[
          Container(
              // user information
              child: this.userInfor),
          Container(
            child: entriesWidget(entries),
          ),
        ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }

  Widget entriesWidget(List<Map<String, String>> entries) {
    return Container(
      height: 350,
      child: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Color.fromRGBO(206, 206, 206, 1)),
              )),
              height: 50,
              child: Row(
                children: <Widget>[
                  SvgIcon(
                    '${entries[index]['icon']}.svg',
                    color: (index == 0)
                        ? ColorUtil.primaryColor
                        : ColorUtil.black33,
                    padding: EdgeInsets.only(left: 12, right: 15),
                  ),
                  Text(entries[index]['title'],
                      style: TextStyle(
                          color: (index == 0)
                              ? ColorUtil.primaryColor
                              : ColorUtil.black33)),
                ],
              ),
            );
          }),
    );
  }
}
