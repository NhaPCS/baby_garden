import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/point_management/point_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class PointManagement extends StatefulWidget {
  @override
  _SeenProduct createState() => _SeenProduct();
}

class _SeenProduct extends BaseState<PointManagement> {
  final GetListProvider _getListProvider = GetListProvider();

  final product = PointCard(
    image: "photo/voucherVCB.png",
    name: "Vườn của bé",
    point: 200,
  );

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).pointManage),
        body: Column(children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 5,
                  color: Color.fromRGBO(228, 228, 228, 1),
                ),
                product,
                product,
                product
              ],
            ),
          ),
        ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
