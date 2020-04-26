import 'package:baby_garden_flutter/screen/checkout/widget/rich_text_form.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleIcon extends StatelessWidget {
  final String title;
  final String content;
  final String svgIcon;
  final IconData icon;
  final Widget contentWidget;
  final bool isTrailing;
  final Function onTrailingTap;
  final EdgeInsets padding;
  final EdgeInsets iconPadding;
  final TextStyle titleStyle;
  final TextStyle contentStyle;

  const TitleIcon(
      {this.title,
      this.content,
      this.svgIcon,
      this.contentWidget,
      this.isTrailing = false,
      this.onTrailingTap,
      this.padding = const EdgeInsets.all(0),
      this.icon,
      this.iconPadding = const EdgeInsets.all(0),
      this.titleStyle = const TextStyle(
          color: ColorUtil.textColor,
          fontSize: SizeUtil.textSizeExpressDetail), this.contentStyle})
      : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          svgIcon == null
              ? Padding(
                  padding: iconPadding,
                  child: Icon(
                    icon,
                    size: SizeUtil.iconMidSize,
                    color: ColorUtil.primaryColor,
                  ),
                )
              : SvgIcon(
                  svgIcon,
                  width: SizeUtil.iconSize,
                  height: SizeUtil.iconSize,
                  color: Colors.red,
                ),
          SizedBox(
            width: SizeUtil.smallSpace,
          ),
          contentWidget == null ? SizedBox() : Text(title, style: titleStyle),
          contentWidget == null
              ? RichTextForm(
                  title: title,
                  titleStyle: titleStyle,
                  content: content,
                  contentStyle: contentStyle,
                )
              : contentWidget,
          isTrailing ? Spacer() : SizedBox(),
          isTrailing
              ? Padding(
                  padding: const EdgeInsets.only(
                      left: SizeUtil.smallSpace,
                      right: SizeUtil.smallSpace,
                      top: SizeUtil.tinySpace,
                      bottom: SizeUtil.tinySpace),
                  child: GestureDetector(
                      onTap: onTrailingTap,
                      child: SvgIcon(
                        "ic_copy.svg",
                        width: SizeUtil.iconSizeDefault,
                        height: SizeUtil.iconSizeDefault,
                      )),
                )
              : SizedBox(),
          SizedBox(
            width: SizeUtil.smallSpace,
          )
        ],
      ),
    );
  }
}
