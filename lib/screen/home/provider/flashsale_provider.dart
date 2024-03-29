import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class FlashSaleProvider extends ChangeNotifier {
  List<dynamic> flashSales = List();
  List<dynamic> flashSalesPending = List();

  Future<void> getData() async {
    dynamic dataFlashSale = await service.listProducts(null, 'flashSales');
    dynamic dataFlashSalePending =
        await service.listProducts(null, 'flashSalesPending');
    // add check case data as emty array like list product view
    if (dataFlashSale != null && dataFlashSale['list'] != null) {
      flashSales = dataFlashSale['list'];
    }
    if (dataFlashSalePending != null && dataFlashSalePending['list'] != null) {
      flashSalesPending = dataFlashSalePending['list'];
    }
    notifyListeners();
  }

  Future<void> notifyFlashSale(BuildContext context, dynamic product) async {
    dynamic productDetail = product['product_detail'] ?? product;
    if ((productDetail['is_remind'] ?? 0).toString() == '1') {
      await service.deleteNotifyFlashSales(context, productId: productDetail['id']);
    } else {
      await service.addNotifyFlashSales(context, productId: productDetail['id']);
    }
    getData();
  }
}
