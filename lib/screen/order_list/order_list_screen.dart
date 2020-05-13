import 'package:baby_garden_flutter/provider/booking_detail_provider.dart';
import 'package:baby_garden_flutter/provider/order_list_provider.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/item/order_item.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../order_detail/order_detail_screen.dart';

class OrderListScreen extends StatefulWidget {
  final String title;
  final String childTitle;
  final int state;
  final bool isShowPositiveButton;
  final bool isShowNegativeButton;

  const OrderListScreen({
    Key key,
    @required this.title,
    this.state = 0,
    this.childTitle,
    this.isShowNegativeButton = false,
    this.isShowPositiveButton = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OrderListScreenState();
  }
}

class _OrderListScreenState extends BaseState<OrderListScreen> {
  final OrderListProvider _orderListProvider = OrderListProvider();

  @override
  void initState() {
    // TODO: implement initState
    _orderListProvider.getListData(widget.state);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
        title: widget.title,
        centerTitle: true,
        bgColor: ColorUtil.primaryColor,
        titleColor: Colors.white,
        backColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: SizeUtil.tinySpace,
            color: Colors.white,
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(bottom: SizeUtil.smallSpace),
                color: ColorUtil.lineColor,
                child: Consumer<OrderListProvider>(
                  builder: (BuildContext context, OrderListProvider value,
                      Widget child) {
                    List<dynamic> data = value.orderList;
                    if (data == null || data.isEmpty)
                      return LoadingView(
                        isNoData: data != null,
                        onReload: () {
                          _orderListProvider.getListData(widget.state);
                        },
                      );
                    return ListView(
                      children: data
                          .map((e) => GestureDetector(
                              onTap: () {
                                push(OrderDetailScreen(
                                  bookingId: e['id'],
                                ));
                              },
                              child: OrderItem(
                                isRated: false,
                                itemData: e,
                              )))
                          .toList(),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _orderListProvider)];
  }
}
