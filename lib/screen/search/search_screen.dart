import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends BaseState<SearchScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold();
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
