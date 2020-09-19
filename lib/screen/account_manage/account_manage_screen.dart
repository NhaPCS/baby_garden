import 'dart:io';

import 'package:baby_garden_flutter/data/model/baby.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/account_manage/dialog/add_child_dialog.dart';
import 'package:baby_garden_flutter/screen/account_manage/item/baby_item.dart';
import 'package:baby_garden_flutter/screen/account_manage/view_model/account_manage_view_model.dart';
import 'package:baby_garden_flutter/screen/address_setting/address_setting_screen.dart';
import 'package:baby_garden_flutter/screen/address_setting/provider/get_list_address_provider.dart';
import 'package:baby_garden_flutter/screen/change_password/change_password_screen.dart';
import 'package:baby_garden_flutter/screen/child_heath/provider/get_list_baby_provider.dart';
import 'package:baby_garden_flutter/screen/profile/widget/user_infor.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
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
  final GetListAddressProvider _getListAddressProvider =
      GetListAddressProvider();
  final TextEditingController _nameController = TextEditingController();
  bool isSet = false;
  File _avatarFile;

  @override
  void initState() {
    super.initState();
    _getListBabyProvider.listBaby();
    _getListAddressProvider.getData();
  }

  @override
  Widget buildWidget(BuildContext context) {
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
              Consumer2<UserProvider, GetListAddressProvider>(
                builder: (BuildContext context, UserProvider value,
                    GetListAddressProvider addressProvider, Widget child) {
                  var entries = value.getEntries(context,
                      address: StringUtil.getFullAddress(
                          addressProvider.mainAddress));

                  final listEntryUser = List<Widget>();
                  entries.asMap().forEach((key, value) {
                    listEntryUser.add(userInfoRow(key, value));
                  });

                  return Column(children: listEntryUser);
                },
              ),

              Consumer<GetListBabyProvider>(
                builder: (BuildContext context, GetListBabyProvider value,
                    Widget child) {
                  return headerChildInfor();
                },
              ),
              WidgetUtil.getLine(
                  color: ColorUtil.lineLightGray, margin: EdgeInsets.all(0)),
              Consumer<GetListBabyProvider>(
                builder: (BuildContext context, GetListBabyProvider value,
                    Widget child) {
                  if (value.babies == null || value.babies.isEmpty)
                    return SizedBox(
                      child: LoadingView(
                        isNoData: true,
                        title: S.of(context).no_child,
                      ),
                      height: 200,
                    );
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
    if (key == 0 && !isSet) {
      _nameController.text = entry['content'];
      isSet = true;
    }

    return GestureDetector(
      onTap: () async {
        switch (key) {
          case 2:
            if (entry['content'] != null &&
                entry['content'].toString().isNotEmpty) {
              return;
            }
            showBirthdaySelectorDialog(context, (birthday) async {
              await getViewModel().editProfile(context,
                  birthday: DateUtil.formatBirthdayDate(birthday));
            });
            break;
          case 3:
            _chooseGender();
            break;
          case 4:
            push(ChangePasswordScreen());
            break;
          case 5:
            await push(AddressSettingScreen());
            _getListAddressProvider.getData();
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
                      await getViewModel()
                          .editProfile(context, name: _nameController.text);
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
          _getListBabyProvider.babies == null ||
                  _getListBabyProvider.babies.length < 4
              ? GestureDetector(
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
              : SizedBox()
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _getListBabyProvider),
      ChangeNotifierProvider.value(value: _getListAddressProvider),
    ];
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
                      await getViewModel().editProfile(context, gender: 1);
                    },
                    child: Text(S.of(context).male)),
                CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await getViewModel().editProfile(context, gender: 2);
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
