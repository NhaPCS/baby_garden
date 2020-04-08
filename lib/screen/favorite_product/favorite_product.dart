import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/favorite_product/product_card.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

// TODO-QAnh: tên screen phải có chữ Screen ở cuối
class FavoriteProduct extends StatefulWidget {
  @override
  _FavoriteProduct createState() => _FavoriteProduct();
}

class _FavoriteProduct extends BaseState<FavoriteProduct> {
  final GetListProvider _getListProvider = GetListProvider();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).favoriteProduct),
        // TODO-QAnh: cái này là list, phải dùng ListView
        body: Column(children: <Widget>[
          // TODO-QAnh:bỏ container đi, cố gắng không để thừa Widget như này
          Container(
            // TODO-QAnh: trên có column rồi nhưng bên dưới vẫn để column?
            child: Column(
              children: <Widget>[
                ProductCard(
                  onTap: () {
                    push(ProductDetailScreen());
                  },
                  image: "photo/sample_product.png",
                  description: "Sữa Alene dành cho bé thể tích 320ml...",
                  price: "900000",
                  datetime: "13/2/2020",
                  favorite: true,
                ),
                ProductCard(
                  onTap: () {
                    push(ProductDetailScreen());
                  },
                  image: "photo/sample_product.png",
                  description: "Sữa Alene dành cho bé thể tích 320ml...",
                  price: "900000",
                  datetime: "13/2/2020",
                  favorite: true,
                ),
                ProductCard(
                  onTap: () {
                    push(ProductDetailScreen());
                  },
                  image: "photo/sample_product.png",
                  description: "Sữa Alene dành cho bé thể tích 320ml...",
                  price: "900000",
                  datetime: "13/2/2020",
                  favorite: true,
                )
              ],
            ),
          ),
        ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
