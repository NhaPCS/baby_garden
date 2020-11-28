import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
    bool canExpand = widget.content != null && widget.content.length > 300;
    return Padding(
      padding: SizeUtil.smallPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            constraints: new BoxConstraints(
                minHeight: 50, maxHeight: isExpanded ? double.infinity : 100),
            child: Stack(
              children: <Widget>[
                Html(
                  data: widget.content ?? '',
                  defaultTextStyle: TextStyle(color: ColorUtil.textGray),
                ),
                isExpanded || !canExpand
                    ? SizedBox()
                    : Positioned(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.white10,
                                Colors.white24,
                                Colors.white70
                              ])),
                        ),
                        bottom: 0,
                        left: 0,
                        right: 0,
                      )
              ],
            ),
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          canExpand
              ? Center(
                  child: ButtonIcon(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: Text(
                      isExpanded
                          ? S.of(context).collapse
                          : S.of(context).view_more,
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
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
