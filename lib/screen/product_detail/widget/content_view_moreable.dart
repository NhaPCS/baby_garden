import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';

class ContentViewMoreable extends StatefulWidget {
  final String content;

  const ContentViewMoreable({Key key, this.content}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ContentViewMoreable> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SizeUtil.smallPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText(
            widget.content,
            style: TextStyle(color: ColorUtil.textGray),
            overflow: isExpanded?null: TextOverflow.ellipsis,
            maxLines: isExpanded ? null : 5,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Center(child: ButtonIcon(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            icon: Text(
              isExpanded ? S.of(context).collapse : S.of(context).view_more,
              style: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontSize: SizeUtil.textSizeSmall),
            ),
            borderRadius: SizeUtil.bigRadius,
            padding: EdgeInsets.only(
                left: SizeUtil.smallSpace,
                right: SizeUtil.smallSpace,
                top: SizeUtil.tinySpace,
                bottom: SizeUtil.tinySpace),
            backgroundColor: Colors.transparent,
          ),)
        ],
      ),
    );
  }
}
