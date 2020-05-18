import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/favorite_product/item/product_favorite_seen_item.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
import 'package:baby_garden_flutter/screen/remind_add/provider/remind_add_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';

import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class AddRemindDialogScreen extends StatefulWidget {
  @override
  _AddRemindDialogScreenState createState() => _AddRemindDialogScreenState();
}

class _AddRemindDialogScreenState extends BaseState<AddRemindDialogScreen> {
  final RemindAddProvider _remindAddProvider = RemindAddProvider();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if ((_remindAddProvider.products == null ||
        _remindAddProvider.products.isEmpty)) {
      _remindAddProvider.clearProduct();
      _remindAddProvider.getListRemindProducts(context);
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeUtil.bigRadius),
      ),
      title: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          S.of(context).selectRemindProduct,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorUtil.primaryColor,
      ),
      content: Consumer<RemindAddProvider>(
        builder: (context, value, child) {
          if (value.products == null || value.products.isEmpty)
            return LoadingView(
              isNoData: value.products != null,
            );
          return ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                final _product = _remindAddProvider.getProduct(index);

                return ProductItem(
                  onTap: () {
                    push(ProductDetailScreen(
                      productId: _product.id,
                    ));
                  },
                  product: _product,
                );
              });
        },
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _remindAddProvider),
    ];
  }
}
