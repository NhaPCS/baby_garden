import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends BaseState<HomeScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.27,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('photo/bg_header.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(SizeUtil.bigRadius),
                    bottomRight: Radius.circular(SizeUtil.bigRadius))),
          ),
          Column(
            children: <Widget>[
              SearchBar(),
              MyCarouselSlider(
                height: MediaQuery.of(context).size.height * 0.22,
                images: [
                  StringUtil.dummyImage,
                  StringUtil.dummyImage,
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
