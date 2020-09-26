import 'dart:async';

import 'package:baby_garden_flutter/data/dynamic_link_service.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/list_introduct_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/screen/welcome_guide/welcome_guide_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/hobo_text.dart';
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
  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await Provider.of<ListIntroductionProvider>(context).getIntroduction();
    bool isFirstOpen =
        await ShareValueProvider.shareValueProvider.firstOpened();
    if (!isFirstOpen) {
      pushReplacement(WelcomeGuideScreen());
    } else {
      pushReplacement(MainScreen(
        getPromotion: true,
      ));
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: SizeUtil.hugSpace),
            Image.asset("photo/logo.png",
                width: MediaQuery.of(context).size.width / 3),
            HoboText(
              fontSize: 22,
            ),
            SizedBox(height: SizeUtil.defaultSpace),
            Text(S.of(context).welcome_title,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
            Expanded(
              child: Padding(
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
    return [];
  }
}
