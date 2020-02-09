import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends BaseState<WelcomeScreen> {
  final GetListProvider _getListProvider = GetListProvider();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: SizeUtil.defaultSpace),
            Image.asset("photo/logo.png",width: MediaQuery.of(context).size.width*1/3),
            Text(S.of(context).app_name,textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontFamily: "hobo")),
            SizedBox(height: SizeUtil.defaultSpace),
            Text(S.of(context).welcome_title,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
            SizedBox(height: SizeUtil.hugSpace),
            Expanded(
                child: Image.asset("photo/welcome_1.png")
            )
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
