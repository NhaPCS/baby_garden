// Thông tin nhà cung cấp

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/voucher/item/voucher_item.dart';
import 'package:baby_garden_flutter/screen/voucher/provider/get_list_voucher_provider.dart';
import 'package:baby_garden_flutter/screen/voucher/provider/get_voucher_category_provider.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/voucher_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_listview.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class VoucherScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VoucherScreen();
  }
}

class _VoucherScreen extends BaseState<VoucherScreen> {
  final GetListVoucherProvider _getListVoucherProvider =
      GetListVoucherProvider();
  final GetVoucherCategoryProvider _getVoucherCategoryProvider =
      GetVoucherCategoryProvider();
  String _selectedCategoryId;
  final ValueNotifier<int> _pageController = ValueNotifier(0);

  void _loadData() {
    _getListVoucherProvider.getListVoucher(categoryID: _selectedCategoryId);
  }

  @override
  void initState() {
    super.initState();
    _getVoucherCategoryProvider.getCategories();
    _getListVoucherProvider.getListVoucher();
  }


  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).voucher.toUpperCase()),
      body: Column(
        children: <Widget>[
          Consumer<GetVoucherCategoryProvider>(
            builder: (context, value, child) {
              return ListCategory(
                categories: value.categories,
                onChangedCategory: (category) {
                  _pageController.value = 0;
                  _selectedCategoryId =
                      category == null ? null : category['id'];
                  _loadData();
                },
              );
            },
          ),
          Expanded(
            child: Consumer<GetListVoucherProvider>(builder:
                (BuildContext context, GetListVoucherProvider value,
                    Widget child) {
              return LoadMoreListView(
                pageController: _pageController,
                data: value.vouchers,
                totalElement: value.totalElements,
                reloadCallback: (page) {
                  _loadData();
                },
                itemBuilder: (context, voucher, index) {
                  return VoucherItem(
                    voucher: voucher,
                    onItemClick: () async {
                      dynamic rs = await RouteUtil.push(
                          context,
                          VoucherDetailScreen(
                            voucher: voucher,
                          ));
                      _loadData();
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _getListVoucherProvider),
      ChangeNotifierProvider.value(value: _getVoucherCategoryProvider),
    ];
  }
}
