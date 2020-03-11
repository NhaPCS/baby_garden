import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../base_state.dart';
import 'remindCard.dart';

class RemindManagement extends StatefulWidget {
  @override
  _RemindManageState createState() => _RemindManageState();
}

class _RemindManageState extends BaseState<RemindManagement> {
  final GetListProvider _getListProvider = GetListProvider();

  final remind = RemindCard(
    image: "photo/sample_product.png",
    description: "Sữa Alene dành cho bé thể tích 320ml...",
    price: "900000",
    datetime: "13/2/2020",
    favorite: true,
  );

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).remindManage),
        body: Column(children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[remind, remind, remind],
            ),
          ),
        ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
