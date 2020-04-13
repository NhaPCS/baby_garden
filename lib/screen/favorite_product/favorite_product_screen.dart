import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_product_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/favorite_product/product_card.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
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
            return ListView.builder(
                shrinkWrap: true,
                itemCount: value.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final _product = _getListProductProvider.getProduct(index);
                  return ProductItem(
                    onTap: () {
                      push(ProductDetailScreen());
                    },
                    product: _product,
                  );
                });
          },
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProductProvider)];
  }
}
