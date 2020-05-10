import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/vcb_express/provider/vcb_express_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/vcb_express_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/vcb_express/item/express_item.dart';
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
    // TODO: implement initState
    _vcbExpressProvider.getVCBExpress(0, 10);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).vcb_express.toUpperCase()),
      body: Column(
        children: <Widget>[
          ListServiceCategory(),
          Expanded(
            child: Consumer<VCBExpressProvider>(builder: (BuildContext context, VCBExpressProvider value, Widget child) {
              return ListView.builder(
                  itemCount: value.newList!=null?value.newList.length:0,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      child: new ExpressItem(data: value.newList[index],),
                      onTap: () {
                        push(VCBExpressDetailScreen(value.newList[index]['id']));
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
