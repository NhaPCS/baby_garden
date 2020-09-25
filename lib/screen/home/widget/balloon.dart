import 'package:baby_garden_flutter/provider/get_balloon_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      _offset.value = new Offset(MediaQuery.of(context).size.width - 70,
          MediaQuery.of(context).size.height - 150);
    }
    return Consumer<GetBalloonProvider>(
      builder: (context, value, widget) {
        if (value.cleared) return SizedBox();
        return ValueListenableBuilder(
          valueListenable: _offset,
          builder: (BuildContext context, Offset value, Widget child) {
            return Positioned(
                left: _offset.value.dx,
                top: _offset.value.dy,
                child: Draggable(
                  child: GestureDetector(
                    child: getImage(),
                    onTap: () {
                      WidgetUtil.linkToScreen(
                          context,
                          Provider.of<GetBalloonProvider>(context,
                                  listen: false)
                              .balloon);
                    },
                  ),
                  feedback: getImage(),
                  childWhenDragging: SizedBox(),
                  onDragEnd: (detail) {
                    double dx = detail.offset.dx;
                    double dy = detail.offset.dy;
                    if (dx < 50) {
                      dx = 50;
                    }
                    if (dy < 50) {
                      dy = 50;
                    }
                    if (dx > MediaQuery.of(context).size.width - 70) {
                      dx = MediaQuery.of(context).size.width - 70;
                    }
                    if (dy > MediaQuery.of(context).size.height - 150) {
                      dy = MediaQuery.of(context).size.height - 150;
                    }
                    _offset.value = Offset(dx, dy);
                  },
                ));
          },
        );
      },
    );
  }

  Widget getImage() {
    String img = Provider.of<GetBalloonProvider>(context).balloon == null
        ? null
        : Provider.of<GetBalloonProvider>(context).balloon['img'];
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: CircleImage(
            width: 50,
            height: 50,
            imageUrl: img ?? '',
            borderRadius: SizeUtil.smallRadius,
          ),
        ),
        GestureDetector(
          onTap: () {
            Provider.of<GetBalloonProvider>(context, listen: false)
                .clearBalloon();
          },
          child: Icon(
            CupertinoIcons.clear_thick_circled,
            color: ColorUtil.gray,
          ),
        )
      ],
    );
  }
}
