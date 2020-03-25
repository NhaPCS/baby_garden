import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_pass_provider.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/change_pass_view_model.dart';
import 'package:baby_garden_flutter/widget/my_password_textfield.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChangePasswordScreenState();
  }

}

class _ChangePasswordScreenState extends BaseStateModel<ChangePasswordScreen,ChangePasswordViewModel> {
  final ChangePassProvider _changePassProvider = new ChangePassProvider();
  final TextEditingController _oldPasswordControler = new TextEditingController();
  final TextEditingController _newPasswordControler = new TextEditingController();
  final TextEditingController _reenterNewPasswordControler = new TextEditingController();
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
        child: ListView(
          children: <Widget>[
            Image.asset("photo/logo.png",
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 4,
            height: MediaQuery
                .of(context)
                .size
                .width / 4,),
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
                  textEditingController: _oldPasswordControler,
                  borderColor: ColorUtil.colorAccent,
                  elevation: SizeUtil.smallElevation,
                  borderRadius: SizeUtil.tinyRadius,
                  contentPadding: SizeUtil.normalPadding,
                )),
            Container(
              margin: const EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  bottom: SizeUtil.smallSpace),
              child: MyPasswordTextField(
                controller: _newPasswordControler,
                hint: S
                    .of(context)
                    .enter_new_password,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  bottom: SizeUtil.smallSpace),
              child: MyPasswordTextField(
                controller: _reenterNewPasswordControler,
                hint: S
                    .of(context)
                    .reenter_new_password,
              ),
            ),
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeUtil.tinyRadius),
                      )),
                  child: Text(
                    S.of(context)
                        .change_password,
                    style: TextStyle(fontSize: SizeUtil.textSizeDefault, color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _changePassProvider)];
  }

  @override
  ChangePasswordViewModel initViewModel() {
    // TODO: implement initViewModel
    return new ChangePasswordViewModel();
  }

}