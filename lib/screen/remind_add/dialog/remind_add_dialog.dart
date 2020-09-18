import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/favorite_product/item/product_favorite_seen_item.dart';
import 'package:baby_garden_flutter/screen/remind_add/provider/get_list_products_reminder_provider.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class AddRemindDialogScreen extends StatefulWidget {
  final RemindType type;

  const AddRemindDialogScreen({Key key, this.type})
      : super(key: key);

  @override
  _AddRemindDialogScreenState createState() => _AddRemindDialogScreenState();
}

class _AddRemindDialogScreenState extends BaseState<AddRemindDialogScreen> {
  final GetListProductsReminderProvider _remindAddProvider =
      GetListProductsReminderProvider();

  @override
  void initState() {
    super.initState();
    _remindAddProvider.getListRemindProducts(widget.type);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Consumer<GetListProductsReminderProvider>(
      builder: (context, value, child) {
        if (value.products == null || value.products.isEmpty)
          return LoadingView(
            isNoData: value.products != null,
          );
        return ListView.builder(
            shrinkWrap: true,
            itemCount: value.products.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if(index==0) {
                return  AppBar(
                  title: Text(S.of(context).choose_product,style: TextStyle(color: Colors.white),),
                  centerTitle: true,
                  leading: Container(),
                  actions: [IconButton(icon: Icon(Icons.close, color: Colors.white,), onPressed: (){
                    Navigator.of(context).pop();
                  })],
                );
              }
              final _product = _remindAddProvider.getProduct(index-1);

              return ProductFavoriteItem(
                showDate: false,
                onTap: () {
                  Navigator.of(context).pop(_product);
                },
                product: _product,
              );
            });
      },
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _remindAddProvider),
    ];
  }
}
