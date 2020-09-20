import 'package:baby_garden_flutter/data/model/section.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_product_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/category_product/provider/get_product_category_by_parent_provider.dart';
import 'package:baby_garden_flutter/screen/list_product/list_product_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:baby_garden_flutter/widget/product/list_horizontal_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

final int TOTAL_ITEMS = 7;

class GridProduct extends StatefulWidget {
  final bool isHome;
  final Section section;
  final String parentId;
  final int totalCount;
  final int reload;

  const GridProduct({
    Key key,
    @required this.section,
    this.isHome = false,
    this.totalCount,
    this.parentId,
    this.reload,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GridProductState();
  }
}

class _GridProductState extends BaseState<GridProduct> {
  final GetListProductProvider _getListProductProvider =
      GetListProductProvider();
  final GetProductCategoryByParentProvider _getProductCategoryByParentProvider =
      new GetProductCategoryByParentProvider();
  bool checked = false;
  String subCategoryId;
  int reload;

  @override
  void initState() {
    super.initState();
  }

  _loadData() {
    if (widget.parentId != null) {
      _getProductCategoryByParentProvider.getProductCategories(widget.parentId);
    }
    _getListProductProvider.getData(null, widget.section.path,
        categoryId: subCategoryId ?? (widget.parentId != null ? '0' : null),
        parentId: widget.parentId,
        numberPosts:
            widget.totalCount == null ? TOTAL_ITEMS : widget.totalCount);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    if (widget.reload != reload) {
      print("WTF ${widget.reload} ${reload}");
      reload = widget.reload;
      _loadData();
    }
    return Consumer<GetListProductProvider>(
      builder:
          (BuildContext context, GetListProductProvider value, Widget child) {
        if ((value.products == null || value.products.isEmpty) &&
            subCategoryId == null) return SizedBox();
        return GestureDetector(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: SizeUtil.smallSpace,
                  ),
                  Expanded(
                      child: Text(
                    getTitle().toUpperCase(),
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtil.textSizeBigger),
                  )),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text(
                        S.of(context).view_more,
                        style: TextStyle(color: ColorUtil.primaryColor),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: ColorUtil.primaryColor,
                        size: SizeUtil.iconSizeBigger,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              Consumer<GetProductCategoryByParentProvider>(
                builder: (BuildContext context,
                    GetProductCategoryByParentProvider value, Widget child) {
                  return ListCategory(
                    categories:
                        widget.parentId != null ? value.categories : null,
                    onChangedCategory: (category) {
                      String selected =
                          category == null ? null : category['id'];
                      if (selected != subCategoryId) {
                        subCategoryId =
                            category == null ? null : category['id'];
                        _loadData();
                      }
                    },
                  );
                },
              ),
              Consumer<GetListProductProvider>(
                builder: (BuildContext context, GetListProductProvider value,
                    Widget child) {
                  return ListHorizontalProduct(
                    maxItems:
                        widget.isHome ? (value.products.length + 1) : null,
                    rowsCount: widget.isHome ? 1 : 2,
                    products: value.products,
                  );
                },
              ),
            ],
          ),
          onTap: () {
            RouteUtil.push(
                context,
                ListProductScreen(
                  section: widget.section,
                ));
          },
        );
      },
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _getListProductProvider),
      ChangeNotifierProvider.value(value: _getProductCategoryByParentProvider),
    ];
  }

  String getTitle() {
    return widget.section == null ? "" : widget.section.title;
  }
}
