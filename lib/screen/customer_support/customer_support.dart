import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class CustomerSupportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerSupportScreenState();
  }
}

class _CustomerSupportScreenState extends BaseState<CustomerSupportScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).customer_support,
        centerTitle: true,
        bgColor: ColorUtil.primaryColor,
        titleColor: Colors.white,
        backColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset("photo/logo.png",
                width: MediaQuery.of(context).size.width / 4),
            Text(S.of(context).app_name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeBigger, fontFamily: "hobo")),
            SizedBox(
              height: SizeUtil.defaultSpace,
            ),
            ListTile(
              leading: Card(
                  color: ColorUtil.logoBgColor,
                  shape: RoundedRectangleBorder(
                    //TODO set radius
                    borderRadius: BorderRadius.circular(SizeUtil.bigRadius),
                  ),
                  child: Image.asset("photo/logo.png",
                      width: SizeUtil.iconSizeBig)),
              title: Text(S.of(context).vcb_present,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeUtil.textSizeDefault,
                  )),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              margin: new EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: 0,
                  bottom: 0),
              color: ColorUtil.gray,
            ),
            ListTile(
              leading: Card(
                color: ColorUtil.colorAccent,
                shape: RoundedRectangleBorder(
                  //TODO set radius
                  borderRadius: BorderRadius.circular(SizeUtil.bigRadius),
                ),
                child: Image.asset("photo/support_contact.png",
                    width: SizeUtil.iconSizeBig),
              ),
              title: Text(S.of(context).vcb_contact,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeUtil.textSizeDefault,
                  )),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              margin: new EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: 0,
                  bottom: 0),
              color: ColorUtil.gray,
            ),
            ListTile(
              leading: Card(
                color: ColorUtil.colorAccent,
                shape: RoundedRectangleBorder(
                  //TODO set radius
                  borderRadius: BorderRadius.circular(SizeUtil.bigRadius),
                ),
                child: Image.asset("photo/support_guide.png",
                    width: SizeUtil.iconSizeBig),
              ),
              title: Text(S.of(context).buy_guide,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeUtil.textSizeDefault,
                  )),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              margin: new EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: 0,
                  bottom: 0),
              color: ColorUtil.gray,
            ),
            ListTile(
              leading: Card(
                color: ColorUtil.customerSupportUpdate,
                shape: RoundedRectangleBorder(
                  //TODO set radius
                  borderRadius: BorderRadius.circular(SizeUtil.bigRadius),
                ),
                child: Image.asset("photo/support_update.png",
                    width: SizeUtil.iconSizeBig),
              ),
              title: Text(S.of(context).update_info_guide,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeUtil.textSizeDefault,
                  )),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              margin: new EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: 0,
                  bottom: 0),
              color: ColorUtil.gray,
            ),
            ListTile(
              leading: Image.asset("photo/support_term.png",
                  width: SizeUtil.iconSizeBig),
              title: Text(S.of(context).policy,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeUtil.textSizeDefault,
                  )),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              margin: new EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: 0,
                  bottom: 0),
              color: ColorUtil.gray,
            ),
            ListTile(
              leading: Image.asset("photo/support_partner.png",
                  width: SizeUtil.iconSizeBig),
              title: Text(S.of(context).vcb_register_partner,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeUtil.textSizeDefault,
                  )),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              margin: new EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: 0,
                  bottom: 0),
              color: ColorUtil.gray,
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return null;
  }
}
