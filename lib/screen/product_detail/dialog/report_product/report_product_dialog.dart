import 'dart:io';

import 'package:baby_garden_flutter/data/model/param.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/product_detail/provider/get_report_title_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/product_detail/view_model/report_product_view_model.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/input/pick_image_text_field.dart';
import 'package:baby_garden_flutter/widget/list/wrap_chip_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'enter_another_title.dart';

// ignore: must_be_immutable

class ReportProductDialog extends StatefulWidget {
  final String productId;

  const ReportProductDialog({Key key, this.productId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReportProductState();
  }
}

class _ReportProductState
    extends BaseStateModel<ReportProductDialog, ReportProductViewModel> {
  final TextEditingController _contentController = new TextEditingController();
  final TextEditingController _anotherTitleController =
      new TextEditingController();
  final GetReportTitleProvider _getReportTitleProvider =
      new GetReportTitleProvider();
  final ValueNotifier<File> _pickedImageController = ValueNotifier(null);
  final ValueNotifier<String> _selectedTitleIdController = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _getReportTitleProvider.getReportTitle();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          bottom: SizeUtil.smallSpace),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeUtil.smallRadius))),
      title: Container(
        padding: SizeUtil.smallPadding,
        decoration: BoxDecoration(
            color: ColorUtil.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeUtil.smallRadius),
                topRight: Radius.circular(SizeUtil.smallRadius))),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            BaseState.getLeading(context),
            Center(
              child: Text(
                S.of(context).send_report,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            Text(
              S.of(context).report_desc,
              style: TextStyle(
                  color: ColorUtil.textGray, fontSize: SizeUtil.textSizeSmall),
            ),
            SizedBox(
              height: SizeUtil.defaultSpace,
            ),
            Text(
              S.of(context).report_title,
              style: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontSize: SizeUtil.textSizeBigger,
                  fontWeight: FontWeight.bold),
            ),
            Consumer<GetReportTitleProvider>(
              builder: (BuildContext context, GetReportTitleProvider value,
                  Widget child) {
                return WrapChipList(
                  listData: value.data == null ? [] : value.data,
                  selectedIdController: _selectedTitleIdController,
                );
              },
            ),
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            EnterAnotherTitle(
              anotherTitleController: _anotherTitleController,
            ),
            SizedBox(
              height: SizeUtil.defaultSpace,
            ),
            PickImageTextField(
              contentController: _contentController,
              selectedImageController: _pickedImageController,
            ),
            SizedBox(
              height: SizeUtil.defaultSpace,
            ),
            Center(
              child: MyRaisedButton(
                onPressed: () {
                  if ((_anotherTitleController.text == null ||
                          _anotherTitleController.text.isEmpty) &&
                      (_selectedTitleIdController.value == null ||
                          _selectedTitleIdController.value.isEmpty) &&
                      (_contentController.text == null ||
                          _contentController.text.isEmpty) &&
                      (_pickedImageController.value == null)) {
                    WidgetUtil.showErrorDialog(
                        context, S.of(context).mess_verify_report_dialog);
                    return;
                  }
                  getViewModel().reportProduct(
                      widget.productId,
                      _anotherTitleController.text,
                      _contentController.text,
                      _selectedTitleIdController.value,
                      _pickedImageController.value);
                },
                text: S.of(context).send,
                color: ColorUtil.primaryColor,
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                padding: EdgeInsets.only(
                    left: SizeUtil.hugSpace,
                    right: SizeUtil.hugSpace,
                    top: SizeUtil.smallSpace,
                    bottom: SizeUtil.smallSpace),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getReportTitleProvider)];
  }

  @override
  initViewModel() {
    return ReportProductViewModel(context);
  }
}
