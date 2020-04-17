import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_partner_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/partner_book_schedule_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:baby_garden_flutter/item/partner_item.dart';
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
  final GetListPartnerProvider _getListPartnerProvider =
      GetListPartnerProvider();

  @override
  void didChangeDependencies() {
    if (_getListPartnerProvider.shops == null ||
        _getListPartnerProvider.shops.isEmpty) {
      _getListPartnerProvider.getListFavouriteShop(context);
    }
    super.didChangeDependencies();
  }

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
            child: Consumer<GetListPartnerProvider>(
              builder: (BuildContext context, GetListPartnerProvider value,
                  Widget child) {
                if (value.shops == null || value.shops.isEmpty)
                  return LoadingView(
                    isNoData: value.shops != null,
                  );
                return ListView.builder(
                    itemCount: value.shops.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                        left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
                    itemBuilder: (context, index) {
                      return new GestureDetector(
                        child: new PartnerItem(shop: value.shops[index]),
                        onTap: () {
                          push(PartnerBookScheduleScreen(
                              "1", "VUON CUA BE", "Thời trang"));
//                      push(VCBExpressDetailScreen());
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
    return [ChangeNotifierProvider.value(value: _getListPartnerProvider)];
  }
}
