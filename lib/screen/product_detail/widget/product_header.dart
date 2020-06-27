import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_index_provider.dart';
import 'package:baby_garden_flutter/screen/photo_view/photo_view_screen.dart';
import 'package:baby_garden_flutter/screen/product_detail/dialog/report_product/report_product_dialog.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/discount_widget.dart';
import 'package:baby_garden_flutter/widget/product/image_count.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductHeader extends StatelessWidget {
  final dynamic product;
  final ValueChanged<int> onCarouselItemSelected;
  final VoidCallback onFavoriteClicked;

  const ProductHeader(
      {Key key,
      this.product,
      this.onCarouselItemSelected,
      this.onFavoriteClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MyCarouselSlider(
          height: Provider.of<AppProvider>(context).productImageHeight,
          borderRadius: 0,
          margin: EdgeInsets.all(0),
          images: product['image'],
          boxFit: BoxFit.contain,
          slideBackground: Colors.white,
          onItemSelected: (index) {
            onCarouselItemSelected(index);
          },
          onItemPressed: (index) {
            RouteUtil.push(
                context,
                PhotoViewScreen(
                  images: product['image'],
                  initIndex: index,
                ));
          },
        ),
        Positioned(
          child: DiscountWidget(
            discount: StringUtil.getDiscountPercent(product),
            textSizeMax: SizeUtil.textSizeDefault,
            size: 50,
          ),
          right: 0,
          top: SizeUtil.smallSpace,
        ),
        Consumer<ChangeIndexProvider>(
          builder:
              (BuildContext context, ChangeIndexProvider value, Widget child) {
            return ImageCount(
              text: "${value.index + 1}/${product['image'].length}",
            );
          },
        ),
        Positioned(
            right: SizeUtil.smallSpace,
            bottom: SizeUtil.tinySpace,
            child: Row(
              children: <Widget>[
                ButtonIcon(
                  padding: EdgeInsets.only(
                      left: SizeUtil.smallSpace,
                      right: SizeUtil.smallSpace,
                      top: SizeUtil.tinySpace,
                      bottom: SizeUtil.tinySpace),
                  icon: Row(
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: product['is_favourite'] == '0'
                            ? ColorUtil.lightGray
                            : ColorUtil.red,
                        size: SizeUtil.iconSize,
                      ),
                      MyText(
                        product['number_favourite'],
                        style: TextStyle(color: ColorUtil.primaryColor),
                      )
                    ],
                  ),
                  borderRadius: SizeUtil.iconSize,
                  onPressed: onFavoriteClicked,
                ),
                ButtonIcon(
                  padding: SizeUtil.tinyPadding,
                  icon: Icon(
                    Icons.share,
                    color: ColorUtil.primaryColor,
                    size: SizeUtil.iconSize,
                  ),
                  borderRadius: SizeUtil.iconSize,
                  onPressed: () {
                    WidgetUtil.shareApp(context);
                  },
                ),
                ButtonIcon(
                  padding: SizeUtil.tinyPadding,
                  icon: Icon(
                    Icons.priority_high,
                    color: ColorUtil.primaryColor,
                    size: SizeUtil.iconSize,
                  ),
                  borderRadius: SizeUtil.iconSize,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => ReportProductDialog(
                              productId: product['id'],
                            ));
                  },
                )
              ],
            ))
      ],
    );
  }
}
