import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/vcb_express/provider/vcb_express_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/vcb_express_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/vcb_express/item/express_item.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_listview.dart';
import 'package:baby_garden_flutter/widget/partner/list_service_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class VCBExpressScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VCBExpressScreenState();
  }
}

class _VCBExpressScreenState extends BaseState<VCBExpressScreen> {
  final VCBExpressProvider _vcbExpressProvider = VCBExpressProvider();

  @override
  void initState() {
    _vcbExpressProvider.getVCBExpress();
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).vcb_express.toUpperCase()),
      body: Column(
        children: <Widget>[
          ListServiceCategory(
            onChangedCategory: (category) {
              //TODO add category filter
            },
          ),
          Expanded(
            child: Consumer<VCBExpressProvider>(
              builder: (BuildContext context, VCBExpressProvider value,
                  Widget child) {
                return LoadMoreListView(
                    itemsCount:
                        value.newList != null ? value.newList.length : 0,
                    padding: EdgeInsets.all(0),
                    totalElement: value.total,
                    reloadCallback: (page) {
                      _vcbExpressProvider.getVCBExpress(
                          index: page * PAGE_SIZE);
                    },
                    itemBuilder: (context, index) {
                      return new GestureDetector(
                        child: new ExpressItem(
                          data: value.newList[index],
                        ),
                        onTap: () {
                          push(VCBExpressDetailScreen(
                              value.newList[index]['id']));
                        },
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _vcbExpressProvider)];
  }
}
