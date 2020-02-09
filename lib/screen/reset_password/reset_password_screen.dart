import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ResetPasswordScreenState();
  }

}

class _ResetPasswordScreenState extends BaseState<ResetPasswordScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
          title: S
              .of(context)
              .change_password,
          centerTitle: true,
          bgColor: Colors.white,
          titleColor: ColorUtil.primaryColor,
          backColor: ColorUtil.primaryColor),
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
                style: TextStyle(fontSize: 22, fontFamily: "hobo")),
            SizedBox(height: SizeUtil.defaultSpace,),
            Container(
                margin: const EdgeInsets.only(
                    left: SizeUtil.defaultSpace,
                    right: SizeUtil.defaultSpace,
                    bottom: SizeUtil.smallSpace),
                child: MyTextField(
                  hint: S
                      .of(context)
                      .enter_old_password,
                  borderColor: ColorUtil.colorAccent,
                  borderRadius: SizeUtil.smallRadius,
                )),
            Container(
                margin: const EdgeInsets.only(
                    left: SizeUtil.defaultSpace,
                    right: SizeUtil.defaultSpace,
                    bottom: SizeUtil.smallSpace),
                child: MyTextField(
                  hint: S
                      .of(context)
                      .enter_new_password,
                  borderColor: ColorUtil.colorAccent,
                  borderRadius: SizeUtil.smallRadius,
                )),
            Container(
                margin: const EdgeInsets.only(
                    left: SizeUtil.defaultSpace,
                    right: SizeUtil.defaultSpace,
                    top: SizeUtil.smallSpace,
                    bottom: SizeUtil.defaultSpace),
                child: MyTextField(
                  hint: S
                      .of(context)
                      .reenter_new_password,
                  borderColor: ColorUtil.colorAccent,
                  borderRadius: SizeUtil.smallRadius,
                )),
            Container(
                padding: const EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                ),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: RaisedButton(
                  onPressed: () {},
                  color: ColorUtil.colorAccent,
                  child: Text(
                    S.of(context)
                        .change_password,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )),
            Text(
              S.of(context).return_login,
              style: TextStyle(color: ColorUtil.blueForgotPass),
            )
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