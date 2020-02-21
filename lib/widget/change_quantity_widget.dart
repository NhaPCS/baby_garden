import 'package:baby_garden_flutter/provider/change_quantity_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'button/button_icon.dart';

class ChangeQuantityWidget extends StatefulWidget {
  final ValueNotifier<int> quantityController;
  final int max;

  const ChangeQuantityWidget({Key key, this.quantityController, this.max = 10})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChangeQuantityState();
  }
}

class _ChangeQuantityState extends BaseState<ChangeQuantityWidget> {
  final ChangeQuantityProvider _changeQuantityProvider =
      ChangeQuantityProvider();

  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      height: 35,
      margin: SizeUtil.smallPadding,
      decoration: BoxDecoration(
          border: Border.all(color: ColorUtil.textGray, width: 1)),
      child: Row(
        children: <Widget>[
          ButtonIcon(
            icon: Icon(
              Icons.remove,
              color: ColorUtil.textGray,
            ),
            onPressed: () {
              if (_changeQuantityProvider.count > 0)
                _changeQuantityProvider.minusCount();
            },
          ),
          Container(
            width: 1,
            color: ColorUtil.textGray,
            margin: EdgeInsets.only(right: SizeUtil.smallSpace),
          ),
          Consumer<ChangeQuantityProvider>(
            builder: (BuildContext context, ChangeQuantityProvider value,
                Widget child) {
              if (widget.quantityController != null)
                widget.quantityController.value = value.count;
              return Text(
                value.count.toString(),
                style: TextStyle(
                    color: ColorUtil.textGray, fontWeight: FontWeight.bold),
              );
            },
          ),
          Container(
            width: 1,
            color: ColorUtil.textGray,
            margin: EdgeInsets.only(left: SizeUtil.smallSpace),
          ),
          ButtonIcon(
            icon: Icon(
              Icons.add,
              color: ColorUtil.textGray,
            ),
            onPressed: () {
              if (_changeQuantityProvider.count < widget.max)
                _changeQuantityProvider.addCount();
            },
          )
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _changeQuantityProvider)];
  }
}
