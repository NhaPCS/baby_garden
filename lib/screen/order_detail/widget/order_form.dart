import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';

class OrderForm extends StatelessWidget {
  final String title;
  final String content;
  final TextStyle titleStyle;
  final TextStyle contentStyle;

  const OrderForm(
      {this.title,
      this.content,
      this.titleStyle =
          const TextStyle(fontSize: SizeUtil.textSizeExpressDetail),
      this.contentStyle =
          const TextStyle(fontSize: SizeUtil.textSizeExpressDetail)})
      : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(
          left: SizeUtil.normalSpace,
          right: SizeUtil.normalSpace,
          top: SizeUtil.midSmallSpace,
          bottom: SizeUtil.midSmallSpace),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: titleStyle,
          ),
          Spacer(),
          Text(content, style: contentStyle)
        ],
      ),
    );
  }
}
