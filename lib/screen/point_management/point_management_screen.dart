import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/point_management/item/point_card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

// TODO-QAnh: them chu Screen o cuoi
class PointManagement extends StatefulWidget {
  @override
  _SeenProduct createState() => _SeenProduct();
}

class _SeenProduct extends BaseState<PointManagement> {

  final product = PointCardItem(
    image: "photo/voucherVCB.png",
    name: "Vườn của bé",
    point: 200,
  );

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).pointManage),
        // TODO-QAnh: lồng nhiều Column quá, để 1 cái ListView thôi
        body: Column(children: <Widget>[
          // TODO-QAnh: bỏ Container này đi
          Container(
            // TODO-QAnh: bỏ Column này đi
            child: Column(
              children: <Widget>[
                // TODO-QAnh: line dùng WidgetUtil.getLine
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
    return [];
  }
}
