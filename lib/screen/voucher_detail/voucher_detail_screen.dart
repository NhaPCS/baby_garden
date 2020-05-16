import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/provider/get_voucher_detail_provider.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/view_model/voucher_detail_view_model.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/widget/contact_tab.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/widget/guide_tab.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/widget/image_tab.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/widget/info_tab.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class VoucherDetailScreen extends StatefulWidget {
  final dynamic voucher;

  const VoucherDetailScreen({Key key, this.voucher}) : super(key: key);

  @override
  _VoucherDetailScreenState createState() => _VoucherDetailScreenState();
}

class _VoucherDetailScreenState
    extends BaseStateModel<VoucherDetailScreen, VoucherDetailViewModel> {
  final GetVoucherDetailProvider _getVoucherDetailProvider =
      GetVoucherDetailProvider();

  @override
  void initState() {
    _getVoucherDetailProvider.setVoucher(widget.voucher);
    _getVoucherDetailProvider.getVoucherDetail(widget.voucher['id']);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    final tabsBar = [
      S.of(context).information,
      S.of(context).guide,
      S.of(context).images,
      S.of(context).contact
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(title: S.of(context).voucherDetail),
      body: DefaultTabController(
        length: tabsBar.length,
        child: Column(
          children: <Widget>[
            Material(
              color: Colors.white,
              elevation: SizeUtil.smallElevation,
              child: TabBar(
                labelColor: ColorUtil.grayLine,
                isScrollable: false,
                indicatorColor: ColorUtil.primaryColor,
                labelPadding: EdgeInsets.all(0),
                tabs: tabsBar.map((String tabTitle) {
                  return Tab(
                    text: tabTitle,
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Consumer<GetVoucherDetailProvider>(
                builder: (BuildContext context, GetVoucherDetailProvider value,
                    Widget child) {
                  if (value.voucher == null) return Container();
                  return TabBarView(
                    children: [
                      InfoTab(
                        voucher: value.voucher,
                        onGetVoucherPress: () {
                          getViewModel().getCodeVoucher(value.voucher['id']);
                        },
                      ),
                      GuideTab(
                        voucher: value.voucher,
                      ),
                      ImageTab(
                        voucher: value.voucher,
                      ),
                      ContactTab(
                        voucher: value.voucher,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getVoucherDetailProvider)];
  }

  @override
  VoucherDetailViewModel initViewModel() {
    return VoucherDetailViewModel(context, _getVoucherDetailProvider);
  }
}
