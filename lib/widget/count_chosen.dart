import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/util/resource.dart';

class CountChosen extends StatefulWidget {
  final String suffixText;
  final int value;

  const CountChosen({Key key, this.suffixText, this.value}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CountChosenState();
  }
}

class _CountChosenState extends State<CountChosen> {
  int count = 0;

  @override
  void initState() {
    count = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          InkWell(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.remove,
                size: SizeUtil.iconSize,
                color: ColorUtil.textGray,
              ),
            ),
            onTap: () {
              if (count > 1) {
                setState(() {
                  count--;
                });
              }
            },
          ),
          Text("$count${widget.suffixText}"),
          InkWell(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.add,
                size: SizeUtil.iconSize,
                color: ColorUtil.textGray,
              ),
            ),
            onTap: () {
              setState(() {
                count++;
              });
            },
          )
        ],
      ),
      decoration: BoxDecoration(
          color: ColorUtil.textGray,
          borderRadius: BorderRadius.all(Radius.circular(SizeUtil.tinyRadius))),
    );
  }
}
