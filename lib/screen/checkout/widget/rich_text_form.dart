import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';

class RichTextForm extends StatelessWidget {
  final String title;
  final String content;
  final TextStyle titleStyle;
  final TextStyle contentStyle;
  final Color contentColor;

  const RichTextForm(
      {this.title,
      this.content,
      this.titleStyle = const TextStyle(
          color: ColorUtil.grayLine, fontSize: SizeUtil.textSizeExpressDetail),
      this.contentStyle = const TextStyle(
          color: ColorUtil.primaryColor,
          fontSize: SizeUtil.textSizeExpressDetail),
      this.contentColor = ColorUtil.primaryColor})
      : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(text: title, style: titleStyle),
        TextSpan(
            text: content,
            style: contentStyle != null
                ? contentStyle
                : TextStyle(
                    color: contentColor,
                    fontSize: SizeUtil.textSizeExpressDetail))
      ]),
    );
  }
}
