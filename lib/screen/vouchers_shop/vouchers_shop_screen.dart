import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/voucher/item/voucher_item.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/voucher_detail_screen.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/widget/shop_info.dart';
import 'package:baby_garden_flutter/screen/vouchers_shop/provider/get_shop_list_vouchers_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class VoucherShopScreen extends StatefulWidget {
  final String shopId;
  final dynamic shopInfo;

  const VoucherShopScreen({Key key, this.shopId, this.shopInfo})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VoucherShopScreen();
  }
}

class _VoucherShopScreen extends BaseState<VoucherShopScreen> {
  final GetShopListVoucherProvider _getShopListVoucherProvider =
      GetShopListVoucherProvider();

  void _loadData() {
    _getShopListVoucherProvider.getListShopVouchers(shopId: widget.shopId);
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).provider_info),
      body: Column(
        children: <Widget>[
          Container(
            padding: SizeUtil.tinyPadding,
            margin: EdgeInsets.only(top: SizeUtil.smallSpace),
            child: ShopInfo(
              shop: widget.shopInfo
            ),
            color: Colors.white,
          ),
          Expanded(
            child: Consumer<GetShopListVoucherProvider>(builder:
                (BuildContext context, GetShopListVoucherProvider value,
                    Widget child) {
              return ListView.builder(
                  itemCount: value.vouchers == null ? 0 : value.vouchers.length,
                  itemBuilder: (context, index) {
                    return VoucherItem(
                      voucher: value.vouchers[index],
                      hideStatus: true,
                      onItemClick: () async {
                        RouteUtil.push(
                            context,
                            VoucherDetailScreen(
                                voucher: value.vouchers[index]));
                      },
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getShopListVoucherProvider)];
  }
}
