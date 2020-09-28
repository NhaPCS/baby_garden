import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/vcb_express/provider/vcb_express_categories_provider.dart';
import 'package:baby_garden_flutter/screen/vcb_express/provider/vcb_express_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/vcb_express_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/vcb_express/item/express_item.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_listview.dart';
import 'package:baby_garden_flutter/widget/partner/list_service_category.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
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
  final VCBExpressCategoriesProvider _categoriesProvider =
      VCBExpressCategoriesProvider();
  final ValueNotifier<int> _pageController = ValueNotifier(0);
  String _selectedCategoryId;

  @override
  void initState() {
    _vcbExpressProvider.getVCBExpress();
    _categoriesProvider.getCategories();
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).vcb_express.toUpperCase()),
      body: Column(
        children: <Widget>[
          Consumer<VCBExpressCategoriesProvider>(
            builder: (context, value, child){
              return ListCategory(
                categories: value.categories,
                onChangedCategory: (category) {
                  _pageController.value = 0;
                  _selectedCategoryId = category == null ? null : category['id'];
                  _vcbExpressProvider.getVCBExpress(
                      categoryId: _selectedCategoryId);
                },
              );
            },
          ),
          Expanded(
            child: Consumer<VCBExpressProvider>(
              builder: (BuildContext context, VCBExpressProvider value,
                  Widget child) {
                return LoadMoreListView(
                    pageController: _pageController,
                    data: value.newList,
                    padding: EdgeInsets.all(0),
                    totalElement: value.total,
                    reloadCallback: (page) {
                      _vcbExpressProvider.getVCBExpress(
                          index: page * PAGE_SIZE,
                          categoryId: _selectedCategoryId);
                    },
                    itemBuilder: (context, news, index) {
                      return new GestureDetector(
                        child: new ExpressItem(
                          data: news,
                        ),
                        onTap: () {
                          push(VCBExpressDetailScreen(news['id']));
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
    return [
      ChangeNotifierProvider.value(value: _vcbExpressProvider),
      ChangeNotifierProvider.value(value: _categoriesProvider),
    ];
  }
}
