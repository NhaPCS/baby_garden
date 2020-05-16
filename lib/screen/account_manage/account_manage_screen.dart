import 'dart:io';

import 'package:baby_garden_flutter/data/model/baby.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/account_manage/dialog/add_child_dialog.dart';
import 'package:baby_garden_flutter/screen/account_manage/item/baby_item.dart';
import 'package:baby_garden_flutter/screen/account_manage/item/child_item.dart';
import 'package:baby_garden_flutter/screen/account_manage/view_model/account_manage_view_model.dart';
import 'package:baby_garden_flutter/screen/address_setting/address_setting_screen.dart';
import 'package:baby_garden_flutter/screen/change_password/change_password_screen.dart';
import 'package:baby_garden_flutter/screen/child_heath/provider/get_list_baby_provider.dart';
import 'package:baby_garden_flutter/screen/profile/widget/user_infor.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../base_state_model.dart';

class AccountManageScreen extends StatefulWidget {
  @override
  _AccountManageScreenState createState() => _AccountManageScreenState();
}

class _AccountManageScreenState
    extends BaseStateModel<AccountManageScreen, AccountManageViewModel> {
  final GetListBabyProvider _getListBabyProvider = GetListBabyProvider();
  File _avatarFile;

  @override
  void initState() {
    super.initState();
    _getListBabyProvider.listBaby();
  }

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

    return Scaffold(
        appBar: getAppBar(title: S.of(context).accManage),
        body: Column(
          children: [
            Container(
                child: UserInfor(
                    onSelectImage: (file) => updateAvatar(context, img: file)),
                decoration: setBorder("bottom", ColorUtil.lineLightGray, 1)),
            Expanded(
                child: ListView(children: <Widget>[
              // user information
              // entries
              Column(
                children: entries.map((e) => userInfoRow(e)).toList(),
              ),
              headerChildInfor(),
              WidgetUtil.getLine(
                  color: ColorUtil.lineLightGray, margin: EdgeInsets.all(0)),
              Consumer<GetListBabyProvider>(
                builder: (BuildContext context, GetListBabyProvider value,
                    Widget child) {
                  if (value.babies == null) return SizedBox();
                  return Column(
                    children: value.babies
                        .map((e) => BabyItem(
                              baby: Baby.fromJson(e),
                            ))
                        .toList(),
                  );
                },
              )
            ]))
          ],
        ));
  }

  Widget userInfoRow(dynamic entry) {
    return Container(
      padding: SizeUtil.smallPadding,
      decoration: setBorder('bottom', ColorUtil.lineLightGray, 1),
      child: GestureDetector(
        onTap: () {
          if (entry['title'] == S.of(context).address) {
            push(AddressSettingScreen());
          } else if (entry['title'] == S.of(context).changePassword) {
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
                    color: (entry['title'] == S.of(context).changePassword)
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
    );
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
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AddChildDialog(
                        addChildCallBack: (name, gender, birthday) {
                          getViewModel().addChild(
                              name: name,
                              gender: gender,
                              birthday: birthday,
                              img: _avatarFile);
                        },
                        onSelectImage: (file) {
                          _avatarFile = file;
                        },
                      ));
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
    return [ChangeNotifierProvider.value(value: _getListBabyProvider)];
  }

  @override
  AccountManageViewModel initViewModel() {
    return AccountManageViewModel(context, _getListBabyProvider);
  }
}
