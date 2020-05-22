import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/remind_add/remind_add_screen.dart';
import 'package:baby_garden_flutter/screen/remind_management/item/remind_card_item.dart';
import 'package:baby_garden_flutter/screen/remind_management/provider/remind_calendar_provider.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class RemindManagementScreen extends StatefulWidget {
  @override
  _RemindManageState createState() => _RemindManageState();
}

class _RemindManageState extends BaseState<RemindManagementScreen> {
  final RemindCalendarProvider _remindCalendarProvider =
      RemindCalendarProvider();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if ((_remindCalendarProvider.remindList == null ||
        _remindCalendarProvider.remindList.isEmpty)) {
      _remindCalendarProvider.getListCalendar(context);
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.add_circle, size: 24, color: Colors.white),
              onPressed: () async {
                bool added = await push(RemindAddScreen());
                if (added != null && added) {
                  _remindCalendarProvider.getListCalendar(context);
                }
              },
            ),
          ],
          title: S.of(context).remindManage,
        ),
        body: Consumer<RemindCalendarProvider>(
          builder: (context, value, child) {
            if (value.remindList == null || value.remindList.isEmpty)
              return LoadingView(
                isNoData: value.remindList != null,
              );
            return ListView.builder(
                shrinkWrap: true,
                itemCount: value.remindList.length,
                itemBuilder: (BuildContext context, int index) {
                  final _calendar =
                      RemindCalendar().fromJson(value.remindList[index]);
                  return RemindCardItem(
                    calendar: _calendar,
                    onEdit: () async {
                      bool added = await push(RemindAddScreen(remindCalendar: _calendar,));
                      if (added != null && added) {
                        _remindCalendarProvider.getListCalendar(context);
                      }
                    },
                  );
                });
          },
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _remindCalendarProvider)];
  }
}
