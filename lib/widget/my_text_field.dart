import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;
  final TextStyle textStyle;
  final TextStyle hintStyle;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final Widget suffix;
  final String suffixText;
  final Widget prefix;
  final TextAlign textAlign;
  final TextInputType inputType;
  final bool obscureText;
  final EdgeInsetsGeometry contentPadding;
  final ValueChanged<String> onChanged;
  final int maxLines;
  final double elevation;
  final bool enable;
  final Function ontap;
  final FocusNode onFocus;
  final String labelText;
  final TextStyle labelStyle;

  const MyTextField(
      {Key key,
      @required this.textEditingController,
      this.hint,
      this.textStyle,
      this.backgroundColor = Colors.white,
      this.borderColor = ColorUtil.textGray,
      this.borderRadius = 0,
      this.borderWidth = 1,
      this.suffix,
      this.suffixText,
      this.textAlign = TextAlign.left,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.contentPadding = const EdgeInsets.only(
          left: SizeUtil.defaultSpace,
          right: SizeUtil.defaultSpace,
          top: SizeUtil.smallSpace,
          bottom: SizeUtil.smallSpace),
      this.onChanged,
      this.hintStyle,
      this.elevation,
      this.prefix,
      this.onFocus,
      this.maxLines = 1,
      this.ontap,
      this.enable = true,
      InputDecoration decoration,
      this.labelText,
      this.labelStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return elevation == null
        ? textField()
        : Material(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            color: backgroundColor,
            elevation: elevation,
            child: textField(),
          );
  }

  Widget textField() {
    return TextField(
      controller: textEditingController,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      obscureText: obscureText,
      onChanged: onChanged,
      enabled: enable,
      keyboardType: inputType,
      onTap: ontap,
      focusNode: onFocus,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle,
          contentPadding: contentPadding,
          isDense: true,
          fillColor: backgroundColor,
          focusColor: backgroundColor,
          hoverColor: backgroundColor,
          suffixIcon: suffix,
          suffixText: suffixText,
          prefixIcon: prefix,
          hintText: hint,
          hintStyle: hintStyle,
          enabledBorder: _getBorder(),
          focusedBorder: _getBorder(),
          border: _getBorder()),
    );
  }

  InputBorder _getBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)));
  }
}
