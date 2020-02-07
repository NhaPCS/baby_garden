import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class BaseStateless extends StatelessWidget {
  Widget buildWidget(BuildContext context);

  List<SingleChildWidget> providers();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers(), child: buildWidget(context));
  }
}
