import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleCheckbox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool checked;
  final Color color;
  final Color activeColor;
  final double size;
  final IconData checkBg;
  final IconData uncheckBg;
  final Text text;
  final EdgeInsets padding;

  const CircleCheckbox(
      {Key key,
      this.onChanged,
      this.checked = false,
      this.color,
      this.size = SizeUtil.iconSizeBigger,
      this.checkBg = CupertinoIcons.check_mark_circled_solid,
      this.uncheckBg = CupertinoIcons.check_mark_circled,
      this.text,
      this.activeColor = ColorUtil.primaryColor,
      this.padding = SizeUtil.smallPadding})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CircleState();
  }
}

class _CircleState extends State<CircleCheckbox> {
  bool checked = false;
  bool startValue;

  @override
  void initState() {
    checked = widget.checked;
    startValue = widget.checked;
    print("CHECK $checked");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (startValue != widget.checked) {
      checked = widget.checked;
      startValue = checked;
    }
    return InkWell(
      child: widget.text == null
          ? _icon()
          : Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: SizeUtil.tinySpace,
              children: <Widget>[_icon(), widget.text],
            ),
      onTap: () {
        setState(() {
          checked = !checked;
          if (widget.onChanged != null) widget.onChanged(checked);
        });
      },
    );
  }

  Widget _icon() {
    return Padding(
      padding: widget.padding,
      child: checked
          ? Icon(
              widget.checkBg,
              color: widget.activeColor,
              size: widget.size,
            )
          : Icon(
              widget.uncheckBg,
              color: widget.color,
              size: widget.size,
            ),
    );
  }
}
