import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/search/provider/get_hot_keys_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/chip_tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotKeys extends StatelessWidget {
  final ValueChanged<String> onHotKeyPress;
  final VoidCallback onDeleteHistory;
  final List<dynamic> histories;

  const HotKeys(
      {Key key, this.onHotKeyPress, this.onDeleteHistory, this.histories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        WidgetUtil.paddingWidget(Text(
          S.of(context).hot_key,
          style: TextStyle(color: ColorUtil.primaryColor),
        )),
        WidgetUtil.paddingWidget(Consumer<GetHotKeysProvider>(
          builder:
              (BuildContext context, GetHotKeysProvider value, Widget child) {
            return Wrap(
              children: List.generate(
                  value.keys == null ? 0 : value.keys.length,
                  (index) => ChipTag(
                        text: value.keys[index]['title'],
                        borderColor: ColorUtil.lightGray,
                        fillColor: ColorUtil.lightGray,
                        onItemPressed: (s) {
                          onHotKeyPress(s);
                        },
                      )),
            );
          },
        )),
        WidgetUtil.getLine(),
        Row(
          children: <Widget>[
            Expanded(
                child: WidgetUtil.paddingWidget(
                    Text(
                      S.of(context).search_key_history,
                      style: TextStyle(color: ColorUtil.primaryColor),
                    ),
                    padding: SizeUtil.smallPadding)),
            histories == null || histories.isEmpty? SizedBox(): ButtonIcon(
              icon: Text(
                S.of(context).delete,
                style: TextStyle(color: ColorUtil.blue),
              ),
              padding: SizeUtil.smallPadding,
              onPressed: () {
                WidgetUtil.showConfirmDialog(context,
                    title: S.of(context).confirm,
                    message: S.of(context).mess_delete_search_history,
                    positive: S.of(context).yes, positiveClicked: () {
                  onDeleteHistory();
                });
              },
            )
          ],
        ),
        histories == null || histories.isEmpty
            ? Container(
                padding: SizeUtil.defaultPadding,
                child: Text(S.of(context).no_search_history),
                alignment: Alignment.center,
              )
            : SizedBox()
      ],
    );
  }
}
