import 'package:baby_garden_flutter/provider/change_index_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../chip_tag.dart';

class SelectProductProperty extends StatefulWidget {
  final String title;
  final dynamic product;
  final String property;

  const SelectProductProperty(
      {Key key, this.title, this.product, this.property})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends BaseState<SelectProductProperty> {
  final ChangeIndexProvider _changeIndexProvider = ChangeIndexProvider();

  @override
  void initState() {
    super.initState();
    if (widget.product[widget.property] != null &&
        widget.product[widget.property].isNotEmpty) {
      widget.product['${widget.property}_id'] =
          widget.product[widget.property][0]['id'];
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    if (widget.product[widget.property] == null || widget.product[widget.property].isEmpty)
      return SizedBox();
    return WidgetUtil.paddingWidget(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Consumer<ChangeIndexProvider>(
          builder:
              (BuildContext context, ChangeIndexProvider value, Widget child) {
            return Wrap(
              children: List.generate(widget.product[widget.property].length, (index) {
                return ChipTag(
                  text: widget.product[widget.property][index]['name'],
                  borderRadius: SizeUtil.tinyRadius,
                  fillColor: ColorUtil.lightGray,
                  borderColor: ColorUtil.lightGray,
                  selectedBorderColor: ColorUtil.primaryColor,
                  hasCheckable: true,
                  onItemPressed: (item) {
                    widget.product['selected_${widget.property}'] = widget.product[widget.property][index]['id'];
                    _changeIndexProvider.changeIndex(index);
                  },
                  checked: value.index == index,
                );
              }),
            );
          },
        )
      ],
    ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _changeIndexProvider)];
  }
}
