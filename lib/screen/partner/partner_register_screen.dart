import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class PartnerRegister extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PartnerRegisterState();
  }
}

class _PartnerRegisterState extends BaseState<PartnerRegister> {
  final GetListProvider _getListProvider = GetListProvider();
  var searchTextController;

  @override
  Widget buildWidget(BuildContext context) {
    final List<Map<String, String>> fields = [
      {
        'title': S.of(context).shopName,
        'placeholder': S.of(context).shopPlaceholder
      },
      {
        'title': S.of(context).mobilePhone,
        'placeholder': S.of(context).mobilePlaceholder
      },
      {
        'title': S.of(context).address,
        'placeholder': S.of(context).addressPlaceholder
      },
      {
        'title': S.of(context).career,
        'placeholder': S.of(context).careerPlaceholder
      }
    ];

    return Scaffold(
      appBar: getAppBar(title: S.of(context).partnerRegister),
      body: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 20, left: 10, bottom: 20),
            child: Text(S.of(context).partnerRegisHeadTitle,
                style: TextStyle(color: Color.fromRGBO(84, 83, 83, 1)))),
        Expanded(
          child: Container(
              margin: EdgeInsets.only(bottom: 14),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 236, 236, 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      offset: Offset(0.0, 3.0),
                    )
                  ]),
              child: Container(
                  child: ListView.builder(
                      itemCount: fields.length,
                      itemBuilder: (BuildContext context, int index) {
                        return inputField(fields[index]['title'],
                            fields[index]['placeholder']);
                      }))),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8, left: 12, right: 12),
          width: double.infinity,
          height: 46,
          // color: Color.fromRGBO(255, 142, 30, 1),
          child: RaisedButton(
            color: Color.fromRGBO(255, 142, 30, 1),
            onPressed: () async {},
            textColor: Colors.white,
            child: Text('Đăng ký trở thành đối tác',
                style: TextStyle(fontSize: 16)),
          ),
        )
      ]),
    );
  }

  Widget inputField(String title, String placeholder) {
    return Container(
      margin: EdgeInsets.only(top: 22, left: 11, right: 11),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Color.fromRGBO(255, 130, 15, 1), fontSize: 16),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 8),
            MyTextField(
              elevation: SizeUtil.defaultElevation,
              textEditingController: searchTextController,
              borderRadius: SizeUtil.tinyRadius,
              hint: placeholder,
              contentPadding: EdgeInsets.only(
                  left: SizeUtil.normalSpace,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              borderColor: Color.fromRGBO(175, 174, 174, 1),
            ),
          ]),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
