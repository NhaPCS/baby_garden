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
  final ValueNotifier<int> _selectSubCategoryController = ValueNotifier(0);
  String _selectedParentId;
  int _page = 0;
  List<dynamic> _listProducts = List();

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
      backgroundColor: ColorUtil.lineColor,
      body: LoadMoreNestedScrollView(
        body: Consumer<GetListProductProvider>(
          builder: (BuildContext context, GetListProductProvider value,
              Widget child) {
            if (_page > 0) {
              if (value.products == null || value.products.isEmpty) {
                _page--;
              } else
                _listProducts.addAll(value.products);
            } else {
              _listProducts = value.products;
            }
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7),
                itemCount: _listProducts.length,
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: _listProducts[index],
                    index: 0,
                    width: MediaQuery.of(context).size.width * 0.5,
                    borderRadius: SizeUtil.tinyRadius,
                    showSoldCount: false,
                    nameStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    padding: EdgeInsets.only(
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace,
                        top: 0),
                  );
                });
          },
        ),
        headerSliverBuilder: (context, isScrollInner) {
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
                      _page = 0;
                      if (parentCategory != null) {
                        _selectedParentId = parentCategory['id'];
                        _getProductCategoryByParentProvider
                            .getProductCategories(parentCategory['id']);
                        _selectedCategoryId = null;
                        _selectSubCategoryController.value = 0;
                      } else {
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
                    selectedController: _selectSubCategoryController,
                    categories: value.categories,
                    onChangedCategory: (category) {
                      _page = 0;
                      _selectedCategoryId =
                          category == null ? '0' : category['id'];
                      _getListProductProvider.getData(
                        context,
                        'listProduct',
                        parentId: _selectedParentId,
                        categoryId: _selectedCategoryId,
                      );
                    },
                  );
                },
              ), Provider.of<AppProvider>(context).categoryHeight,
                  Provider.of<AppProvider>(context).categoryHeight),
            )
          ];
        },
        onLoadMore: () {
          print("LOADMORE");
          _page++;
          _getListProductProvider.getData(context, 'listProduct',
              parentId: _selectedParentId,
              categoryId: _selectedCategoryId,
              index: _page * PAGE_SIZE);
        },
      ),
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
