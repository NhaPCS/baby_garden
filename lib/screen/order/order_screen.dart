import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class OrderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderState();
  }
}

class _OrderState extends BaseState<OrderScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        getAppBar(title: S.of(context).order.toUpperCase(), hasBack: false),
        Text(
          S.of(context).my_order,
          style: TextStyle(
              color: ColorUtil.primaryColor, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
