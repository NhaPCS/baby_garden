import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/partner_item.dart';
import 'package:baby_garden_flutter/provider/get_list_partner_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/partner_book_schedule_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_listview.dart';
import 'package:baby_garden_flutter/widget/partner/list_service_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

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
  final ValueNotifier<int> _pageController = ValueNotifier(0);

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
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).partner.toUpperCase()),
      body: Column(
        children: <Widget>[
          ListServiceCategory(
            onChangedCategory: (category) {
              _pageController.value = 0;
              _selectedCategoryId = category == null ? null : category['id'];
              _getListPartnerProvider.getListShops(context,
                  categoryId: _selectedCategoryId);
            },
          ),
          Expanded(
            child: Consumer<GetListPartnerProvider>(
              builder: (BuildContext context, GetListPartnerProvider value,
                  Widget child) {
                return LoadMoreListView(
                    pageController: _pageController,
                    data: value.shops,
                    totalElement: value.totalElements,
                    padding: EdgeInsets.all(0),
                    reloadCallback: (page) {
                      _getListPartnerProvider.getListShops(context,
                          categoryId: _selectedCategoryId,
                          index: page * PAGE_SIZE);
                    },
                    itemBuilder: (context, partner, index) {
                      return new GestureDetector(
                        child: new PartnerItem(
                          shop: partner,
                        ),
                        onTap: () async {
                          String userId = await ShareValueProvider
                              .shareValueProvider
                              .getUserId();
                          if (userId == null || userId.isEmpty) {
                            if (context != null) {
                              WidgetUtil.showRequireLoginDialog(context);
                            }
                            return null;
                          } else {
                            push(PartnerBookScheduleScreen(
                                shopID: partner['id']));
                          }
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
