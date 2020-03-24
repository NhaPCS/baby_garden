import 'package:baby_garden_flutter/item/item_order.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/order/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class ListOrderScreen extends StatefulWidget {
  final String title;
  final String childTitle;
  final int state;
  final bool isShowPositiveButton;
  final bool isShowNegativeButton;

  const ListOrderScreen({Key key, @required this.title, this.state = 0,this.childTitle,this.isShowNegativeButton = false, this.isShowPositiveButton = false,}) : super(key: key);

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
            push(OrderDetailScreen(title: widget.childTitle!=null?widget.childTitle:widget.title.replaceAll("\n", " "),state: widget.state,isShowNegativeButton: widget.isShowNegativeButton,isShowPositiveButton: widget.isShowPositiveButton,));
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
