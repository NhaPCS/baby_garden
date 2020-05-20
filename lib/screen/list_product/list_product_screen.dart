import 'package:baby_garden_flutter/data/model/section.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/item/product_item.dart';
import 'package:baby_garden_flutter/provider/get_list_product_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_gridview.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ListProductScreen extends StatefulWidget {
  final Section section;
  final String productId;

  const ListProductScreen({Key key, this.section, this.productId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListProductState();
  }
}

class _ListProductState extends BaseState<ListProductScreen> {
  final GetListProductProvider _getListProductProvider =
      GetListProductProvider();
  String _selectedCategoryId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if ((_getListProductProvider.products == null ||
            _getListProductProvider.products.isEmpty) &&
        widget.section != null) {
      _getListProductProvider.getData(context, widget.section.path,
          productId: widget.productId);
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: widget.section.title, upperCase: true),
      body: Column(
        children: <Widget>[
          widget.productId != null
              ? SizedBox(
                  height: SizeUtil.tinySpace,
                )
              : ListCategory(
                  onChangedCategory: (category) {
                    _selectedCategoryId =
                        category == null ? null : category['id'];
                    _getListProductProvider.getData(
                        context, widget.section.path,
                        categoryId: _selectedCategoryId,
                        productId: widget.productId);
                  },
                ),
          Expanded(child: Consumer<GetListProductProvider>(
            builder: (BuildContext context, GetListProductProvider value,
                Widget child) {
              return LoadMoreGridView(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                data: value.products,
                padding: EdgeInsets.only(
                    left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
                reloadCallback: (int page) {
                  _getListProductProvider.getData(context, widget.section.path,
                      categoryId: _selectedCategoryId,
                      index: page * PAGE_SIZE,
                      productId: widget.productId);
                },
                totalElement: value.total,
                itemBuilder: (context, product, index) {
                  return ProductItem(
                    product: product,
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
                },
              );
            },
          ))
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProductProvider)];
  }
}
