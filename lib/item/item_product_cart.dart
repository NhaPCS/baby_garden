import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/change_quantity_widget.dart';
import 'package:baby_garden_flutter/widget/circle_image.dart';
import 'package:baby_garden_flutter/widget/dashed_line.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ItemProductCart extends StatelessWidget {
  final bool hasDashLine;

  const ItemProductCart({
    Key key,
    this.hasDashLine = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleImage(
                  imageUrl: StringUtil.dummyImage,
                  borderRadius: 0,
                  width: Provider.of<AppProvider>(context).productCartWidth,
                  height: Provider.of<AppProvider>(context).productCartWidth,
                ),
                SizedBox(
                  width: SizeUtil.smallSpace,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    WidgetUtil.paddingWidget(
                        Text(
                          "Giày thời trang trẻ em style Hàn Quốc",
                        ),
                        padding: EdgeInsets.only(right: SizeUtil.smallSpace)),
                    ButtonIcon(
                      padding: EdgeInsets.only(
                          top: SizeUtil.tinySpace, bottom: SizeUtil.tinySpace),
                      icon: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.angleDoubleLeft,
                            size: SizeUtil.iconSizeSmall,
                            color: ColorUtil.blueLight,
                          ),
                          SizedBox(
                            width: SizeUtil.tinySpace,
                          ),
                          Expanded(
                              child: Text(
                            S.of(context).note_for_product_promo,
                            style: TextStyle(
                                color: ColorUtil.blueLight,
                                fontSize: SizeUtil.textSizeSmall),
                          ))
                        ],
                      ),
                      onPressed: () {
                        //TODO
                      },
                    ),
                    WidgetUtil.paddingWidget(
                        Text(
                          "Sản phẩm KM mua kèm: Sữa bột Morinaga Nhật số 0-1",
                          style: TextStyle(
                              color: ColorUtil.primaryColor,
                              fontSize: SizeUtil.textSizeSmall),
                        ),
                        padding: EdgeInsets.only(right: SizeUtil.bigSpace)),
                    Row(
                      children: <Widget>[
                        Text(
                          "800.000 đ",
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeTiny,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        ),
                        Expanded(
                          child: AutoSizeText(
                            "800.000 đ",
                            maxLines: 1,
                            maxFontSize: SizeUtil.textSizeDefault,
                            minFontSize: SizeUtil.textSizeSmall,
                            style: TextStyle(color: ColorUtil.red),
                          ),
                        ),
                        ChangeQuantityWidget(
                          buttonColor: ColorUtil.primaryColor,
                          textColor: ColorUtil.textColor,
                          height: 25,
                          padding: EdgeInsets.all(0),
                        ),
                        ButtonIcon(
                          icon: SvgIcon('ic_alarm.svg'),
                        )
                      ],
                    )
                  ],
                )),
              ],
            ),
            Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: ButtonIcon(
                  icon: SvgIcon('ic_delete.svg'),
                  padding: SizeUtil.smallPadding,
                  onPressed: () {
                    //TODO
                  },
                ))
          ],
        ),
        !hasDashLine
            ? SizedBox()
            : CustomPaint(
                painter: DashedLine(
                    color: ColorUtil.textColor,
                    width: MediaQuery.of(context).size.width,
                    dashSpace: 5),
              ),
        SizedBox(
          height: SizeUtil.smallSpace,
        )
      ],
    );
  }
}