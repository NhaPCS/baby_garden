import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final Widget suffix;
  final TextAlign textAlign;
  final TextInputType inputType;
  final bool obscureText;
  final EdgeInsetsGeometry contentPadding;
  final ValueChanged<String> onChanged;

  const TextfieldWidget(
      {Key key,
      @required this.textEditingController,
      this.hint,
      this.textStyle,
      this.backgroundColor = Colors.white,
      this.borderColor = ColorUtil.black26,
      this.borderRadius = 0,
      this.suffix,
      this.textAlign = TextAlign.center,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.contentPadding = const EdgeInsets.only(
          left: SizeUtil.defaultSpace,
          right: SizeUtil.defaultSpace,
          top: SizeUtil.smallSpace,
          bottom: SizeUtil.smallSpace),
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: textStyle,
      textAlign: textAlign,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: inputType,
      decoration: InputDecoration(
          contentPadding: contentPadding,
          isDense: true,
          fillColor: backgroundColor,
          suffix: suffix,
          hintText: hint,
          enabledBorder: _getBorder(),
          focusedBorder: _getBorder(),
          border: _getBorder()),
    );
  }

  InputBorder _getBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)));
  }
}
