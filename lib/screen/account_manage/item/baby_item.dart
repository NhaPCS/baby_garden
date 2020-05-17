import 'package:baby_garden_flutter/data/model/baby.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/child_heath/child_heath_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BabyItem extends StatelessWidget {
  final Baby baby;
  final VoidCallback onEditBabyPress;

  const BabyItem({Key key, this.baby, this.onEditBabyPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> entry(String title, String content, String icon) {
      return {'title': title, 'content': content, "icon": icon};
    }

    final List<Map<String, String>> childInforFields = <Map<String, String>>[
      entry(S.of(context).childName, baby.name, 'pencil.png'),
      entry(
          S.of(context).gender,
          baby.gender == Gender.male
              ? S.of(context).male
              : S.of(context).female,
          ''),
      entry(S.of(context).birthday, baby.birthday, ''),
      entry(S.of(context).healthIndex, S.of(context).moreDetail, 'right.png'),
      entry(S.of(context).lastDayCheck, baby.lastDayCheck, ''),
    ];

    return InkWell(
      onTap: () {
        onEditBabyPress();
      },
      child: Container(
        padding: SizeUtil.smallPadding,
        decoration: setBorder("bottom", ColorUtil.lineLightGray, 1),
        child: Row(children: <Widget>[
          // avatar
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeUtil.tinyRadius),
                child: baby.avatar.isEmpty
                    ? Image.asset(
                        'photo/child_avatar.png',
                        width: 95.0,
                        height: 95.0,
                        fit: BoxFit.fill,
                      )
                    : CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: baby.avatar,
                        width: 95.0,
                        height: 95.0,
                      )),
          ),
          SizedBox(width: SizeUtil.smallSpace),
          Expanded(
            child: entriesChildInfor(context, childInforFields),
          ),
          SizedBox(width: SizeUtil.smallSpace)
        ]),
      ),
    );
  }

  Widget entriesChildInfor(
      BuildContext context, List<Map<String, String>> entries) {
    final listEntries = List<Widget>();

    entries.asMap().forEach((index, entry) {
      listEntries.add(
        Row(
          children: <Widget>[
            Text(entry['title']),
            SizedBox(width: SizeUtil.smallSpace),
            Expanded(
                child: GestureDetector(
              onTap: () {
                if (index == 3)
                  RouteUtil.push(
                      context, ChildHeathScreen(selectedChildId: this.baby.id));
              },
              child: Text(entry['content'],
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: (index == 3)
                          ? ColorUtil.primaryColor
                          : (index == 4) ? ColorUtil.blueLight : Colors.black)),
            )),
            SizedBox(
              width: SizeUtil.smallSpace,
            ),
            GestureDetector(
              onTap: () {
                if (index == 3) {
                  RouteUtil.push(
                      context, ChildHeathScreen(selectedChildId: this.baby.id));
                } else if (index == 0) {
                  // edit child name
                }
              },
              child: Image.asset(
                "photo/${entry['icon']}",
                width: SizeUtil.iconSizeDefault,
                height: SizeUtil.iconSizeDefault,
              ),
            ),
          ],
        ),
      );
      listEntries.add(SizedBox(height: SizeUtil.tinySpace));
    });

    return Column(children: listEntries.map((e) => e).toList());
  }
}
