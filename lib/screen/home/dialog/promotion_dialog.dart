import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_close_dialog.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<Color> RAN_COLORS = [
  Colors.red,
  Colors.orange,
  Colors.blue,
  Colors.green
];

class PromotionDialog extends AlertDialog {
  final BuildContext context;
  final Random random = Random();
  final dynamic promotion;

  PromotionDialog(this.context, this.promotion);

  @override
  ShapeBorder get shape => RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(SizeUtil.bigRadius)));

  @override
  Color get backgroundColor => Colors.transparent;

  @override
  Widget get content => Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          GestureDetector(
            child: Container(
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.only(
                    top: Provider.of<AppProvider>(context).width03 / 2),
                shape: shape,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GiftBoxAnimation(
                      imgUrl: promotion['img'],
                    ),
                    Text(
                      promotion == null ? '' : promotion['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorUtil.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    SizedBox(
                      height: SizeUtil.hugSpace,
                    ),
                  ],
                ),
                color: Colors.white,
              ),
            ),
            onTap: () {
              WidgetUtil.linkToScreen(context, promotion);
            },
          ),
          Stack(
            children: List.generate(
                50,
                (index) => GiftAnimation(
                      index: index,
                      random: random,
                      centerHeight: 5,
                      centerWidth: 8,
                    )),
          ),
          Positioned(
            child: ButtonCloseDialog(),
            top: SizeUtil.hugSpace,
            right: 0,
          )
        ],
      );
}

class GiftAnimation extends StatefulWidget {
  final int index;
  final Random random;
  final double centerWidth;
  final double centerHeight;

  const GiftAnimation(
      {Key key, this.index, this.random, this.centerWidth, this.centerHeight})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GiftState();
  }
}

class _GiftState extends State<GiftAnimation> with TickerProviderStateMixin {
  double left;
  double top;
  double size;
  Color color;
  AnimationController controller;

  @override
  void initState() {
    left = widget.random.nextDouble() * widget.centerWidth;
    top = widget.random.nextDouble() * widget.centerHeight;
    if (widget.index % 2 == 0) left = -left;
    if (widget.index % 3 != 0) top = -top;
    size = widget.random
            .nextInt((SizeUtil.iconSizeBig - SizeUtil.iconSizeSmall).toInt()) +
        SizeUtil.iconSizeSmall;
    color = RAN_COLORS[widget.random.nextInt(RAN_COLORS.length)];
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      controller.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(0, 2), end: Offset(left, top))
          .animate(
              CurvedAnimation(parent: controller, curve: Curves.easeOutQuad)),
      child: Image.asset(
        'photo/ic_promo_${widget.index % 5 + 1}.png',
        width: size,
        color: color,
      ),
    );
  }
}

class GiftBoxAnimation extends StatefulWidget {
  final String imgUrl;

  const GiftBoxAnimation({Key key, this.imgUrl}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GiftBoxState();
  }
}

class _GiftBoxState extends State<GiftBoxAnimation>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    super.initState();
    controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(0, -3), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: controller, curve: Curves.elasticInOut)),
      child: MyCachedImage(
        url: widget.imgUrl,
        width: 200,
        height: 200,
        boxFit: BoxFit.contain,
      ),
    );
  }
}
