import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:flutter/material.dart';

class Balloon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Balloon> {
  ValueNotifier<Offset> _offset = new ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    if (_offset.value == null) {
      _offset.value = new Offset(MediaQuery.of(context).size.width - 60,
          MediaQuery.of(context).size.height - 150);
    }
    return ValueListenableBuilder(
      valueListenable: _offset,
      builder: (BuildContext context, Offset value, Widget child) {
        return Positioned(
            left: _offset.value.dx,
            top: _offset.value.dy,
            child: Draggable(
              child: CircleImage(
                  width: 50,
                  height: 50,
                  imageUrl: 'http://chap.com.vn/vcb/uploads/balloons/sales.png',
                  borderRadius: SizeUtil.smallRadius),
              feedback: CircleImage(
                width: 50,
                height: 50,
                imageUrl: 'http://chap.com.vn/vcb/uploads/balloons/sales.png',
                borderRadius: SizeUtil.smallRadius,
              ),
              childWhenDragging: SizedBox(),
              onDragEnd: (detail) {
                _offset.value = detail.offset;
              },
            ));
      },
    );
  }
}
