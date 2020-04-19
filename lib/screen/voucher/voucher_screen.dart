// Thông tin nhà cung cấp

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/voucher/item/voucher_item.dart';
import 'package:baby_garden_flutter/screen/voucher/provider/get_list_voucher_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
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
  int _currentPage = 1;
  String _selectedCategoryId;

  void _loadData() {
    _getListVoucherProvider.getListVoucher(
        index: _currentPage, categoryID: _selectedCategoryId);
  }

  @override
  void didChangeDependencies() {
    if (_getListVoucherProvider.vouchers == null ||
        _getListVoucherProvider.vouchers.isEmpty) {
      _getListVoucherProvider.getListVoucher(index: 1);
    }
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).voucher.toUpperCase()),
      body: Column(
        children: <Widget>[
          ListCategory(
            onChangedCategory: (category) {
              _currentPage = 1;
              _selectedCategoryId = category == null ? null : category['id'];
              _loadData();
            },
          ),
          Expanded(
            child: Consumer<GetListVoucherProvider>(builder:
                (BuildContext context, GetListVoucherProvider value,
                    Widget child) {
              if (value.vouchers == null || value.vouchers.isEmpty)
                return LoadingView(
                  isNoData: value.vouchers != null,
                  onReload: () {
                    _currentPage = 1;
                    _loadData();
                  },
                );
              return LoadMoreListView(
                itemsCount: value.vouchers.length,
                totalPage: value.totalPage,
                reloadCallback: (page){
                  _currentPage = page;
                  _loadData();
                },
                itemBuilder: (context, index) {
                  return VoucherItem(
                    voucher: value.vouchers[index],
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
    return [ChangeNotifierProvider.value(value: _getListVoucherProvider)];
  }
}
