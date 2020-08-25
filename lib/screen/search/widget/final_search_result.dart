import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/product_item.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_gridview.dart';
import 'package:flutter/material.dart';

class FinalSearchResult extends StatelessWidget {
  final List<dynamic> products;
  final ReloadCallback reloadCallback;
  final int total;
  final bool isPickup;

  const FinalSearchResult(
      {Key key,
      @required this.products,
      @required this.reloadCallback,
      @required this.total, this.isPickup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: SizeUtil.smallPadding,
            child: Text(
              S.of(context).total_search(total),
              style: TextStyle(color: ColorUtil.primaryColor),
            ),
            color: Colors.white,
            alignment: Alignment.centerLeft,
          ),
          Container(
            height: 1,
            color: ColorUtil.primaryColor,
          ),
          Expanded(
              child: LoadMoreGridView(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            data: products,
            dataIsFull: true,
            padding: EdgeInsets.only(
                left: SizeUtil.tinySpace,
                right: SizeUtil.tinySpace,
                top: SizeUtil.tinySpace),
            reloadCallback: reloadCallback,
            totalElement: total,
            itemBuilder: (context, product, index) {
              return ProductItem(
                isPickup: isPickup,
                product: product,
                index: index,
                width: MediaQuery.of(context).size.width * 0.5,
                borderRadius: SizeUtil.tinyRadius,
                showSoldCount: true,
                nameStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                padding: EdgeInsets.only(
                    left: SizeUtil.smallSpace,
                    right: SizeUtil.smallSpace,
                    top: 0),
              );
            },
          ))
        ],
      ),
      color: ColorUtil.lineColor,
    );
  }
}
