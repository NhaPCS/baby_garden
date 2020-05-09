import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/point_management/item/point_card_item.dart';
import 'package:baby_garden_flutter/screen/point_management/provider/point_manage_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class PointManagementScreen extends StatefulWidget {
  @override
  _PointManagementScreen createState() => _PointManagementScreen();
}

class _PointManagementScreen extends BaseState<PointManagementScreen> {
  final PointManageProvider _pointManageProvider = PointManageProvider();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_pointManageProvider.pointList == null ||
        _pointManageProvider.pointList.isEmpty) {
      _pointManageProvider.getPointList(context);
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).pointManage),
        body: Consumer<PointManageProvider>(
          builder: (context, value, child) {
            if (value.pointList == null || value.pointList.isEmpty)
              return LoadingView(
                isNoData: value.pointList != null,
              );
            return Column(
              children: [
                WidgetUtil.getLine(
                    margin: EdgeInsets.all(0),
                    width: 5,
                    color: ColorUtil.lineLightGray),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.pointList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      final pointInfo = _pointManageProvider.getPoint(index);
                      return PointCardItem(
                        pointInfo: pointInfo,
                      );
                    }),
              ],
            );
          },
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _pointManageProvider)];
  }
}
