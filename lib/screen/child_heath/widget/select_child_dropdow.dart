import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

const List<dynamic> dummyChildren = [
  {"name": "Âu Vũ Ngân Giang"},
  {"name": "Âu Vũ Ngân Giang 1"},
  {"name": "Âu Vũ Ngân Giang 2"},
];

class SelectChildDropDown extends StatefulWidget {
  final ValueChanged<dynamic> onSelectChild;

  const SelectChildDropDown({Key key, @required this.onSelectChild})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SelectChildState();
  }
}

class _SelectChildState extends State<SelectChildDropDown> {
  dynamic _selectedChild = dummyChildren[0];

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
      child: PopupMenuButton<dynamic>(
        onSelected: (child) {
          print(child);
          if (widget.onSelectChild != null) {
            widget.onSelectChild(child);
          }
          setState(() {
            _selectedChild = child;
          });
        },
        itemBuilder: (BuildContext context) {
          return dummyChildren.map((e) => menuItem(e)).toList();
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
              _selectedChild['name'],
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            )
          ],
        ),
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
