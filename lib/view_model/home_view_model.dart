import 'package:baby_garden_flutter/data/model/section.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  @override
  BuildContext context;
  List<dynamic> HOME_CATEGORIES = List();
  List<Section> SECTIONS = new List();

  HomeViewModel(this.context);

  @override
  void onDidChangeDependencies() {
    if (HOME_CATEGORIES == null || HOME_CATEGORIES.isEmpty)
      HOME_CATEGORIES = [
        {'icon': 'photo/ic_category.png', 'title': S
            .of(context)
            .category},
        {'icon': 'photo/ic_partner.png', 'title': S
            .of(context)
            .partner},
        {'icon': 'photo/ic_voucher.png', 'title': S
            .of(context)
            .voucher},
        {
          'icon': 'photo/ic_vcb_express.png',
          'title': S
              .of(context)
              .vcb_express
        },
        {'icon': 'photo/ic_health.png', 'title': S
            .of(context)
            .heath_number}
      ];
    if (SECTIONS == null || SECTIONS.isEmpty) {
      SECTIONS = [
        Section(title: S
            .of(context)
            .home_new_products, path: 'newProduct'),
        Section(title: S
            .of(context)
            .home_hot_products, path: 'hotProduct'),
        Section(title: S
            .of(context)
            .home_discount_products, path: 'discountProduct')
      ];
    }
    super.onDidChangeDependencies();
  }
}
