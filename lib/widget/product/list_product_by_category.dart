import 'package:baby_garden_flutter/provider/get_list_product_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'list_horizontal_product.dart';

class ListProductByCategory extends StatefulWidget {
  final String categoryId;

  const ListProductByCategory({Key key, this.categoryId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends BaseState<ListProductByCategory> {
  GetListProductProvider _getListProductProvider = GetListProductProvider();

  @override
  void didChangeDependencies() {
    if (_getListProductProvider.products == null ||
        _getListProductProvider.products.isEmpty) {
      _getListProductProvider.clearProduct();
      _getListProductProvider.getData(context, "listProduct",
          categoryId: widget.categoryId);
    }
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Consumer<GetListProductProvider>(
      builder:
          (BuildContext context, GetListProductProvider value, Widget child) {
        if (value.products == null) return LoadingView();
        return ListHorizontalProduct(
          padding: EdgeInsets.only(top: SizeUtil.tinySpace),
          products: value.products,
        );
      },
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProductProvider)];
  }
}
