import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class FavoriteShopButton extends StatefulWidget {
  final ValueNotifier<bool> isFavorite;
  final String shopId;
  final Function onPerformance;

  const FavoriteShopButton(
      {Key key, this.isFavorite, this.shopId, this.onPerformance})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends BaseState<FavoriteShopButton> {
  bool isClickable = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return InkWell(
      child: ValueListenableBuilder<bool>(
        valueListenable: widget.isFavorite,
        builder: (BuildContext context, bool value, Widget child) {
          return Container(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: SizeUtil.tinySpace,
              children: <Widget>[
                value
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                        size: SizeUtil.iconSize,
                      )
                    : SizedBox(),
                Text(
                  value ? S.of(context).favorited : S.of(context).favorite,
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
        },
      ),
      onTap: () {
        isClickable = false;
        widget.isFavorite.value = !widget.isFavorite.value;
        changeFavorite();
        print("${widget.isFavorite.value}");
      },
    );
  }

  void changeFavorite() async {
    if (widget.isFavorite.value) {
      var data = await favouriteShop(shopID: widget.shopId);
      widget.onPerformance(true, data);
      isClickable = true;
    } else {
      var data = await unFavouriteShop(shopID: widget.shopId);
      widget.onPerformance(false, data);
      isClickable = true;
    }
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
