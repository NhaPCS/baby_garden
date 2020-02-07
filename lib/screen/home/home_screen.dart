import 'package:baby_garden_flutter/screen/base_state.dart';
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
      appBar: getAppBar(title: "Home"),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
