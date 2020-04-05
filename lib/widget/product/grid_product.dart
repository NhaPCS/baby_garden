import 'package:baby_garden_flutter/data/model/section.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_product_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
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
  final String categoryId;
  final int totalCount;

  const GridProduct({
    Key key,
    @required this.section,
    this.isHome = false,
    this.categoryId,
    this.totalCount,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GridProductState();
  }
}

class _GridProductState extends BaseState<GridProduct> {
  final GetListProductProvider _getListProductProvider =
      GetListProductProvider();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if ((_getListProductProvider.products == null ||
            _getListProductProvider.products.isEmpty) &&
        widget.section != null) {
      _getListProductProvider.getData(context, widget.section.path,
          categoryId: widget.categoryId,
          numberPosts:
              widget.totalCount == null ? TOTAL_ITEMS : widget.totalCount);
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
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
          ListCategory(
            onChangedCategory: (category) {
              _getListProductProvider.getData(context, widget.section.path,
                  categoryId: category['id'], numberPosts: TOTAL_ITEMS);
            },
          ),
          Consumer<GetListProductProvider>(
            builder: (BuildContext context, GetListProductProvider value,
                Widget child) {
              print("SIZE ${value.products.length}");
              return ListHorizontalProduct(
                maxItems: widget.isHome ? value.products.length : null,
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
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProductProvider)];
  }

  String getTitle() {
    return widget.section == null ? "" : widget.section.title;
  }
}
