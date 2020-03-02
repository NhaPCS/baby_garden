import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/expressItem.dart';
import 'package:baby_garden_flutter/widget/partner_item.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class PartnerListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PartnerListScreenState();
  }

}

class _PartnerListScreenState extends BaseState<PartnerListScreen>{
  final ChangeCategoryProvider _changeCategoryProvider =
  ChangeCategoryProvider();
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).partner.toUpperCase()),
      body: Column(
        children: <Widget>[
          ListCategory(
            categoryProvider: _changeCategoryProvider,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    child: new PartnerItem(),
                    onTap: () {
//                      push(VCBExpressDetailScreen());
                    },
                  );
                }),
          )
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _changeCategoryProvider)];
  }

}