import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/voucher/voucher_detail/tab_guide_screen.dart';
import 'package:baby_garden_flutter/screen/voucher/voucher_detail/tab_image_screen.dart';
import 'package:baby_garden_flutter/screen/voucher/voucher_detail/tab_info_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../base_state.dart';
import 'tab_contact_screen.dart';

class VoucherDetailScreen extends StatefulWidget {
  @override
  _VoucherDetailScreenState createState() => _VoucherDetailScreenState();
}

class _VoucherDetailScreenState extends BaseState<VoucherDetailScreen> {
  final GetListProvider _getListProvider = GetListProvider();

  @override
  Widget buildWidget(BuildContext context) {
    final tabsBar = [
      S.of(context).information,
      S.of(context).guide,
      S.of(context).images,
      S.of(context).contact
    ];

    return MaterialApp(
      home: DefaultTabController(
        length: tabsBar.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: ColorUtil.primaryColor,
              centerTitle: true,
              title: Text(S.of(context).voucherDetail)),
          body: DefaultTabController(
            length: tabsBar.length,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(maxHeight: 150.0),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: SizeUtil.tinyRadius,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      offset: Offset(0.0, 3.0),
                    )
                  ], border: Border.all(color: ColorUtil.darkGray, width: 0.1)),
                  child: new Material(
                    color: Colors.white,
                    child: TabBar(
                      labelColor: ColorUtil.grayLine,
                      isScrollable: true,
                      indicatorColor: ColorUtil.primaryColor,
                      tabs: tabsBar.map((String tabTitle) {
                        return Tab(
                          text: tabTitle,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      TabInfoScreen(context: context, voucherIsAvailable: true),
                      TabGuideScreen(),
                      TabImageScreen(),
                      TabContactScreen(context: context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
