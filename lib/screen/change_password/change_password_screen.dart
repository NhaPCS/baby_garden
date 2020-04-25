import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/change_password/view_model/change_pass_view_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/input/my_password_textfield.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/text/hobo_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePasswordScreenState();
  }

}

class _ChangePasswordScreenState extends BaseStateModel<ChangePasswordScreen,ChangePasswordViewModel> {
  final TextEditingController _oldPasswordControler = new TextEditingController();
  final TextEditingController _newPasswordControler = new TextEditingController();
  final TextEditingController _reenterNewPasswordControler = new TextEditingController();
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).change_password,
          centerTitle: true,
          bgColor: Colors.white,
          titleColor: ColorUtil.primaryColor,
          backColor: ColorUtil.primaryColor),
      body: ListView(
        padding: const EdgeInsets.only(
            left: SizeUtil.defaultSpace,
            right: SizeUtil.defaultSpace,
            bottom: SizeUtil.smallSpace),
        children: <Widget>[
          Image.asset("photo/logo.png",
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 4,),
          HoboText(fontSize: 22),
          SizedBox(height: SizeUtil.defaultSpace,),
          MyTextField(
            hint: S
                .of(context)
                .enter_old_password,
            textEditingController: _oldPasswordControler,
            borderColor: ColorUtil.colorAccent,
            elevation: SizeUtil.smallElevation,
            borderRadius: SizeUtil.tinyRadius,
            contentPadding: SizeUtil.normalPadding,
            inputType: TextInputType.text,
          ),
          SizedBox(height: SizeUtil.normalSpace,),
          MyPasswordTextField(
            controller: _newPasswordControler,
            hint: S
                .of(context)
                .enter_new_password,
          ),
          SizedBox(height: SizeUtil.normalSpace,),
          MyPasswordTextField(
            controller: _reenterNewPasswordControler,
            hint: S
                .of(context)
                .reenter_new_password,
          ),
          SizedBox(height: SizeUtil.normalSpace,),
          MyRaisedButton(
            onPressed: () async{
              final data = await getViewModel().onChangePassword(_oldPasswordControler.text.trim(),_newPasswordControler.text.trim(),_reenterNewPasswordControler.text.trim(),);
              if (data==null){
                WidgetUtil.showMessageDialog(context, message: S.of(context).alert_resert_pass_success, title: S.of(context).changePassword,onOkClick: (){
                  Navigator.of(context).pop();
                });
              }
            },
            color: ColorUtil.colorAccent,
            textStyle: TextStyle(fontSize: SizeUtil.textSizeDefault, color: Colors.white),
            text: S.of(context).change_password,
            padding: const EdgeInsets.all(SizeUtil.midSpace),
          ),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }

  @override
  ChangePasswordViewModel initViewModel() {
    return new ChangePasswordViewModel(context);
  }

}