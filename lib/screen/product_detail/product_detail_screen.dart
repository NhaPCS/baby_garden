import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/cart_icon.dart';
import 'package:baby_garden_flutter/widget/product/discount_widget.dart';
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
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
