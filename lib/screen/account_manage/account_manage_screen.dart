import 'package:baby_garden_flutter/data/model/baby.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/account_manage/dialog/add_child_dialog.dart';
import 'package:baby_garden_flutter/screen/account_manage/item/baby_item.dart';
import 'package:baby_garden_flutter/screen/address_setting/address_setting_screen.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/change_password/change_password_screen.dart';
import 'package:baby_garden_flutter/screen/child_heath/child_heath_screen.dart';
import 'package:baby_garden_flutter/screen/child_heath/provider/get_list_baby_provider.dart';
import 'package:baby_garden_flutter/screen/point_management/provider/point_manage_provider.dart';
import 'package:baby_garden_flutter/screen/profile/widget/user_infor.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class AccountManageScreen extends StatefulWidget {
  @override
  _AccountManageScreenState createState() => _AccountManageScreenState();
}

class _AccountManageScreenState extends BaseState<AccountManageScreen> {
  GetListBabyProvider _getListBabyProvider = GetListBabyProvider();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_getListBabyProvider.babies == null ||
        _getListBabyProvider.babies.isEmpty) {
      _getListBabyProvider.listBaby();
    }
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
      entry(
          S.of(context).gender,
          user == null
              ? ""
              : user['gender'] == 1 ? S.of(context).male : S.of(context).female,
          ''),
      entry(S.of(context).password, S.of(context).changePassword, 'right.png'),
      entry(S.of(context).address, '', 'right.png'),
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
            WidgetUtil.getLine(
                margin: EdgeInsets.all(0),
                color: Color.fromRGBO(223, 223, 223, 1),
                width: 3),
            childInfor()
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

  Widget childInfor() {
    print(_getListBabyProvider.babies);
    return Column(children: <Widget>[
      headerChildInfor(),
      WidgetUtil.getLine(
          color: ColorUtil.lineLightGray, margin: EdgeInsets.all(0)),

      // BabyItem(baby: exampleBaby),
      Consumer<GetListBabyProvider>(
        builder: (context, value, child) {
          if (value.babies == null || value.babies.isEmpty)
            return LoadingView(
              isNoData: value.babies != null,
            );

          return SingleChildScrollView(
            child: Column(
                children: value.babies
                    .map((baby) => BabyItem(baby: Baby.fromJson(baby)))
                    .toList()),
          );
        },
      )
      // Consumer(builder: null)
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
              SvgIcon('add_baby.svg',
                  color: ColorUtil.primaryColor,
                  width: SizeUtil.iconSizeBigger,
                  height: SizeUtil.iconSizeBigger),
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
}
