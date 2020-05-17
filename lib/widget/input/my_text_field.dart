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
  final Function onEditingComplete;
  final FocusNode onFocus;
  final String labelText;
  final TextStyle labelStyle;

  final String title;
  final TextStyle titleStyle;
  final Function onTrailingTap;
  final bool showTrailing;
  final bool isBorder;
  final bool autoFocus;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsets padding;

  const MyTextField(
      {Key key,
      @required this.textEditingController,
      this.hint,
      this.autoFocus = false,
      this.textStyle,
      this.showTrailing = false,
      this.onTrailingTap,
      this.isBorder = true,
      this.padding = const EdgeInsets.all(0),
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.titleStyle = const TextStyle(
          fontSize: SizeUtil.textSizeSmall, color: Colors.black),
      this.backgroundColor = Colors.white,
      this.borderColor = ColorUtil.textGray,
      this.borderRadius = 0,
      this.title,
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
      this.onEditingComplete,
      this.enable = true,
      InputDecoration decoration,
      this.labelText,
      this.labelStyle,
      this.borderWidth = 1})
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
    return title != null
        ? Stack(
            children: <Widget>[
              Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: crossAxisAlignment,
                  mainAxisAlignment: mainAxisAlignment,
                  children: <Widget>[
                    Text(
                      title,
                      style: titleStyle,
                    ),
                    SizedBox(
                      height: SizeUtil.tinySpace,
                    ),
                    TextField(
                      controller: textEditingController,
                      style: textStyle,
                      autofocus: autoFocus,
                      textAlign: textAlign,
                      maxLines: maxLines,
                      obscureText: obscureText,
                      onChanged: onChanged,
                      enabled: enable,
                      keyboardType: inputType,
                      onTap: ontap,
                      focusNode: onFocus,
                      decoration: InputDecoration(
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
                    )
                  ],
                ),
              ),
              showTrailing
                  ? Positioned(
                      right: SizeUtil.defaultSpace,
                      top: 0,
                      child: GestureDetector(
                          onTap: onTrailingTap,
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: SizeUtil.iconSizeBigger,
                            ),
                          )),
                    )
                  : SizedBox()
            ],
          )
        : TextField(
            controller: textEditingController,
            style: textStyle,
            textAlign: textAlign,
            maxLines: maxLines,
            obscureText: obscureText,
            onChanged: onChanged,
            enabled: enable,
            keyboardType: inputType,
            onTap: ontap,
            onEditingComplete: onEditingComplete,
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
    return isBorder
        ? OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)))
        : InputBorder.none;
  }
}
