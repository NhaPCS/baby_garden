import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class SelectChildDropDown extends StatefulWidget {
  final ValueNotifier<dynamic> controller;
  final List<dynamic> babies;
  final ValueChanged<dynamic> onChangeChild;
  final String selectedId;

  const SelectChildDropDown(
      {Key key,
      @required this.controller,
      @required this.babies,
      this.onChangeChild,
      this.selectedId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SelectChildState();
  }
}

class _SelectChildState extends State<SelectChildDropDown> {
  @override
  void initState() {
    if (widget.babies != null) {
      widget.controller.value = widget.babies[0];
      if (widget.selectedId != null) {
        widget.controller.value = widget.babies
            .firstWhere((element) => element['id'] == widget.selectedId);
      }
      if (widget.onChangeChild != null) {
        widget.onChangeChild(widget.controller.value);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: SizeUtil.smallPadding,
      padding: EdgeInsets.only(
          left: SizeUtil.defaultSpace,
          right: SizeUtil.defaultSpace,
          top: SizeUtil.tinySpace,
          bottom: SizeUtil.tinySpace),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: ColorUtil.gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          boxShadow: WidgetUtil.getShadow(),
          borderRadius: BorderRadius.all(Radius.circular(SizeUtil.bigRadius))),
      child: ValueListenableBuilder(
        valueListenable: widget.controller,
        builder: (context, value, child) {
          return PopupMenuButton<dynamic>(
            onSelected: (child) {
              if (widget.onChangeChild != null &&
                  value != null &&
                  value['id'] != child['id']) {
                widget.onChangeChild(value);
              }
              widget.controller.value = child;
            },
            itemBuilder: (BuildContext context) {
              return widget.babies.map((e) => menuItem(e)).toList();
            },
            shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorUtil.primaryColor, width: 2),
                borderRadius:
                    BorderRadius.all(Radius.circular(SizeUtil.smallRadius))),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Text(
                  value['name'],
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  PopupMenuItem menuItem(dynamic child) {
    return PopupMenuItem(
        value: child,
        child: Text(
          child['name'],
          style: TextStyle(color: ColorUtil.textColor),
        ));
  }
}
