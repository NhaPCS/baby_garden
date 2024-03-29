import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_product_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/favorite_product/item/product_favorite_seen_item.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class FavoriteProductScreen extends StatefulWidget {
  @override
  _FavoriteProductScreen createState() => _FavoriteProductScreen();
}

class _FavoriteProductScreen extends BaseState<FavoriteProductScreen> {
  final GetListProductProvider _getListProductProvider =
      GetListProductProvider();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if ((_getListProductProvider.products == null ||
        _getListProductProvider.products.isEmpty)) {
      _getListProductProvider.getData(context, 'listFavouriteProduct');
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).favoriteProduct),
        body: Consumer<GetListProductProvider>(
          builder: (context, value, child) {
            return LoadMoreListView(
                data: value.products,
                totalElement: value.total,
                reloadCallback: (page) {
                  _getListProductProvider.getData(
                      context, 'listFavouriteProduct',
                      index: page * PAGE_SIZE);
                },
                itemBuilder:
                    (BuildContext context, dynamic product, int index) {
                  final _product = _getListProductProvider.fromJson(product,
                      isFavorite: true);

                  return _product != null
                      ? ProductFavoriteItem(
                          onTap: () {
                            push(ProductDetailScreen(
                              productId: _product.id,
                            ));
                          },
                          product: _product,
                        )
                      : SizedBox();
                });
          },
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProductProvider)];
  }
}
