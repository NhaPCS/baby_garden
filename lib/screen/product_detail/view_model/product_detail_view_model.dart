import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailViewModel extends BaseViewModel {
  @override
  BuildContext context;

  ProductDetailViewModel(this.context);

  Future<void> receiveNotify({String productId, int number}) async {
    dynamic res = await service.receiveNotify(context,
        productId: productId, number: number);
    if (res != null) {
      WidgetUtil.showMessageDialog(context,
          title: S.of(context).success,
          message: S.of(context).mess_receive_notify_for_product);
    }
  }
}
