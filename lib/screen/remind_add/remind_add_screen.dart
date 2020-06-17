import 'package:baby_garden_flutter/data/model/product.dart';
import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/favorite_product/item/product_favorite_seen_item.dart';
import 'package:baby_garden_flutter/screen/remind_add/dialog/remind_add_dialog.dart';
import 'package:baby_garden_flutter/screen/remind_add/view_model/reminder_add_view_model.dart';
import 'package:baby_garden_flutter/screen/remind_management/widget/reminder_layout.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class RemindAddScreen extends StatefulWidget {
  final RemindCalendar remindCalendar;

  const RemindAddScreen({Key key, this.remindCalendar}) : super(key: key);

  @override
  _RemindAddScreen createState() => _RemindAddScreen();
}

class _RemindAddScreen
    extends BaseStateModel<RemindAddScreen, ReminderAddViewModel> {
  var remindBuy = false;
  var remindUsed = false;
  final ValueNotifier<Product> _productController = ValueNotifier(null);
  RemindCalendar _remindCalendar = RemindCalendar();

  bool visible = false;

  @override
  void initState() {
    if (widget.remindCalendar != null) {
      _remindCalendar = widget.remindCalendar;
      _productController.value = Product();
      _productController.value.id = widget.remindCalendar.productId;
      _productController.value.name = widget.remindCalendar.productName;
      _productController.value.image = [widget.remindCalendar.image];
      _productController.value.priceDiscount = widget.remindCalendar.price;
      _productController.value.price = widget.remindCalendar.price;
    }
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).remindManage,
      ),
      body: ListView(children: <Widget>[
        widget.remindCalendar != null
            ? SizedBox()
            : Container(
                decoration: setBorder('bottom', ColorUtil.darkGray, 1),
                padding: const EdgeInsets.all(SizeUtil.smallSpace),
                child: InkWell(
                  onTap: () {
                    showPopupChooseProduct(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add,
                          color: ColorUtil.primaryColor,
                          size: SizeUtil.iconSizeBig),
                      SizedBox(width: SizeUtil.smallSpace),
                      Expanded(
                        child: Text(S.of(context).selectRemindProduct,
                            style: TextStyle(
                                color: ColorUtil.darkGray,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
        ValueListenableBuilder<Product>(
          valueListenable: _productController,
          builder: (BuildContext context, Product product, Widget child) {
            if (product != null) {
              return ProductItem(product: product);
            }
            return SizedBox();
          },
        ),
        ReminderLayout(
          remindCalendar: widget.remindCalendar,
          reminderSelectCallBack:
              (type, buyDate, endDate, period, time1, time2, time3, time4) {
            _remindCalendar.type =
                type == 1 ? RemindType.remindBuy : RemindType.remindUse;
            _remindCalendar.dateStart = DateUtil.formatNormalDateTime(buyDate);
            _remindCalendar.timeStart = DateUtil.formatTime(buyDate);
            _remindCalendar.dateEnd = DateUtil.formatNormalDateTime(endDate);
            _remindCalendar.timeEnd = DateUtil.formatTime(endDate);
            _remindCalendar.period = period.toString();
            _remindCalendar.time1 = DateUtil.formatTime(time1);
            _remindCalendar.time2 = DateUtil.formatTime(time2);
            _remindCalendar.time3 = DateUtil.formatTime(time3);
            _remindCalendar.time4 = DateUtil.formatTime(time4);
          },
        ),
        SizedBox(height: 50)
      ]),
      bottomNavigationBar: Padding(
          padding: SizeUtil.normalPadding,
          child: MyRaisedButton(
            padding: SizeUtil.normalPadding,
            borderRadius: SizeUtil.tinyRadius,
            matchParent: true,
            onPressed: () {
              if (!validateInput()) {
                WidgetUtil.showErrorDialog(
                    context, S.of(context).choose_product);
                return;
              }
              getViewModel().addNewCalendar(context, calendar: _remindCalendar);
            },
            color: ColorUtil.primaryColor,
            text: widget.remindCalendar == null
                ? S.of(context).addReminder
                : S.of(context).editReminder,
            textStyle: TextStyle(
                fontSize: SizeUtil.textSizeBigger, color: Colors.white),
          )),
    );
  }

  bool validateInput() {
    // add more condition after
    return _productController.value != null;
  }

  Future<void> showPopupChooseProduct(BuildContext context) async {
    Product _product = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => AddRemindDialogScreen(
              type: _remindCalendar == null ||
                      _remindCalendar.type == RemindType.remindBuy
                  ? "1"
                  : "2",
            ));
    _productController.value = _product;
    if (_product != null) _remindCalendar.productId = _product.id;
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }

  @override
  ReminderAddViewModel initViewModel() {
    return ReminderAddViewModel(context);
  }
}
