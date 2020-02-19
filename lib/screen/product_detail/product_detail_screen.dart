import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/product_detail/store_info.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button_icon.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/cart_icon.dart';
import 'package:baby_garden_flutter/widget/product/discount_widget.dart';
import 'package:baby_garden_flutter/widget/product/favorite_tag.dart';
import 'package:baby_garden_flutter/widget/product/image_count.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductScreenState();
  }
}

class _ProductScreenState extends BaseState<ProductDetailScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).product_detail,
        actions: [CartIcon()],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              MyCarouselSlider(
                height: Provider.of<AppProvider>(context).productImageHeight,
                borderRadius: 0,
                margin: EdgeInsets.all(0),
                images: [
                  StringUtil.dummyImage,
                  StringUtil.dummyImage,
                  StringUtil.dummyImage
                ],
              ),
              Positioned(
                child: DiscountWidget(
                  discount: 33,
                  textSizeMax: SizeUtil.textSizeDefault,
                  size: 50,
                ),
                right: 0,
                top: SizeUtil.smallSpace,
              ),
              ImageCount(
                text: "1/3",
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
                              color: ColorUtil.red,
                              size: SizeUtil.iconSize,
                            ),
                            Text(
                              "112",
                              style: TextStyle(color: ColorUtil.primaryColor),
                            )
                          ],
                        ),
                        borderRadius: SizeUtil.iconSize,
                        onPressed: () {
                          //TODO
                        },
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
                          //TODO
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
                          //TODO
                        },
                      )
                    ],
                  ))
            ],
          ),
          paddingContainer(Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FavoriteTag(),
              SizedBox(
                width: SizeUtil.smallSpace,
              ),
              Expanded(
                  child: Text(
                "Giày thời trang trẻ em style Hàn Quốc",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
            ],
          )),
          paddingContainer(Text(
            "Nhập mã VCB2020 để được giảm thêm 5% khi mua sản phẩm",
            style: TextStyle(color: ColorUtil.textGray),
          )),
          paddingContainer(Row(
            children: <Widget>[
              Text(
                "800.000 đ",
                style: TextStyle(
                    color: ColorUtil.red,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeUtil.textSizeBigger),
              ),
              SizedBox(
                width: SizeUtil.smallSpace,
              ),
              Text(
                "800.000 đ",
                style: TextStyle(
                    color: ColorUtil.textGray,
                    decoration: TextDecoration.lineThrough),
              ),
              Expanded(child: SizedBox()),
              Text(
                S.of(context).product_existing,
                style: TextStyle(
                    color: ColorUtil.blue, fontSize: SizeUtil.textSizeSmall),
              )
            ],
          )),
          WidgetUtil.getLine(),
          StoreInfo(),
          WidgetUtil.getLine(),
        ],
      ),
    );
  }

  Widget paddingContainer(Widget widget) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.smallSpace),
      child: widget,
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
