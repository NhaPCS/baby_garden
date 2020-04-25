import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  const MyPasswordTextField({Key key,this.controller,this.hint }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyPasswordTextFieldState();
  }
}

class _MyPasswordTextFieldState extends State<MyPasswordTextField> {
  bool isShowPass = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyTextField(
      hint: widget.hint!=null?widget.hint:S.of(context).enter_password,
      textEditingController: widget.controller,
      borderColor: ColorUtil.colorAccent,
      borderRadius: SizeUtil.tinyRadius,
      elevation: SizeUtil.smallElevation,
      contentPadding: SizeUtil.normalPadding,
      inputType: TextInputType.text,
      obscureText: !isShowPass,
      suffix: GestureDetector(
        onTap: () {
          setState(() {
            isShowPass = !isShowPass;
          });
        },
        child: Icon(
          isShowPass ? Icons.visibility : Icons.visibility_off,
          size: SizeUtil.iconSizeBigger,
        ),
      ),
    );
  }
}
