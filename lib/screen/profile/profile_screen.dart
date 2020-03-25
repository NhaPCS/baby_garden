import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/customer_support/customer_support.dart';
import 'package:baby_garden_flutter/screen/favorite_product/favorite_product.dart';
import 'package:baby_garden_flutter/screen/login/login_screen.dart';
import 'package:baby_garden_flutter/screen/partner/partner_book_schedule.dart';
import 'package:baby_garden_flutter/screen/partner/partner_like_screen.dart';
import 'package:baby_garden_flutter/screen/point_management/point_history_screen.dart';
import 'package:baby_garden_flutter/screen/point_management/point_management_screen.dart';
import 'package:baby_garden_flutter/screen/profile/account_manage_screen.dart';
import 'package:baby_garden_flutter/screen/profile/user_infor.dart';
import 'package:baby_garden_flutter/screen/remind_management/remind_management_screen.dart';
import 'package:baby_garden_flutter/screen/seen_product/seen_product_screen.dart';
import 'package:baby_garden_flutter/screen/setting/setting_screen.dart';
import 'package:baby_garden_flutter/screen/voucher/voucher_management_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen> {
  final GetListProvider _getListProvider = GetListProvider();

  final UserInfor userInfor = UserInfor(
    username: "Đinh Bộ Lĩnh",
    mobilePhone: "0123456789",
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
      {'icon': 'profile_logout', 'title': S.of(context).logout}
    ];

    return Column(children: <Widget>[
      getAppBar(title: S.of(context).myProfile, hasBack: false),
      Container(
          // user information
          child: this.userInfor),
      Expanded(
        child: entriesWidget(entries),
      ),
    ]);
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }

  Widget entriesWidget(List<Map<String, String>> entries) {
    return ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
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
                    width: 26,
                    height: 26,
                    padding: EdgeInsets.only(left: 12, right: 15),
                  ),
                  Text(entries[index]['title'],
                      style: TextStyle(
                          color: (index == 0)
                              ? ColorUtil.primaryColor
                              : ColorUtil.black33)),
                ],
              ),
            ),
            onTap: () {
              switch (index) {
                case 0:
                  push(AccountManage());
                  break;
                case 1:
                  push(PointManagement());
                  break;
                case 2:
                  push(RemindManagementScreen());
                  break;
                case 3:
                  push(VoucherManagement());
                  break;
                case 4:
                  push(FavoriteProduct());
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
                  WidgetUtil.showConfirmDialog(context,
                      title: "Xác nhận",
                      message: "Bạn có muốn đăng xuất không?",
                      positive: "Có",
                      negative: "Không", positiveClicked: () {
                    push(LoginScreen());
                  }, negativeClick: () {});
                  break;
              }
            },
          );
        });
  }
}
