import 'dart:async';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/welcome/welcome_guide_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Timer _timer;

  _WelcomeState() {
    _timer = new Timer(const Duration(milliseconds: 3000), () {
      pushReplacement(WelcomeGuideScreen());
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: SizeUtil.hugSpace),
            Image.asset("photo/logo.png",
                width: MediaQuery.of(context).size.width / 3),
            Text(S.of(context).app_name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontFamily: "hobo")),
            SizedBox(height: SizeUtil.defaultSpace),
            Text(S.of(context).welcome_title,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
            Expanded(
              child: Container(
                child: Image.asset("photo/welcome_1.png"),
                padding: EdgeInsets.only(
                    left: SizeUtil.largeSpace,
                    right: SizeUtil.largeSpace,
                    bottom: SizeUtil.tinySpace),
              ),
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
