import 'dart:io';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_index_provider.dart';
import 'package:baby_garden_flutter/screen/account_manage/account_manage_screen.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/child_heath/provider/change_mode_enter_heath_provider.dart';
import 'package:baby_garden_flutter/screen/child_heath/provider/get_baby_test_result_provider.dart';
import 'package:baby_garden_flutter/screen/child_heath/provider/get_list_baby_provider.dart';
import 'package:baby_garden_flutter/screen/child_heath/provider/get_product_test_provider.dart';
import 'package:baby_garden_flutter/screen/child_heath/view_model/child_health_view_model.dart';
import 'package:baby_garden_flutter/screen/child_heath/widget/child_header.dart';
import 'package:baby_garden_flutter/screen/child_heath/widget/enter_weight_height.dart';
import 'package:baby_garden_flutter/screen/child_heath/widget/view_weight_height.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'dialog/check_child_info_dialog.dart';

class ChildHeathScreen extends StatefulWidget {
  final String selectedChildId;

  const ChildHeathScreen({Key key, this.selectedChildId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChildHeathState();
  }
}

class _ChildHeathState
    extends BaseStateModel<ChildHeathScreen, ChildHealthViewModel> {
  final ValueNotifier<dynamic> _dropdownController = ValueNotifier(null);
  final ValueNotifier<File> _imageController = ValueNotifier(null);
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final ChangeModeEnterHeathProvider _changeModeEnterHeathProvider =
      ChangeModeEnterHeathProvider();
  final ChangeIndexProvider _changeIndexProvider = ChangeIndexProvider();
  final GetListBabyProvider _getListBabyProvider = GetListBabyProvider();
  final GetBabyTestResultProvider _getBabyTestResultProvider =
      GetBabyTestResultProvider();
  final GetProductTestProvider _getProductTestProvider =
      GetProductTestProvider();

  @override
  void initState() {
    super.initState();
    _getListBabyProvider.listBaby(
        dropdownController: _dropdownController,
        selectedId: widget.selectedChildId,
        onChangeChild: () {
          _loadTestResults();
        });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Consumer<GetListBabyProvider>(
      builder: (BuildContext context, GetListBabyProvider listBabyProvider,
          Widget child) {
        if (listBabyProvider.babies == null ||
            listBabyProvider.babies.isEmpty) {
          return Scaffold(
            body: LoadingView(
                isNoData: listBabyProvider.babies != null,
                showButton: true,
                buttonLabel: S.of(context).addChild,
                onReload: () {
                  pushReplacement(AccountManageScreen());
                },
                title: S.of(context).no_child),
            appBar: getAppBar(title: S.of(context).healthIndex),
          );
        }
        return Scaffold(
          appBar: getAppBar(title: S.of(context).weight_height),
          body: NestedScrollView(headerSliverBuilder: (context, isScrollInner) {
            return [
              SliverAppBar(
                floating: true,
                elevation: 0,
                backgroundColor: ColorUtil.primaryColor,
                leading: SizedBox(
                  width: 0,
                ),
                expandedHeight:
                    Provider.of<AppProvider>(context).childHeightBar,
                flexibleSpace: ValueListenableBuilder(
                    valueListenable: _dropdownController,
                    builder: (context, selected, child) {
                      return ChildHeader(
                        isBoy: isBoy(),
                        dropdownController: _dropdownController,
                        selectedChildId: widget.selectedChildId,
                        onChangeChild: (selected) {
                          _loadTestResults();
                        },
                      );
                    }),
                bottom: PreferredSize(
                    child: Consumer<ChangeModeEnterHeathProvider>(
                      builder: (BuildContext context,
                          ChangeModeEnterHeathProvider value, Widget child) {
                        if (value.isEntering) return SizedBox();
                        return Consumer<ChangeIndexProvider>(
                          builder: (BuildContext context,
                              ChangeIndexProvider value, Widget child) {
                            _loadTestResults();
                            return Row(
                              children: <Widget>[
                                getTab(text: S.of(context).height, index: 0),
                                getTab(text: S.of(context).weight, index: 1)
                              ],
                            );
                          },
                        );
                      },
                    ),
                    preferredSize: Size.fromHeight(60)),
              ),
            ];
          }, body: Consumer<ChangeModeEnterHeathProvider>(
            builder: (BuildContext context, ChangeModeEnterHeathProvider value,
                Widget child) {
              if (value.isEntering) {
                return EnterWeightHeight(
                  heightController: _heightController,
                  weightController: _weightController,
                  noteController: _noteController,
                  imageController: _imageController,
                );
              }
              return Consumer<GetBabyTestResultProvider>(
                builder: (BuildContext context, GetBabyTestResultProvider value,
                    Widget child) {
                  return ViewWeightHeight(
                    testResults: value.results,
                    baby: _dropdownController.value,
                  );
                },
              );
            },
          )),
          bottomNavigationBar: Padding(
            padding: SizeUtil.normalPadding,
            child: MyRaisedButton(
              onPressed: () {
                if (_dropdownController.value == null) return;
                if (_changeModeEnterHeathProvider.isEntering) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CheckChildInfoDialog(
                            height: _heightController.text,
                            weight: _weightController.text,
                            note: _noteController.text,
                            image: _imageController.value,
                            onDonePress: () async {
                              bool success = await getViewModel().addTest(
                                  babyId: _dropdownController.value['id'],
                                  height: _heightController.text,
                                  weight: _weightController.text,
                                  note: _noteController.text,
                                  img: _imageController.value);
                              if (success)
                                _changeModeEnterHeathProvider.changeMode(false);
                            });
                      });
                } else {
                  _heightController.text = "";
                  _weightController.text = "";
                  _noteController.text = "";
                  _imageController.value = null;
                  _changeModeEnterHeathProvider.changeMode(true);
                }
              },
              color: ColorUtil.primaryColor,
              text: S.of(context).enter_weight_height.toUpperCase(),
              textStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              padding: SizeUtil.smallPadding,
            ),
          ),
        );
      },
    );
  }

  Widget getTab({String text, int index}) {
    return Expanded(
        child: InkWell(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(
              left: SizeUtil.defaultSpace, right: SizeUtil.defaultSpace),
          alignment: Alignment.center,
          padding: SizeUtil.smallPadding,
          decoration: BoxDecoration(
              color: _changeIndexProvider.index == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Text(
            text,
            style: TextStyle(
                color: _changeIndexProvider.index == index
                    ? ColorUtil.blueLight
                    : Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          _changeIndexProvider.changeIndex(index);
        },
      ),
    ));
  }

  void _loadTestResults() {
    if (_dropdownController.value == null) return;
    _getProductTestProvider.getProductTest(
        babyId: _dropdownController.value['id']);
    if (_dropdownController.value != null)
      _getBabyTestResultProvider.testResult(
          babyId: _dropdownController.value['id'],
          type: _changeIndexProvider.index + 1);
  }

  bool isBoy() {
    return _dropdownController.value != null &&
        _dropdownController.value['gender'] == '1';
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _changeModeEnterHeathProvider),
      ChangeNotifierProvider.value(value: _changeIndexProvider),
      ChangeNotifierProvider.value(value: _getListBabyProvider),
      ChangeNotifierProvider.value(value: _getBabyTestResultProvider),
      ChangeNotifierProvider.value(value: _getProductTestProvider),
    ];
  }

  @override
  ChildHealthViewModel initViewModel() {
    return ChildHealthViewModel(context);
  }
}
