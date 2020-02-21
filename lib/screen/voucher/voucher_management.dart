import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/favorite_product/product_card.dart';
import 'package:baby_garden_flutter/screen/voucher/voucherCard.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../base_state.dart';

class VoucherManage extends StatefulWidget {
  @override
  _VoucherManageState createState() => _VoucherManageState();
}

class _VoucherManageState extends BaseState<VoucherManage> {
  final GetListProvider _getListProvider = GetListProvider();

  @override
  Widget buildWidget(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          // appBar: getAppBar(title: S.of(context).voucherManage),
          appBar: AppBar(
            backgroundColor: ColorUtil.primaryColor,
            centerTitle: true,
            title: Text(S.of(context).voucherManage),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;
  final product = ProductCard(
    image: "photo/sample_product.png",
    description: "Sữa Alene dành cho bé thể tích 320ml...",
    price: "900000",
    datetime: "13/2/2020",
  );

  final vouchers = VoucherCard(
    image: "photo/sample_voucher.png",
    description: "Voucher khuyến mãi 50% đơn hàng",
    partner: "Vườn Của bé",
  );

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      vouchers,
      vouchers,
      vouchers,
      Icon(choice.icon, size: 128.0, color: Colors.black),
      Text(choice.title),
    ]);
  }
}

class VoucherManagement extends StatefulWidget {
  @override
  _VoucherManagement createState() => _VoucherManagement();
}

class _VoucherManagement extends BaseState<VoucherManagement> {
  final GetListProvider _getListProvider = GetListProvider();

  final product = ProductCard(
    image: "photo/sample_product.png",
    description: "Sữa Alene dành cho bé thể tích 320ml...",
    price: "900000",
    datetime: "13/2/2020",
  );

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).voucherManage),
        body: Column(children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[product, product, product],
            ),
          ),
        ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
