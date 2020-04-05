import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:provider/provider.dart';

import 'get_product_category_provider.dart';

class GetProductDetailProvider extends ChangeNotifier {
  dynamic product;
  List<dynamic> DETAIL_INFO = List();

  Future<void> getProduct(BuildContext context, String productId) async {
    dynamic data = await service.productDetail(context, productId: productId);
    product = data;
    if(product!=null) {
      if(product['color'] == null){
        DETAIL_INFO.removeWhere((element) => element['key']=='color');
      }
      if(product['size'] == null){
        DETAIL_INFO.removeWhere((element) => element['key']=='size');
      }
    }
    notifyListeners();
  }

  bool isOutStock() {
    return product == null ||
        product['number'] == null ||
        product['number_sales'] == null ||
        int.parse(product['number']) - int.parse(product['number_sales']) <= 0;
  }

  String getValueByKey(BuildContext context, String key) {
    if (key.contains("category")) {
      dynamic category = Provider.of<GetProductCategoryProvider>(context)
          .categories
          .firstWhere((element) => element['id'] == product[key]);
      if (category != null) return category['name'];
    }
    if (key == 'size' || key == 'color') {
      String value = "";
      if (product[key] != null && product[key].isNotEmpty) {
        for (dynamic s in product[key]) {
          if ('1' == s['active']) {
            value += '${s['name']} ';
          }
        }
      }
      return value;
    }
    return product[key];
  }

  void getDetailInfoKey(BuildContext context) {
    DETAIL_INFO = [
      {
        'title': S.of(context).category,
        'key': 'category_id',
        'valueColor': ColorUtil.blueLight
      },
      {
        'title': S.of(context).sku_code,
        'key': 'product_code',
      },
      {
        'title': S.of(context).brand,
        'key': 'brand',
      },
      {
        'title': S.of(context).origin,
        'key': 'original',
      },
      {
        'title': S.of(context).size,
        'key': 'size',
      },
      {
        'title': S.of(context).color,
        'key': 'color',
      },
      {
        'title': S.of(context).customer_target,
        'key': 'user_type',
      },
    ];
  }
}
