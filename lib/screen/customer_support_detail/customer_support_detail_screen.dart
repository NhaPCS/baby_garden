import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nested/nested.dart';

class CustomerSupportDetailScreen extends StatefulWidget {
  final String title;
  final String content;

  const CustomerSupportDetailScreen({Key key, this.title, this.content})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends BaseState<CustomerSupportDetailScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: widget.title),
      body: SingleChildScrollView(
        padding: SizeUtil.defaultPadding,
        child: Html(data: widget.content ?? ''),
      ),
    );
    ;
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
