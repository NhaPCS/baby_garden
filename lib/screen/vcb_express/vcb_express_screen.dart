import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/provider/vcb_express_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/vcb_express/vcb_express_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/expressItem.dart';
import 'package:baby_garden_flutter/widget/notify_item.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class VCBExpressScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VCBExpressScreenState();
  }
}

class _VCBExpressScreenState extends BaseState<VCBExpressScreen> {
  final VCBExpressProvider _vcbExpressProvider = VCBExpressProvider();
  @override
  void initState() {
    // TODO: implement initState
    _vcbExpressProvider.getVCBExpress(0, 10);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).vcb_express.toUpperCase()),
      body: Column(
        children: <Widget>[
          ListCategory(),
          Expanded(
            child: Consumer<VCBExpressProvider>(builder: (BuildContext context, VCBExpressProvider value, Widget child) {
              return ListView.builder(
                  itemCount: value.newList!=null?value.newList.length:0,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      child: new ExpressItem(value.newList[index]),
                      onTap: () {
                        push(VCBExpressDetailScreen());
                      },
                    );
                  });
            },),
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
