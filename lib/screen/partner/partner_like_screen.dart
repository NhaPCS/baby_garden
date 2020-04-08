import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/partner/partner_book_schedule.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/partner_item.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
// TODO-Hung: screen mới thì move ra folder mới, không để chung
class PartnerLikeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PartnerLikeScreen();
  }
}

class _PartnerLikeScreen extends BaseState<PartnerLikeScreen> {
  final ChangeCategoryProvider _changeCategoryProvider =
      ChangeCategoryProvider();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).familier_partner.toUpperCase()),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: SizeUtil.tinySpace,
          ),
          ListCategory(),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    child: new PartnerItem(),
                    onTap: () {
                      push(PartnerBookScheduleScreen());
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
    return [ChangeNotifierProvider.value(value: _changeCategoryProvider)];
  }
}
