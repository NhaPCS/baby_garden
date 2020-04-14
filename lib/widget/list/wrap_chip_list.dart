import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

import '../chip_tag.dart';

class WrapChipList extends StatefulWidget {
  final List<dynamic> listData;
  final ValueNotifier<String> selectedIdController;

  const WrapChipList({Key key, this.listData, this.selectedIdController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WrapChipListState();
  }
}

class _WrapChipListState extends State<WrapChipList> {
  String selectedId;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.listData
          .map((e) => ChipTag(
                text: e['name'],
                checked: e['id'] == selectedId,
                fillColor: Colors.transparent,
                borderColor: ColorUtil.textGray,
                borderRadius: SizeUtil.smallRadius,
                removable: false,
                onChanged: (isCheck) {
                  setState(() {
                    if (isCheck) selectedId = e['id'];
                    widget.selectedIdController.value = selectedId;
                  });
                },
                selectedBorderColor: ColorUtil.primaryColor,
                hasCheckable: true,
              ))
          .toList(),
    );
  }
}
