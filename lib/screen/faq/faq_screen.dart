import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nested/nested.dart';

class FaqScreen extends StatefulWidget {
  final dynamic question;

  const FaqScreen({Key key, this.question}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FaqState();
  }
}

class _FaqState extends BaseState<FaqScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: S.of(context).faq),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: SizeUtil.defaultPadding,
            child: MyText(
              widget.question['title'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: SizeUtil.defaultPadding,
            child: Html(
                data: widget.question == null ||
                        widget.question['content'] == null
                    ? ''
                    : widget.question['content']),
          ))
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
