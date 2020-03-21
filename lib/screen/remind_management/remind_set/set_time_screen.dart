import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/voucher/voucher_detail/voucher_code_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class SetTimeScreen extends StatefulWidget {
  @override
  _SetTimeScreenState createState() => _SetTimeScreenState();
}

class _SetTimeScreenState extends BaseState<SetTimeScreen> {
  final GetListProvider _getListProvider = GetListProvider();
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Column(
        children: <Widget>[Text('chọn chu kì nhắc')],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(S.of(context).confirm),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
