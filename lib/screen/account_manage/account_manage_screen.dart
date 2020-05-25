import 'dart:io';

import 'package:baby_garden_flutter/data/model/baby.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/account_manage/dialog/add_child_dialog.dart';
import 'package:baby_garden_flutter/screen/account_manage/item/baby_item.dart';
import 'package:baby_garden_flutter/screen/account_manage/view_model/account_manage_view_model.dart';
import 'package:baby_garden_flutter/screen/address_setting/address_setting_screen.dart';
import 'package:baby_garden_flutter/screen/change_password/change_password_screen.dart';
import 'package:baby_garden_flutter/screen/child_heath/provider/get_list_baby_provider.dart';
import 'package:baby_garden_flutter/screen/profile/widget/user_infor.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
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
  final TextEditingController _nameController = TextEditingController();
  UserProvider _userProvider;

  File _avatarFile;

  @override
  void initState() {
    super.initState();
    _getListBabyProvider.listBaby();
  }

  @override
  Widget buildWidget(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context, listen: false);

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
              Consumer<UserProvider>(
                builder:
                    (BuildContext context, UserProvider value, Widget child) {
                  var entries = value.getEntries(context);

                  final listEntryUser = List<Widget>();
                  entries.asMap().forEach((key, value) {
                    listEntryUser.add(userInfoRow(key, value));
                  });

                  return Column(children: listEntryUser);
                },
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
                              onEditBabyPress: () {
                                showChildDialog(baby: Baby.fromJson(e));
                              },
                            ))
                        .toList(),
                  );
                },
              )
            ]))
          ],
        ));
  }

  Widget userInfoRow(int key, dynamic entry) {
    if (key == 0) _nameController.text = entry['content'];

    return GestureDetector(
      onTap: () async {
        switch (key) {
          case 2:
            showBirthdaySelectorDialog(context, (birthday) async {
              _userProvider.updateUserInfo(
                  birthday: DateUtil.formatBirthdayDate(birthday));
              await getViewModel().editProfile(user: _userProvider.userInfo);
            });
            break;
          case 3:
            _chooseGender();
            break;
          case 4:
            push(ChangePasswordScreen());
            break;
          case 5:
            push(AddressSettingScreen());
            break;
        }
      },
      child: Container(
        padding: SizeUtil.smallPadding,
        decoration: setBorder('bottom', ColorUtil.lineLightGray, 1),
        child: Row(
          children: <Widget>[
            Text(entry['title']),
            key == 0 ? SizedBox() : Spacer(),
            key == 0
                ? Expanded(
                    child: MyTextField(
                    textEditingController: new TextEditingController.fromValue(
                        new TextEditingValue(
                            text: _nameController.text,
                            selection: TextSelection.fromPosition(TextPosition(
                                offset: _nameController.text.length)))),
                    maxLines: null,
                    autoFocus: true,
                    onSubmitted: (val) async {
                      _nameController.text = val;
                      FocusScope.of(context).requestFocus(FocusNode());
                      Provider.of<UserProvider>(context, listen: false)
                          .updateUserInfo(name: _nameController.text);
                      await getViewModel().editProfile(
                          user:
                              Provider.of<UserProvider>(context, listen: false)
                                  .userInfo);
                    },
                    contentPadding: EdgeInsets.all(0),
                    textAlign: TextAlign.right,
                    isBorder: false,
                  ))
                : Text(entry['content'],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color:
                            key == 4 ? ColorUtil.primaryColor : Colors.black)),
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
              showChildDialog();
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

  void showChildDialog({Baby baby}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AddChildDialog(
              baby: baby,
              addChildCallBack: (name, gender, birthday) async {
                await getViewModel().addChild(
                    babyId: baby == null ? null : baby.id,
                    name: name,
                    gender: gender,
                    birthday: birthday,
                    img: _avatarFile);
                _avatarFile = null;
              },
              onSelectImage: (file) {
                _avatarFile = file;
              },
            ));
  }

  void _chooseGender() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              message: Text(S.of(context).gender),
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      Provider.of<UserProvider>(context, listen: false)
                          .updateUserInfo(gender: 1);
                      await getViewModel()
                          .editProfile(user: _userProvider.userInfo);
                    },
                    child: Text(S.of(context).male)),
                CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () async {
                      Navigator.of(context).pop();
                      Provider.of<UserProvider>(context, listen: false)
                          .updateUserInfo(gender: 2);
                      await getViewModel()
                          .editProfile(user: _userProvider.userInfo);
                    },
                    child: Text(S.of(context).female))
              ],
              cancelButton: CupertinoActionSheetAction(
                  onPressed: () => Navigator.of(context).pop(),
                  isDefaultAction: true,
                  child: Text(S.of(context).cancel)),
            ));
  }

  Future<void> showBirthdaySelectorDialog(
      BuildContext context, ValueChanged<DateTime> selectedDate) async {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1920, 1),
            lastDate: DateTime.now())
        .then((value) => {selectedDate(value)});
  }
}
