import 'dart:math';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/searching_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/chip_tag.dart';
import 'package:baby_garden_flutter/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends BaseState<SearchScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  final SearchingProvider _searchingProvider = SearchingProvider();

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
          onSearchTextChanged: (s) {
            if (s.trim().isEmpty)
              _searchingProvider.clearData();
            else
              _searchingProvider.searching(context);
          },
        ),
      ),
      body: Consumer<SearchingProvider>(
        builder: (BuildContext context, SearchingProvider value, Widget child) {
          return ListView.builder(
            itemCount: value.data == null || value.data.isEmpty
                ? 20
                : value.data.length,
            itemBuilder: (BuildContext context, int index) {
              if (value.data == null || value.data.isEmpty) {
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
                                    style: TextStyle(
                                        color: ColorUtil.primaryColor),
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
                        border: Border(
                            bottom: BorderSide(color: ColorUtil.lightGray))),
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
              } else {
                if (value.data[index].runtimeType == String) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      WidgetUtil.paddingWidget(
                          Text(
                            value.data[index],
                            style: TextStyle(
                                color: ColorUtil.primaryColor,
                                fontSize: SizeUtil.textSizeDefault),
                          ),
                          padding: EdgeInsets.only(
                              left: SizeUtil.defaultSpace,
                              top: SizeUtil.smallSpace,
                              bottom: SizeUtil.smallSpace)),
                      WidgetUtil.getLine(margin: EdgeInsets.all(0))
                    ],
                  );
                } else
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              value.data[index]['product_name'],
                            )),
                            Text(
                              value.data[index]['price'],
                              style: TextStyle(color: ColorUtil.red),
                            )
                          ],
                        ),
                        trailing: Transform.rotate(
                          angle: -180 * pi / 360,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.call_made,
                            color: ColorUtil.gray,
                          ),
                        ),
                        subtitle: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: S.of(context).distributor_name,
                              style: TextStyle(color: ColorUtil.textGray)),
                          TextSpan(
                              text: value.data[index]['distributor'],
                              style: TextStyle(color: ColorUtil.blue)),
                        ])),
                      ),
                      WidgetUtil.getLine(
                          margin: EdgeInsets.only(
                              left: SizeUtil.defaultSpace,
                              right: SizeUtil.defaultSpace))
                    ],
                  );
              }
            },
          );
        },
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _searchingProvider)];
  }
}
