import 'dart:math';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/chip_tag.dart';
import 'package:baby_garden_flutter/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends BaseState<SearchScreen> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false, // Don't show the leading button
        title: SearchBar(
          padding: EdgeInsets.only(right: SizeUtil.smallSpace),
          hasBack: true,
          enable: true,
          searchTextController: _searchTextController,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                WidgetUtil.paddingWidget(Text(
                  S.of(context).hot_key,
                  style: TextStyle(color: ColorUtil.primaryColor),
                )),
                WidgetUtil.paddingWidget(Wrap(
                  children: List.generate(
                      5,
                      (index) => ChipTag(
                            text: "Đồ em bé",
                            borderColor: ColorUtil.lightGray,
                            fillColor: ColorUtil.lightGray,
                          )),
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
                    ButtonIcon(
                      icon: Text(
                        S.of(context).delete,
                        style: TextStyle(color: ColorUtil.blue),
                      ),
                      padding: SizeUtil.smallPadding,
                      onPressed: () {
                        //TODO
                      },
                    )
                  ],
                )
              ],
            );
          }
          return GestureDetector(
            child: Container(
              padding: SizeUtil.smallPadding,
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: ColorUtil.lightGray))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Sữa bột"),
                  ),
                  Transform.rotate(
                    angle: -180 * pi / 360,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.call_made,
                      color: ColorUtil.gray,
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              _searchTextController.text = "Sữa bột";
            },
          );
        },
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
