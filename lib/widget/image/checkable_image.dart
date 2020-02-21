import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class CheckableImage extends StatefulWidget {
  final dynamic fileData;
  final double imageSize;
  final int order;
  final ValueChanged<bool> onChanged;
  final VoidCallback onCanNotChecked;
  final bool checked;
  final bool checkable;

  const CheckableImage(
      {Key key,
      this.fileData,
      this.imageSize,
      this.order,
      this.onChanged,
      this.checked,
      this.checkable = true,
      this.onCanNotChecked})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CheckableState();
  }
}

class _CheckableState extends State<CheckableImage> {
  bool checked = false;

  @override
  void initState() {
    checked = widget.checked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: <Widget>[
          Container(
            height: widget.imageSize,
            margin: EdgeInsets.all(1),
            child: checked
                ? Container(
                    alignment: Alignment.center,
                    color: Colors.white.withOpacity(0.6),
                    child: Text(
                      (widget.order + 1).toString(),
                      style: TextStyle(fontSize: SizeUtil.textSizeBig),
                    ),
                  )
                : null,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: MemoryImage(widget.fileData['thumb'])),
                border: Border.all(
                    width: checked ? 2 : 0,
                    color: checked ? ColorUtil.blue : Colors.transparent)),
          ),
        ],
      ),
      onTap: () {
        if (!checked && !widget.checkable) {
          if (widget.onCanNotChecked != null) widget.onCanNotChecked();
          return;
        }
        setState(() {
          checked = !checked;
          if (widget.onChanged != null) widget.onChanged(checked);
        });
      },
    );
  }
}
