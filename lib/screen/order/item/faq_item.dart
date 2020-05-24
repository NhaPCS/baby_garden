import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';

class FaqItem extends StatelessWidget {
  final dynamic question;
  final VoidCallback onItemPressed;

  const FaqItem({Key key, @required this.question, this.onItemPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: SizeUtil.smallPadding,
        child: MyText(question['title']),
      ),
      onTap: onItemPressed,
    );
  }
}
