import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_partner_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/partner_book_schedule_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:baby_garden_flutter/widget/partner/list_service_category.dart';
import 'package:baby_garden_flutter/item/partner_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
// TODO-Hung: screen mới thì move ra folder mới, không để chung
class PartnerListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PartnerListScreenState();
  }
}

class _PartnerListScreenState extends BaseState<PartnerListScreen> {
  final GetListPartnerProvider _getListPartnerProvider =
      GetListPartnerProvider();
  String _selectedCategoryId;

  @override
  void didChangeDependencies() {
    if (_getListPartnerProvider.shops == null ||
        _getListPartnerProvider.shops.isEmpty) {
      _getListPartnerProvider.getListShops(context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    String categoryName="";
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).partner.toUpperCase()),
      body: Column(
        children: <Widget>[
          ListServiceCategory(
            onChangedCategory: (category) {
              _selectedCategoryId = category == null ? null : category['id'];
              categoryName = category == null ?"Tất cả":category['name'];
              _getListPartnerProvider.getListShops(context,
                  categoryId: _selectedCategoryId);
            },
          ),
          Expanded(
            child: Consumer<GetListPartnerProvider>(
              builder: (BuildContext context, GetListPartnerProvider value,
                  Widget child) {
                if (value.shops == null || value.shops.isEmpty)
                  return LoadingView(
                    isNoData: value.shops != null,
                    onReload: (){
                      _getListPartnerProvider.getListShops(context, categoryId: _selectedCategoryId);
                    },
                  );
                return ListView.builder(
                    itemCount: value.shops.length,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return new GestureDetector(
                        child: new PartnerItem(
                          shop: value.shops[index],
                        ),
                        onTap: () {
                          push(PartnerBookScheduleScreen(value.shops[index]['id'],value.shops[index]['name'],categoryName));
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