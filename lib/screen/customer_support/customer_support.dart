import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class CustomerSupportScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerSupportScreenState();
  }

}

class _CustomerSupportScreenState extends BaseState<CustomerSupportScreen>{
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).customer_support,
        centerTitle: true,
          bgColor: Colors.white,
          titleColor: ColorUtil.primaryColor,
          backColor: ColorUtil.primaryColor,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset("photo/logo.png",
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 3),
            Text(S
                .of(context)
                .app_name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeLogo, fontFamily: "hobo")),
            SizedBox(),
            ListTile(
              leading: Image.asset("photo/logo.png",
                  width: SizeUtil.iconSizeBig ),
              title: Text(S
                  .of(context)
                  .vcb_present,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault,)),
            ),
            ListTile(
              leading: Image.asset("photo/logo.png",
                  width: SizeUtil.iconSizeBig ),
              title: Text(S
                  .of(context)
                  .vcb_contact,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault, )),
            ),
            ListTile(
              leading: Image.asset("photo/logo.png",
                  width: SizeUtil.iconSizeBig ),
              title: Text(S
                  .of(context)
                  .buy_guide,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault, )),
            ),
            ListTile(
              leading: Image.asset("photo/logo.png",
                  width: SizeUtil.iconSizeBig ),
              title: Text(S
                  .of(context)
                  .update_info_guide,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault, )),
            ),
            ListTile(
              leading: Image.asset("photo/logo.png",
                  width: SizeUtil.iconSizeBig ),
              title: Text(S
                  .of(context)
                  .policy,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault, )),
            ),
            ListTile(
              leading: Image.asset("photo/logo.png",
                  width: SizeUtil.iconSizeBig ),
              title: Text(S
                  .of(context)
                  .vcb_register_partner,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault, )),
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