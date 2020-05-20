import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/product_item.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_parent_category_provider.dart';
import 'package:baby_garden_flutter/provider/get_list_product_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/category_product/provider/get_product_category_by_parent_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/delegate/sliver_category_delegate.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_gridview.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_nested_scrollview.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:baby_garden_flutter/widget/product/list_parent_category.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class CategoryProductScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryProductState();
  }
}

class _CategoryProductState extends BaseState<CategoryProductScreen> {
  final ChangeParentCategoryProvider _changeParentCategoryProvider =
      ChangeParentCategoryProvider();
  final GetListProductProvider _getListProductProvider =
      new GetListProductProvider();
  final GetProductCategoryByParentProvider _getProductCategoryByParentProvider =
      GetProductCategoryByParentProvider();
  String _selectedCategoryId;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: LoadMoreNestedScrollView(body: Consumer<GetListProductProvider>(
        builder:
            (BuildContext context, GetListProductProvider value, Widget child) {
          return LoadMoreGridView(
              childAspectRatio: 0.7,
              crossAxisCount: 2,
              totalElement: value.total,
              data: value.products,
              reloadCallback: (page) {
                _getListProductProvider.getData(context, 'listProduct',
                    index: page * PAGE_SIZE);
              },
              itemBuilder: (context, item, index) {
                return ProductItem(
                  product: item,
                  index: index,
                  width: MediaQuery.of(context).size.width * 0.5,
                  borderRadius: SizeUtil.tinyRadius,
                  showSoldCount: true,
                  nameStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                  padding: EdgeInsets.only(
                      left: SizeUtil.smallSpace,
                      right: SizeUtil.smallSpace,
                      top: 0),
                );
              });
        },
      ), headerSliverBuilder: (context, isScrollInner) {
        return [
          new SliverAppBar(
            title: new Text(
              S.of(context).category_product.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            leading: BaseState.getLeading(context),
            centerTitle: true,
            pinned: true,
            floating: true,
            forceElevated: isScrollInner,
          ),
          SliverPersistentHeader(
            pinned: false,
            floating: false,
            delegate: SliverCategoryDelegate(
                ListParentCategory(
                  changeCategoryProvider: _changeParentCategoryProvider,
                  onParentCategoryChanged: (parentCategory) {
                    if (parentCategory != null)
                      _getProductCategoryByParentProvider
                          .getProductCategories(parentCategory['id']);
                    else {
                      _getProductCategoryByParentProvider
                          .getProductCategories(null);
                    }
                  },
                ),
                Provider.of<AppProvider>(context).bigCategoryHeight,
                Provider.of<AppProvider>(context).bigCategoryHeight),
          ),
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: SliverCategoryDelegate(
                Consumer<GetProductCategoryByParentProvider>(
              builder: (BuildContext context,
                  GetProductCategoryByParentProvider value, Widget child) {
                return ListCategory(
                  categories: value.categories,
                  onChangedCategory: (category) {
                    _selectedCategoryId =
                        category == null ? null : category['id'];
                    if (category != null) {
                      _getListProductProvider.getData(context, 'listProduct',
                          categoryId: _selectedCategoryId);
                    }
                  },
                );
              },
            ), Provider.of<AppProvider>(context).categoryHeight,
                Provider.of<AppProvider>(context).categoryHeight),
          )
        ];
      }, onLoadMore: () {
        //TODO
      }),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _changeParentCategoryProvider),
      ChangeNotifierProvider.value(value: _getListProductProvider),
      ChangeNotifierProvider.value(value: _getProductCategoryByParentProvider),
    ];
  }
}
