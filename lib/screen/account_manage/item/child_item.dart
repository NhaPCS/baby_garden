import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/child_heath/child_heath_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChildItem extends StatelessWidget {
  final dynamic entry;

  const ChildItem({Key key, this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: SizeUtil.smallSpace, top: SizeUtil.smallSpace, bottom: SizeUtil.smallSpace),
      decoration: setBorder("bottom", ColorUtil.lineLightGray, 1),
      child: Row(children: <Widget>[
        // avatar
        CircleImage(
          width: 92,
          height: 92,
          imageUrl: entry['avatar'],
          borderRadius: 10,
        ),
        SizedBox(width: SizeUtil.smallSpace),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(child: Text(S.of(context).childName)),
                  MyText(entry['name']),
                  Padding(child: Icon(Icons.edit, color: ColorUtil.gray,size: SizeUtil.iconSizeDefault,),padding: SizeUtil.tinyPadding,)
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text(S.of(context).gender)),
                  MyText(entry['gender'] == '1'
                      ? S.of(context).boy
                      : S.of(context).girl),
                  Icon(Icons.keyboard_arrow_right, color: Colors.transparent,)
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text(S.of(context).birthday)),
                  MyText(entry['birthday']),
                  Icon(Icons.keyboard_arrow_right, color: Colors.transparent,)
                ],
              ),
              InkWell(child: Row(
                children: [
                  Expanded(child: Text(S.of(context).healthIndex)),
                  MyText(
                    S.of(context).moreDetail,
                    style: TextStyle(color: ColorUtil.primaryColor),
                  ),
                  Icon(Icons.keyboard_arrow_right, color: ColorUtil.gray,)
                ],
              ),onTap: (){
                RouteUtil.push(context, ChildHeathScreen(selectedChildId: entry['id'],));
              },),
              Row(
                children: [
                  Expanded(child: Text(S.of(context).lastDayCheck)),
                  MyText(entry['date'], style: TextStyle(color: ColorUtil.blue),),
                  Icon(Icons.keyboard_arrow_right, color: ColorUtil.gray,)
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
