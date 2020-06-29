import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/customer_support/widget/circle_icon_title.dart';
import 'package:baby_garden_flutter/screen/customer_support_detail/customer_support_detail_screen.dart';
import 'package:baby_garden_flutter/screen/customer_support_detail/provider/get_support_provider.dart';
import 'package:baby_garden_flutter/screen/partner_register/partner_register_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/hobo_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class CustomerSupportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomerSupportScreenState();
  }
}

class _CustomerSupportScreenState extends BaseState<CustomerSupportScreen> {
  final GetSupportProvider _getSupportProvider = GetSupportProvider();

  @override
  void initState() {
    super.initState();
    _getSupportProvider.getSupport();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).customer_support,
        centerTitle: true,
        bgColor: ColorUtil.primaryColor,
        titleColor: Colors.white,
        backColor: Colors.white,
      ),
      body: Consumer<GetSupportProvider>(
        builder:
            (BuildContext context, GetSupportProvider value, Widget child) {
          return ListView(
            children: <Widget>[
              Image.asset(
                "photo/logo.png",
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
              ),
              HoboText(fontSize: SizeUtil.textSizeBigger),
              SizedBox(
                height: SizeUtil.defaultSpace,
              ),
              CircleIconTitle(
                bgColor: ColorUtil.logoBgColor,
                img: "photo/logo.png",
                title: S.of(context).vcb_present,
                onTap: () {
                  push(CustomerSupportDetailScreen(
                    title: S.of(context).vcb_present,
                    content: value.data['introduction'],
                  ));
                },
              ),
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(
                      left: SizeUtil.defaultSpace,
                      right: SizeUtil.defaultSpace),
                  color: ColorUtil.gray),
              CircleIconTitle(
                bgColor: ColorUtil.colorAccent,
                img: "photo/support_contact.png",
                title: S.of(context).vcb_contact,
                onTap: () {
                  push(CustomerSupportDetailScreen(
                    title: S.of(context).vcb_contact,
                    content: value.data['contact'],
                  ));
                },
              ),
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(
                      left: SizeUtil.defaultSpace,
                      right: SizeUtil.defaultSpace),
                  color: ColorUtil.gray),
              CircleIconTitle(
                bgColor: ColorUtil.colorAccent,
                img: "photo/support_guide.png",
                title: S.of(context).buy_guide,
                onTap: () {
                  push(CustomerSupportDetailScreen(
                    title: S.of(context).buy_guide,
                    content: value.data['instruction_booking'],
                  ));
                },
              ),
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(
                      left: SizeUtil.defaultSpace,
                      right: SizeUtil.defaultSpace),
                  color: ColorUtil.gray),
              CircleIconTitle(
                bgColor: ColorUtil.customerSupportUpdate,
                img: "photo/support_update.png",
                title: S.of(context).update_info_guide,
                onTap: () {
                  push(CustomerSupportDetailScreen(
                    title: S.of(context).update_info_guide,
                    content: value.data['instruction_profile'],
                  ));
                },
              ),
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(
                      left: SizeUtil.defaultSpace,
                      right: SizeUtil.defaultSpace),
                  color: ColorUtil.gray),
              CircleIconTitle(
                onTap: () {
                  push(CustomerSupportDetailScreen(
                    title: S.of(context).policy,
                    content: value.data['privacy'],
                  ));
                },
                img: "photo/support_term.png",
                title: S.of(context).policy,
              ),
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(
                      left: SizeUtil.defaultSpace,
                      right: SizeUtil.defaultSpace),
                  color: ColorUtil.gray),
              CircleIconTitle(
                onTap: () {
                  push(PartnerRegisterScreen());
                },
                img: "photo/support_partner.png",
                title: S.of(context).vcb_register_partner,
              ),
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(
                      left: SizeUtil.defaultSpace,
                      right: SizeUtil.defaultSpace),
                  color: ColorUtil.gray),
            ],
          );
        },
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getSupportProvider)];
  }
}
