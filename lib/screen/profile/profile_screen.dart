import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/account_manage/account_manage_screen.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/customer_support/customer_support_screen.dart';
import 'package:baby_garden_flutter/screen/favorite_product/favorite_product_screen.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/screen/partner_like/partner_like_screen.dart';
import 'package:baby_garden_flutter/screen/point_management/point_management_screen.dart';
import 'package:baby_garden_flutter/screen/profile/widget/header_without_login.dart';
import 'package:baby_garden_flutter/screen/profile/widget/user_infor.dart';
import 'package:baby_garden_flutter/screen/remind_management/remind_management_screen.dart';
import 'package:baby_garden_flutter/screen/seen_product/seen_product_screen.dart';
import 'package:baby_garden_flutter/screen/setting/setting_screen.dart';
import 'package:baby_garden_flutter/screen/voucher_management/voucher_management_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen> {
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
      {'icon': 'profile_logout', 'title': S.of(context).logout}
    ];

    return Scaffold(
      appBar: getAppBar(title: S.of(context).myProfile, hasBack: false),
      body: Consumer<UserProvider>(
        builder: (BuildContext context, UserProvider value, Widget child) {
          return SingleChildScrollView(
              child: listView(entries: entries, logined: value.isLogin));
        },
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }

  Widget listView({@required List<Map<String, String>> entries, bool logined}) {
    final listView = List<Widget>();

    listView.add(logined
        ? Container(
            // user information
            child: UserInfor())
        : HeaderWithoutLogin());

    entries.asMap().forEach((index, entry) {
      listView.add(GestureDetector(
        child: Visibility(
          visible: !(!logined && index == 9),
          child: Container(
            padding: const EdgeInsets.all(SizeUtil.tinySpace),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Color.fromRGBO(206, 206, 206, 1)),
            )),
            child: Row(
              children: <Widget>[
                SvgIcon(
                  '${entry['icon']}.svg',
                  color: (index == 0 && logined)
                      ? ColorUtil.primaryColor
                      : ColorUtil.black33,
                  width: SizeUtil.iconSizeBigger,
                  height: SizeUtil.iconSizeBigger,
                  padding: EdgeInsets.only(
                      left: SizeUtil.midSpace,
                      right: SizeUtil.normalSpace,
                      top: SizeUtil.tinySpace,
                      bottom: SizeUtil.tinySpace),
                ),
                Expanded(
                  child: Text(entry['title'],
                      style: TextStyle(
                          color: (index == 0 && logined)
                              ? ColorUtil.primaryColor
                              : ColorUtil.black33)),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          if (!logined) {
            switch (index) {
              case 7:
                push(CustomerSupportScreen());
                break;
              default:
                WidgetUtil.showRequireLoginDialog(context);
            }

            return;
          }

          pushToScreen(index);
        },
      ));
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: listView.map((e) => e).toList(),
    );
  }

  void pushToScreen(int index) {
    switch (index) {
      case 0:
        push(AccountManageScreen());
        break;
      case 1:
        push(PointManagementScreen());
        break;
      case 2:
        push(RemindManagementScreen());
        break;
      case 3:
        push(VoucherManagement());
        break;
      case 4:
        push(FavoriteProductScreen());
        break;
      case 5:
        push(PartnerLikeScreen());
        break;
      case 6:
        push(SeenProductScreen());
        break;
      case 7:
        push(CustomerSupportScreen());
        break;
      case 8:
        push(SettingScreen());
        break;
      case 9:
        // TODO-Nha: check lai,
        WidgetUtil.showConfirmDialog(context,
            title: S.of(context).confirm,
            message: S.of(context).messageLogout,
            positive: S.of(context).yes,
            negative: S.of(context).no, positiveClicked: () {
          ShareValueProvider.shareValueProvider.saveUserId(null);
          ShareValueProvider.shareValueProvider.saveUserInfo(null);
          Provider.of<UserProvider>(context, listen: false).logout(false);
          pushReplacement(MainScreen());
        }, negativeClick: () {});
        break;
    }
    ;
  }
}
