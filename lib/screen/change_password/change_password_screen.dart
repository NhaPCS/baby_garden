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
  final TextEditingController _oldPasswordController = new TextEditingController();
  final TextEditingController _newPasswordController = new TextEditingController();
  final TextEditingController _reenterNewPasswordController = new TextEditingController();
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
          MyPasswordTextField(
            controller: _oldPasswordController,
            hint: S
                .of(context)
                .enter_old_password,
          ),
          SizedBox(),
          SizedBox(height: SizeUtil.normalSpace,),
          MyPasswordTextField(
            controller: _newPasswordController,
            hint: S
                .of(context)
                .enter_new_password,
          ),
          SizedBox(height: SizeUtil.normalSpace,),
          MyPasswordTextField(
            controller: _reenterNewPasswordController,
            hint: S
                .of(context)
                .reenter_new_password,
          ),
          SizedBox(height: SizeUtil.normalSpace,),
          MyRaisedButton(
            onPressed: onChange,
            color: ColorUtil.colorAccent,
            textStyle: TextStyle(fontSize: SizeUtil.textSizeDefault, color: Colors.white),
            text: S.of(context).change_password,
            padding: const EdgeInsets.all(SizeUtil.midSpace),
          ),
        ],
      ),
    );
  }

  void onChange() async{
    final data = await getViewModel().onChangePassword(_oldPasswordController.text.trim(),_newPasswordController.text.trim(),_reenterNewPasswordController.text.trim(),);
    if (data==null){
      WidgetUtil.showMessageDialog(context, message: S.of(context).alert_resert_pass_success, title: S.of(context).changePassword,onOkClick: (){
        Navigator.of(context).pop();
      });
    }
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