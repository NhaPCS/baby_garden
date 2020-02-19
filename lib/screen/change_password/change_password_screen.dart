import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/ChangePassProvider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
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

class _ChangePasswordScreenState extends BaseState<ChangePasswordScreen> {
  final ChangePassProvider _changePassProvider = new ChangePassProvider();
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
                  contentPadding: SizeUtil.normalPadding,
                )),
            Container(
                margin: const EdgeInsets.only(
                    left: SizeUtil.defaultSpace,
                    right: SizeUtil.defaultSpace,
                    bottom: SizeUtil.smallSpace),
                child: Consumer<ChangePassProvider>(
                  builder: (BuildContext context,
                      ChangePassProvider value, Widget child) {
                    return MyTextField(
                      hint: S.of(context).enter_new_password,
                      borderColor: ColorUtil.colorAccent,
                      borderRadius: SizeUtil.smallRadius,
                      contentPadding: SizeUtil.normalPadding,
                      obscureText: !value.isShowPass,
                      suffix: new GestureDetector(
                        onTap: () {
                          _changePassProvider.onControlShowPass();
                        },
                        child: Icon(
                          value.isShowPass
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: SizeUtil.iconSizeBigger,
                        ),
                      ),
                    );
                  },
                ),),
            Container(
                margin: const EdgeInsets.only(
                    left: SizeUtil.defaultSpace,
                    right: SizeUtil.defaultSpace,
                    top: SizeUtil.smallSpace,
                    bottom: SizeUtil.defaultSpace),
                child: Consumer<ChangePassProvider>(
                  builder: (BuildContext context,
                      ChangePassProvider value, Widget child) {
                    return MyTextField(
                      hint: S.of(context).reenter_new_password,
                      borderColor: ColorUtil.colorAccent,
                      borderRadius: SizeUtil.smallRadius,
                      contentPadding: SizeUtil.normalPadding,
                      obscureText: !value.isShowRePass,
                      suffix: new GestureDetector(
                        onTap: () {
                          _changePassProvider
                              .onControlShowRePass();
                        },
                        child: Icon(
                          value.isShowRePass
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: SizeUtil.iconSizeBigger,
                        ),
                      ),
                    );
                  },
                ),),
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
                    style: TextStyle(fontSize: SizeUtil.textSizeDefault, color: Colors.white),
                  ),
                )),
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).return_login,
                style: TextStyle(color: ColorUtil.blueForgotPass),
              ),
            )
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

}