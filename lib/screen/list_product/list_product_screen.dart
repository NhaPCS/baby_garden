import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_product.dart';
import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_gridview.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ListProductScreen extends StatefulWidget {
  final String title;

  const ListProductScreen({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListProductState();
  }
}

class _ListProductState extends BaseState<ListProductScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(
          title: widget.title == null ? "" : widget.title.toUpperCase()),
      body: Column(
        children: <Widget>[
          ListCategory(),
          Expanded(
              child: LoadMoreGridView(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            padding: EdgeInsets.only(
                left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
            itemBuilder: (context, index) {
              return ItemProduct(
                index: index,
                width: MediaQuery.of(context).size.width * 0.5,
                borderRadius: SizeUtil.tinyRadius,
                showSoldCount: true,
                nameStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                showTime: true,
                padding: EdgeInsets.only(
                    left: SizeUtil.smallSpace,
                    right: SizeUtil.smallSpace,
                    top: 0),
              );
            },
          ))
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return null;
  }
}
