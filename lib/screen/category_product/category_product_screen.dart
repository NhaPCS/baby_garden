import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/product_item.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_parent_category_provider.dart';
import 'package:baby_garden_flutter/provider/get_list_product_provider.dart';
import 'package:baby_garden_flutter/provider/get_main_category_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/category_product/provider/get_product_category_by_parent_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/delegate/sliver_category_delegate.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_nested_scrollview.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:baby_garden_flutter/widget/product/list_parent_category.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class CategoryProductScreen extends StatefulWidget {
  final String selectedCategoryId;
  final String selectedParentId;

  const CategoryProductScreen(
      {Key key, this.selectedCategoryId, this.selectedParentId})
      : super(key: key);

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
    if (widget.selectedParentId != null) {
      int selectedIndex = Provider.of<GetMainCategoryProvider>(context)
          .categories
          .indexWhere((element) => element['id'] == widget.selectedParentId);
      if (selectedIndex >= 0) {
        _changeParentCategoryProvider.index = selectedIndex;
      }
    } else {_loadBigCategoryAt(0);}
  }

  _loadBigCategoryAt(int index) {
    dynamic parentCategory =
        Provider.of<GetMainCategoryProvider>(context).categories[index];
    if(parentCategory==null) return;
    _changeParentCategoryProvider.selectCategory(0, parentCategory['id']);
    _page = 0;
    if (parentCategory != null) {
      _selectedParentId = parentCategory['id'];
      _selectedCategoryId = null;
      _selectSubCategoryController.value = 0;
    }
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
            if(_listProducts==null || _listProducts.isEmpty) return LoadingView(isNoData: true);
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
                        _selectedCategoryId = null;
                        _selectSubCategoryController.value = 0;
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
                  Consumer<ChangeParentCategoryProvider>(
                builder: (BuildContext context,
                    ChangeParentCategoryProvider value, Widget child) {
                  _selectSubCategoryController.value = value.index;
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
    ];
  }
}
