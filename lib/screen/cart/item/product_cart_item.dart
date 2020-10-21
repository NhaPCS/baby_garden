import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/screen/cart/dialog/set_schedule_for_product_dialog.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/screen/cart/widget/discount_note.dart';
import 'package:baby_garden_flutter/screen/cart/widget/product_properties.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
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
    return InkWell(
      onTap: () {
        RouteUtil.push(
            context,
            ProductDetailScreen(
              productId: product['product_id'],
            ));
      },
      child: Stack(
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
                  imageUrl: product['image'] == null || product['image'].isEmpty
                      ? ''
                      : product['image'][0],
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
                          product['product_name'],
                          textAlign: TextAlign.left,
                        ),
                        padding: EdgeInsets.only(right: SizeUtil.smallSpace)),
                    DiscountNote(
                      note: product['promotion_info'],
                    ),
                    product['attach_product_name'] == null
                        ? SizedBox()
                        : InkWell(
                            child: WidgetUtil.paddingWidget(
                                MyText(
                                  "${S.of(context).attach_product_of_main} ${product['attach_product_name']}",
                                  style: TextStyle(
                                      color: ColorUtil.primaryColor,
                                      fontSize: SizeUtil.textSizeSmall),
                                ),
                                padding:
                                    EdgeInsets.only(right: SizeUtil.bigSpace)),
                            onTap: () {
                              if (product['main_product_id'] != null) {
                                RouteUtil.push(
                                    context,
                                    ProductDetailScreen(
                                        productId: product['main_product_id']));
                              }
                            },
                          ),
                    ProductProperties(product: product),
                    SizedBox(
                      height: SizeUtil.defaultSpace,
                    ),
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
                            product['price_discount'] != null
                                ? StringUtil.getPriceText(
                                    product['price_discount'])
                                : StringUtil.getPriceText(product['price']),
                            maxLines: 1,
                            maxFontSize: SizeUtil.textSizeDefault,
                            minFontSize: SizeUtil.textSizeSmall,
                            style: TextStyle(color: ColorUtil.red),
                          ),
                        ),
                        ChangeQuantityWidget(
                          buttonColor: ColorUtil.primaryColor,
                          textColor: ColorUtil.textColor,
                          quantity: StringUtil.getQuantity(product),
                          height: 23,
                          padding: EdgeInsets.only(
                              left: SizeUtil.superTinySpace,
                              right: SizeUtil.superTinySpace),
                          containerMargin: EdgeInsets.only(
                              left: SizeUtil.smallSpace,
                              right: SizeUtil.smallSpace),
                          quantityChanged: (value) {
                            product['quantity'] = value;
                            Provider.of<CartProvider>(context, listen: false)
                                .editProductCart(product);
                          },
                        ),
                        Expanded(
                          child: Center(
                            child: ButtonIcon(
                              icon: SvgIcon(product['calendar'] == null ||
                                      product['calendar'].isEmpty
                                  ? 'ic_alarm_disable.svg'
                                  : 'ic_alarm.svg'),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SetScheduleForProductDialog(
                                        product: product,
                                        onAddedCalendar: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .getMyCart();
                                        },
                                      );
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
                    .deleteProduct(product['product_id']);
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
      ),
    );
  }
}
