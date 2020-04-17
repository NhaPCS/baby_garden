import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/remind_add/remind_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../base_state.dart';
import 'item/remind_card_item.dart';

// TODO-QAnh:screen đặt ở folder riêng, khong de chung trong 1 folder
class RemindManagementScreen extends StatefulWidget {
  @override
  _RemindManageState createState() => _RemindManageState();
}

class _RemindManageState extends BaseState<RemindManagementScreen> {

  final remind1 = RemindCardItem(
    id: 1,
    image: "photo/sample_product.png",
    description:
        "Sữa bột Glico Nhật Bản số 0-1 dành cho trẻ từ sơ sinh đến 1 tuổi",
    price: "900.000",
    datetime: "12.01.2020 - 08:00",
    remindType: RemindType.remindBuy,
  );

  final remind2 = RemindCardItem(
    image: "photo/sample_product.png",
    description: "Sữa Alene dành cho bé thể tích 320ml...",
    price: "900.000",
    datetime: "12.01.2020 - 08:00",
    remindType: RemindType.remindUse,
  );

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.add_circle, size: 24, color: Colors.white),
              onPressed: () {
                push(RemindAddScreen());
              },
            ),
          ],
          title: S.of(context).remindManage,
        ),
        body: Column(children: <Widget>[
          // TODO-QAnh column chỉ có 1 container? bỏ đi
          Container(
            child: Column(
              children: <Widget>[remind1, remind2, remind1],
            ),
          ),
        ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
