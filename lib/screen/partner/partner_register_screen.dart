import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/register_partner_view_model.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class PartnerRegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PartnerRegisterScreenState();
  }
}

class _PartnerRegisterScreenState
    extends BaseStateModel<PartnerRegisterScreen, RegisterPartnerViewModel> {
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: S.of(context).partnerRegister),
      body: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 20, left: 10, bottom: 20),
            child: Text(S.of(context).partnerRegisHeadTitle,
                style: TextStyle(color: Color.fromRGBO(84, 83, 83, 1)))),
        Expanded(
          child: Card(
            color: ColorUtil.grayEC,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(SizeUtil.smallRadius))),
            child: ListView(
              padding: EdgeInsets.only(
                  left: SizeUtil.smallSpace,
                  right: SizeUtil.smallSpace,
                  top: SizeUtil.defaultSpace,
                  bottom: SizeUtil.defaultSpace),
              children: <Widget>[
                Text(
                  S.of(context).shopName,
                  style: TextStyle(color: ColorUtil.primaryColor),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: SizeUtil.smallSpace),
                MyTextField(
                  elevation: SizeUtil.defaultElevation,
                  textEditingController: _shopNameController,
                  borderRadius: SizeUtil.tinyRadius,
                  hint: S.of(context).shopPlaceholder,
                  contentPadding: EdgeInsets.only(
                      left: SizeUtil.normalSpace,
                      top: SizeUtil.smallSpace,
                      bottom: SizeUtil.smallSpace),
                  borderColor: ColorUtil.transGray,
                ),
                SizedBox(height: SizeUtil.defaultSpace),
                Text(
                  S.of(context).mobilePhone,
                  style: TextStyle(color: ColorUtil.primaryColor),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: SizeUtil.smallSpace),
                MyTextField(
                  elevation: SizeUtil.defaultElevation,
                  textEditingController: _phoneController,
                  borderRadius: SizeUtil.tinyRadius,
                  hint: S.of(context).mobilePlaceholder,
                  contentPadding: EdgeInsets.only(
                      left: SizeUtil.normalSpace,
                      top: SizeUtil.smallSpace,
                      bottom: SizeUtil.smallSpace),
                  borderColor: ColorUtil.transGray,
                ),
                SizedBox(height: SizeUtil.defaultSpace),
                Text(
                  S.of(context).address,
                  style: TextStyle(color: ColorUtil.primaryColor),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: SizeUtil.smallSpace),
                MyTextField(
                  elevation: SizeUtil.defaultElevation,
                  textEditingController: _addressController,
                  borderRadius: SizeUtil.tinyRadius,
                  hint: S.of(context).addressPlaceholder,
                  contentPadding: EdgeInsets.only(
                      left: SizeUtil.normalSpace,
                      top: SizeUtil.smallSpace,
                      bottom: SizeUtil.smallSpace),
                  borderColor: ColorUtil.transGray,
                ),
                SizedBox(height: SizeUtil.defaultSpace),
                Text(
                  S.of(context).career,
                  style: TextStyle(color: ColorUtil.primaryColor),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: SizeUtil.smallSpace),
                MyTextField(
                  elevation: SizeUtil.defaultElevation,
                  textEditingController: _jobController,
                  borderRadius: SizeUtil.tinyRadius,
                  hint: S.of(context).careerPlaceholder,
                  contentPadding: EdgeInsets.only(
                      left: SizeUtil.normalSpace,
                      top: SizeUtil.smallSpace,
                      bottom: SizeUtil.smallSpace),
                  borderColor: ColorUtil.transGray,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: SizeUtil.smallPadding,
          child: MyRaisedButton(
            onPressed: () {
              getViewModel().registerPartner(
                  _shopNameController.text,
                  _phoneController.text,
                  _addressController.text,
                  _jobController.text);
            },
            text: S.of(context).register_partner,
            color: ColorUtil.primaryColor,
            padding: SizeUtil.normalPadding,
            borderRadius: SizeUtil.tinyRadius,
            textStyle: TextStyle(color: Colors.white),
          ),
        )
      ]),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }

  @override
  RegisterPartnerViewModel initViewModel() {
    return new RegisterPartnerViewModel(context);
  }
}
