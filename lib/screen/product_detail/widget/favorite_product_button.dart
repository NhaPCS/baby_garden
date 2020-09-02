import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/product_detail/provider/favorite_product_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class FavoriteProductButton extends StatelessWidget {
  final dynamic product;

  const FavoriteProductButton({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFavorite =
        product != null && '1' == product['is_favourite'];

    if (!isFavorite) return SizedBox();
    return Container(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: SizeUtil.tinySpace,
        children: <Widget>[
          isFavorite
              ? Icon(
            Icons.done,
            color: Colors.white,
            size: SizeUtil.iconSize,
          )
              : SizedBox(),
          Text(
            isFavorite
                ? S
                .of(context)
                .favorited
                : S
                .of(context)
                .favorite,
            style: TextStyle(
                color: Colors.white, fontSize: SizeUtil.textSizeSmall),
          )
        ],
      ),
      padding: EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.tinySpace,
          bottom: SizeUtil.tinySpace),
      decoration: BoxDecoration(
          color: ColorUtil.primaryColor,
          borderRadius: BorderRadius.circular(SizeUtil.tinyRadius)),
    );
  }
}

