import 'package:baby_garden_flutter/item/item_order.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/order/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class ListOrderScreen extends StatefulWidget {
  final String title;
  const ListOrderScreen({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListOrderState();
  }
}

class _ListOrderState extends BaseState<ListOrderScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: widget.title.replaceAll("\n", " ")),
      body: ListView.builder(itemBuilder: (context, index) {
        return InkWell(
          child: ItemOrder(),
          onTap: () {
            push(OrderDetailScreen());
          },
        );
      }),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
