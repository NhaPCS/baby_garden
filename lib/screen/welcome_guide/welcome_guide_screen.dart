import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/list_introduct_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class WelcomeGuideScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeGuideScreenState();
  }
}

class _WelcomeGuideScreenState extends BaseState<WelcomeGuideScreen> {
  @override
  void didChangeDependencies() {
    ShareValueProvider.shareValueProvider.saveIsFirstOpened();
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            S.of(context).guide_title,
            style: TextStyle(fontSize: SizeUtil.textSizeBig),
          ),
          SizedBox(
            height: SizeUtil.normalSpace,
          ),
          MyCarouselSlider(
              height: MediaQuery.of(context).size.height * 2 / 3,
              width: MediaQuery.of(context).size.width * 5 / 7,
              boxFit: BoxFit.contain,
              slideBackground: Colors.transparent,
              isAssetImage: true,
              images:
                  Provider.of<ListIntroductionProvider>(context, listen: false)
                      .list
                      .map((e) => e['img'])
                      .toList(),
              indicatorActiveColor: ColorUtil.indicatorActiveColor,
              indicatorInactiveColor: ColorUtil.indicatorUnactiveColor),
          SizedBox(
            height: SizeUtil.normalSpace,
          ),
          InkWell(
            onTap: () {
              print("Yeah, this line is printed after 3 seconds");
              pushReplacement(MainScreen(
                getPromotion: true,
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(SizeUtil.tinySpace),
              child: Text(
                S.of(context).skip,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorUtil.blueForgotPass),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return null;
  }
}
