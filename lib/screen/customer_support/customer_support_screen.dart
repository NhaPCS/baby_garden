import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/customer_support/widget/circle_icon_title.dart';
import 'package:baby_garden_flutter/screen/partner_register/partner_register_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/text/hobo_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class CustomerSupportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomerSupportScreenState();
  }
}

class _CustomerSupportScreenState extends BaseState<CustomerSupportScreen> {
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
      body: ListView(
        children: <Widget>[
          Image.asset("photo/logo.png",
              width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.width / 4,),
          HoboText(fontSize: SizeUtil.textSizeBigger),
          SizedBox(
            height: SizeUtil.defaultSpace,
          ),
          CircleIconTitle(
            bgColor: ColorUtil.logoBgColor,
            img: "photo/logo.png",
            title: S.of(context).vcb_present,
          ),
          WidgetUtil.getLine(margin: EdgeInsets.only(left: SizeUtil.defaultSpace,right: SizeUtil.defaultSpace),color: ColorUtil.gray),
          CircleIconTitle(
            bgColor: ColorUtil.colorAccent,
            img: "photo/support_contact.png",
            title: S.of(context).vcb_contact,
          ),
          WidgetUtil.getLine(margin: EdgeInsets.only(left: SizeUtil.defaultSpace,right: SizeUtil.defaultSpace),color: ColorUtil.gray),
          CircleIconTitle(
            bgColor: ColorUtil.colorAccent,
            img: "photo/support_guide.png",
            title: S.of(context).buy_guide,
          ),
          WidgetUtil.getLine(margin: EdgeInsets.only(left: SizeUtil.defaultSpace,right: SizeUtil.defaultSpace),color: ColorUtil.gray),
          CircleIconTitle(
            bgColor: ColorUtil.customerSupportUpdate,
            img: "photo/support_update.png",
            title: S.of(context).update_info_guide,
          ),
          WidgetUtil.getLine(margin: EdgeInsets.only(left: SizeUtil.defaultSpace,right: SizeUtil.defaultSpace),color: ColorUtil.gray),
          CircleIconTitle(
            img: "photo/support_term.png",
            title: S.of(context).policy,
          ),
          WidgetUtil.getLine(margin: EdgeInsets.only(left: SizeUtil.defaultSpace,right: SizeUtil.defaultSpace),color: ColorUtil.gray),
          CircleIconTitle(
            onTap: (){
              push(PartnerRegisterScreen());
            },
            img: "photo/support_partner.png",
            title: S.of(context).vcb_register_partner,
          ),
          WidgetUtil.getLine(margin: EdgeInsets.only(left: SizeUtil.defaultSpace,right: SizeUtil.defaultSpace),color: ColorUtil.gray),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return null;
  }
}
