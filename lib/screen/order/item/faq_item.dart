import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class FaqItem extends StatelessWidget {
  final String question;
  final VoidCallback onItemPressed;

  const FaqItem({Key key, @required this.question, this.onItemPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: SizeUtil.smallPadding,
        child: Text(question),
      ),
      onTap: onItemPressed,
    );
  }
}
