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
  final ValueChanged<int> quantityChanged;
  final int max;
  final Color buttonColor;
  final Color textColor;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets containerMargin;
  final int quantity;

  const ChangeQuantityWidget(
      {Key key,
      this.quantityController,
      this.max = 200,
      this.buttonColor = ColorUtil.textGray,
      this.textColor = ColorUtil.textGray,
      this.height = 35,
      this.padding = SizeUtil.tinyPadding,
      this.containerMargin = SizeUtil.smallPadding,
      this.quantity,
      this.quantityChanged})
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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    if (widget.quantity != null) {
      _changeQuantityProvider.count = widget.quantity;
    }
    return Container(
      height: widget.height,
      margin: widget.containerMargin,
      decoration: BoxDecoration(
          border: Border.all(color: ColorUtil.textGray, width: 1)),
      child: Row(
        children: <Widget>[
          ButtonIcon(
            icon: Icon(
              Icons.remove,
              color: widget.buttonColor,
              size: SizeUtil.iconSize,
            ),
            padding: widget.padding,
            onPressed: () {
              if (_changeQuantityProvider.count > 0)
                _changeQuantityProvider.minusCount();
              if (widget.quantityChanged != null) {
                widget.quantityChanged(_changeQuantityProvider.count);
              }
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
                    color: widget.textColor, fontWeight: FontWeight.bold),
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
              color: widget.buttonColor,
              size: SizeUtil.iconSize,
            ),
            padding: widget.padding,
            onPressed: () {
              if (_changeQuantityProvider.count < widget.max)
                _changeQuantityProvider.addCount();
              if (widget.quantityChanged != null) {
                widget.quantityChanged(_changeQuantityProvider.count);
              }
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
