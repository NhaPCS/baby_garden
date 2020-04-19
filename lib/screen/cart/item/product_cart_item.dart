import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/screen/cart/dialog/set_schedule_for_product_dialog.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/change_quantity_widget.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/line/dashed_line.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductCartItem extends StatelessWidget {
  final bool hasDashLine;
  final dynamic product;

  const ProductCartItem({
    Key key,
    this.hasDashLine = true,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              left: SizeUtil.smallSpace,
              top: SizeUtil.smallSpace,
              bottom: SizeUtil.smallSpace),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleImage(
                imageUrl: StringUtil.dummyImage,
                borderRadius: 0,
                margin: EdgeInsets.all(0),
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
                      MyText(
                        product['name'],
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
                        StringUtil.getPriceText(product['price']),
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeTiny,
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        width: SizeUtil.smallSpace,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          StringUtil.getPriceText(product['price_discount']),
                          maxLines: 1,
                          maxFontSize: SizeUtil.textSizeDefault,
                          minFontSize: SizeUtil.textSizeSmall,
                          style: TextStyle(color: ColorUtil.red),
                        ),
                      ),
                      ChangeQuantityWidget(
                        buttonColor: ColorUtil.primaryColor,
                        textColor: ColorUtil.textColor,
                        quantity: int.parse(product['number']),
                        height: 23,
                        padding: EdgeInsets.only(
                            left: SizeUtil.superTinySpace,
                            right: SizeUtil.superTinySpace),
                        containerMargin: EdgeInsets.only(
                            left: SizeUtil.smallSpace,
                            right: SizeUtil.smallSpace),
                        quantityChanged: (value) {
                          Provider.of<CartProvider>(context, listen: false)
                              .editProductCart(product, value);
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: ButtonIcon(
                            icon: SvgIcon('ic_alarm.svg'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SetScheduleForProductDialog();
                                  });
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
        ButtonIcon(
          icon: SvgIcon('ic_delete.svg'),
          padding: SizeUtil.smallPadding,
          onPressed: () {
            WidgetUtil.showConfirmDialog(context,
                title: S.of(context).title_confirm_delete_cart,
                message: S.of(context).message_confirm_delete_cart,
                positive: S.of(context).yes, positiveClicked: () {
              Provider.of<CartProvider>(context, listen: false)
                  .deleteProduct(product);
            }, negative: S.of(context).no);
          },
        ),
        Positioned(
          child: !hasDashLine
              ? SizedBox()
              : CustomPaint(
                  painter: DashedLine(
                      color: ColorUtil.textColor,
                      width: MediaQuery.of(context).size.width,
                      dashSpace: 5),
                ),
          bottom: 0,
          left: 0,
          right: 0,
        )
      ],
    );
  }
}
