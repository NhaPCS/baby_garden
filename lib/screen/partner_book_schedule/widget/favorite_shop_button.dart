import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class FavoriteShopButton extends StatelessWidget {
  final bool isFavorite;

  const FavoriteShopButton({Key key, this.isFavorite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            isFavorite ? S.of(context).favorited : S.of(context).favorite,
            style: TextStyle(
                color: Colors.white, fontSize: SizeUtil.textSizeDefault),
          )
        ],
      ),
      padding: EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.midSmallSpace,
          bottom: SizeUtil.midSmallSpace),
      decoration: BoxDecoration(
          color: ColorUtil.primaryColor,
          borderRadius: BorderRadius.circular(SizeUtil.tinyRadius)),
    );
  }
}
