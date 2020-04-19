import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/widget/guide_tab.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/widget/image_tab.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/widget/info_tab.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../base_state.dart';
import 'widget/contact_tab.dart';

// TODO-QAnh: khong dung folder voi screen khac
class VoucherDetailScreen extends StatefulWidget {
  @override
  _VoucherDetailScreenState createState() => _VoucherDetailScreenState();
}

class _VoucherDetailScreenState extends BaseState<VoucherDetailScreen> {

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
          appBar:getAppBar(title: S.of(context).voucherDetail),
          // TODO-QAnh: duplicate DefaultTabController
          body: DefaultTabController(
            length: tabsBar.length,
            child: Column(
              children: <Widget>[
                // TODO-QAnh: dùng elevation của Material, khong cần tạo Container tạo shadow
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
                      // TODO-QAnh: không cần truyền contexxt
                      InfoTab(context: context),
                      GuideTab(),
                      ImageTab(),
                      // TODO-QAnh: không cần truyền contexxt
                      ContactTab(context: context),
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
    return [];
  }
}
