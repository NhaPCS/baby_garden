import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/provider/like_shop_provider.dart';
import 'package:baby_garden_flutter/screen/product_detail/provider/favorite_product_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class FavoriteShopButton extends StatefulWidget {
  final bool isFavorite;
  final String shopId;
  const FavoriteShopButton({Key key, this.isFavorite, this.shopId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends BaseState<FavoriteShopButton> {
  final LikeShopProvider _favoriteShopProvider = LikeShopProvider();

  @override
  void initState() {
    _favoriteShopProvider.isliked = widget.isFavorite;
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return InkWell(child: Container(
      child: Consumer<LikeShopProvider>(
        builder: (BuildContext context, LikeShopProvider value,
            Widget child) {
          return Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: SizeUtil.tinySpace,
            children: <Widget>[
              value.isliked ? Icon(
                Icons.done, color: Colors.white,
                size: SizeUtil.iconSize,
              ) : SizedBox(),
              Text(
                value.isliked
                    ? S.of(context).favorited
                    : S.of(context).favorite,
                style: TextStyle(
                    color: Colors.white, fontSize: SizeUtil.textSizeDefault),
              )
            ],
          );
        },
      ),
      padding: EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.midSmallSpace,
          bottom: SizeUtil.midSmallSpace),
      decoration: BoxDecoration(
          color: ColorUtil.primaryColor,
          borderRadius: BorderRadius.circular(SizeUtil.tinyRadius)),
    ), onTap: () {
      _favoriteShopProvider.changeFavorite(
          context, isFavorite: !_favoriteShopProvider.isliked,
          shopID: widget.shopId);
    },);
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _favoriteShopProvider)];
  }
}
