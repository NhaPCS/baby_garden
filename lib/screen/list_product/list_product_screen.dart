import 'package:baby_garden_flutter/data/model/section.dart';
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

  const ListProductScreen({Key key, this.section}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListProductState();
  }
}

class _ListProductState extends BaseState<ListProductScreen> {
  final GetListProductProvider _getListProductProvider =
      GetListProductProvider();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if ((_getListProductProvider.products == null ||
            _getListProductProvider.products.isEmpty) &&
        widget.section != null) {
      _getListProductProvider.getData(context, widget.section.path);
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: widget.section.title, upperCase: true),
      body: Column(
        children: <Widget>[
          ListCategory(
            onChangedCategory: (category) {
              _getListProductProvider.getData(context, widget.section.path,
                  categoryId: category == null ? null : category['id']);
            },
          ),
          Expanded(child: Consumer<GetListProductProvider>(
            builder: (BuildContext context, GetListProductProvider value,
                Widget child) {
              if (value.products == null || value.products.isEmpty)
                return LoadingView(
                  isNoData: value.products != null,
                );
              return LoadMoreGridView(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                itemsCount: value.products == null ? 0 : value.products.length,
                padding: EdgeInsets.only(
                    left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
                reloadCallback: (int page) {
                  _getListProductProvider.getData(context, widget.section.path,
                      index: page);
                },
                totalPage: value.total,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: value.products[index],
                    index: index,
                    width: MediaQuery.of(context).size.width * 0.5,
                    borderRadius: SizeUtil.tinyRadius,
                    showSoldCount: true,
                    nameStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    showTime: false,
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
