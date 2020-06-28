import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/product_detail/provider/favorite_product_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class FavoriteProductButton extends StatefulWidget {
  final dynamic product;

  const FavoriteProductButton({Key key, this.product}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends BaseState<FavoriteProductButton> {
  final FavoriteProductProvider _favoriteProductProvider =
  FavoriteProductProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    _favoriteProductProvider.isFavorite =
        widget.product != null && '1' == widget.product['is_favourite'];
    return InkWell(child: Container(
      child: Consumer<FavoriteProductProvider>(
        builder: (BuildContext context, FavoriteProductProvider value,
            Widget child) {
          return Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: SizeUtil.tinySpace,
            children: <Widget>[
              value.isFavorite
                  ? Icon(
                Icons.done,
                color: Colors.white,
                size: SizeUtil.iconSize,
              )
                  : SizedBox(),
              Text(
                value.isFavorite
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
          );
        },
      ),
      padding: EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.tinySpace,
          bottom: SizeUtil.tinySpace),
      decoration: BoxDecoration(
          color: ColorUtil.primaryColor,
          borderRadius: BorderRadius.circular(SizeUtil.tinyRadius)),
    ), onTap: () {
      _favoriteProductProvider.changeFavorite(
          context, isFavorite: !_favoriteProductProvider.isFavorite,
          productId: widget.product['id']);
    },);
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _favoriteProductProvider)];
  }
}
