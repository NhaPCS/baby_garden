import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends BaseState<RegisterScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).register,
          centerTitle: true,
          bgColor: Colors.white,
          titleColor: ColorUtil.primaryColor,
          backColor: ColorUtil.primaryColor),
      body: Center(
          child: ListView(
        padding: const EdgeInsets.only(
            left: SizeUtil.bigSpace, right: SizeUtil.bigSpace),
        children: <Widget>[
          Image.asset(
            "photo/logo.png",
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 4,
          ),
          Text(S.of(context).app_name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontFamily: "hobo")),
          SizedBox(
            height: SizeUtil.defaultSpace,
          ),
          MyTextField(
            hint: S.of(context).your_full_name,
            borderColor: ColorUtil.colorAccent,
            borderRadius: SizeUtil.smallRadius,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyTextField(
            hint: S.of(context).enter_phone_number,
            borderColor: ColorUtil.colorAccent,
            borderRadius: SizeUtil.smallRadius,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyTextField(
            hint: S.of(context).password,
            borderColor: ColorUtil.colorAccent,
            borderRadius: SizeUtil.smallRadius,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyTextField(
            hint: S.of(context).reenter_password,
            borderColor: ColorUtil.colorAccent,
            borderRadius: SizeUtil.smallRadius,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyTextField(
            hint: S.of(context).enter_invite_phone_number,
            borderColor: ColorUtil.colorAccent,
            borderRadius: SizeUtil.smallRadius,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyTextField(
            hint: S.of(context).enter_otp,
            borderColor: ColorUtil.colorAccent,
            borderRadius: SizeUtil.smallRadius,
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
          ),
          RaisedButton(
            onPressed: () {},
            color: ColorUtil.colorAccent,
            child: Text(
              S.of(context).register,
              style: TextStyle(fontSize: SizeUtil.textSizeBigger, color: Colors.white
              ),
            ),
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
          ),
          Text(
            S.of(context).return_login_if_had_account,
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorUtil.blueForgotPass),
          ),

        ],
      )),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return null;
  }
}
