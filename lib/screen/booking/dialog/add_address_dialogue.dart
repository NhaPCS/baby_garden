import 'package:baby_garden_flutter/data/model/param.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/city_provider.dart';
import 'package:baby_garden_flutter/provider/receive_address_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/drop_down_formfield.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class AddingAddressDialogue extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddingAddressDialogueState();
  }
}

class _AddingAddressDialogueState extends BaseState<AddingAddressDialogue> {
  final TextEditingController _receiveNameController =
      new TextEditingController();
  final TextEditingController _receivePhoneController =
      new TextEditingController();
  final TextEditingController _receiveAddressController =
      new TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement build
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                border: Border.all(
                  color: ColorUtil.primaryColor,
                  width: 0.7,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: SizeUtil.midSmallSpace,
                        bottom: SizeUtil.midSmallSpace),
                    child: Text(
                      S.of(context).add_delivery_address,
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontSize: SizeUtil.textSizeExpressTitle,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  WidgetUtil.getLine(
                      margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                      color: ColorUtil.lineColor),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  MyTextField(
                    hint: S.of(context).enter_receiver_name,
                    title: S.of(context).add_receiver,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeSmall),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    textEditingController: _receiveNameController,
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: false,
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).enter_receive_phone,
                    title: S.of(context).phone,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeSmall),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    textEditingController: _receivePhoneController,
                    inputType: TextInputType.phone,
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: false,
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).enter_address,
                    title: S.of(context).delivery_address,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeSmall),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    textEditingController: _receiveAddressController,
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: false,
                    isBorder: false,
                  ),
                  Consumer<CityProvider>(
                    builder: (BuildContext context, CityProvider value,
                        Widget child) {
                      return Column(
                        children: <Widget>[
                          DropDownFormField(
                            value: value.cityVal,
                            titleText: S.of(context).province,
                            hintText: S.of(context).choose_province,
                            onChanged: (val) {
                              Provider.of<CityProvider>(context, listen: false)
                                  .onChangeCity(val);
                            },
                            dataSource: value.cities,
                            textField: 'name',
                          ),
                          DropDownFormField(
                            value: value.districtVal,
                            titleText: S.of(context).district,
                            hintText: S.of(context).choose_district,
                            onChanged: (val) {
                              Provider.of<CityProvider>(context, listen: false)
                                  .onChangeDistrict(val);
                            },
                            dataSource: value.districts,
                            textField: 'name',
                          ),
                          DropDownFormField(
                            value: value.subDistrictVal,
                            titleText: S.of(context).sub_district,
                            hintText: S.of(context).choose_sub_district,
                            onChanged: (val) {
                              Provider.of<CityProvider>(context, listen: false)
                                  .onChangeSubDistrict(val);
                            },
                            dataSource: value.districts,
                            textField: 'name',
                          )
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: CircleCheckbox(
                        onChanged: (val) {
                          Provider.of<CityProvider>(context, listen: false)
                              .onChangeDefault(val);
                        },
                        padding: const EdgeInsets.only(
                            left: SizeUtil.tinySpace,
                            right: 0,
                            top: 0,
                            bottom: 0),
                        checkBg: Icons.check_box,
                        text: Text(
                          S.of(context).set_delivery_address,
                          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                        ),
                        uncheckBg: Icons.check_box_outline_blank,
                        color: ColorUtil.gray),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(SizeUtil.smallRadius),
                        )),
                        color: ColorUtil.primaryColor,
                        child: Text(
                          S.of(context).cancel,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: SizeUtil.defaultSpace,
                      ),
                      RaisedButton(
                        onPressed: () {
                          //todo-hung add verify param
                          var provider =
                              Provider.of<CityProvider>(context, listen: false);
                          if (WidgetUtil.verifyParams(context, params: [
                            Param(
                                key: S.of(context).enter_name,
                                value: _receiveNameController.text.trim()),
                            Param(
                                key: S.of(context).phone_format,
                                value: _receivePhoneController.text.trim(),
                                checkType: CheckType.PHONE_FORMAT),
                            Param(
                                key: S.of(context).enter_address,
                                value: _receiveAddressController.text.trim()),
                            Param(
                                key: S.of(context).enter_province,
                                value: provider.cityVal),
                            Param(
                                key: S.of(context).enter_district,
                                value: provider.districtVal),
                            Param(
                                key: S.of(context).enter_sub_district,
                                value: provider.subDistrictVal),
                          ])) {
                            Provider.of<ReceiveAddressListProvider>(context,
                                    listen: false)
                                .onAddAddress(
                                    address:
                                        _receiveAddressController.text.trim(),
                                    isDefault: Provider.of<CityProvider>(
                                            context,
                                            listen: false)
                                        .isDefault,
                                    cityId: provider.cities[provider.cityVal]
                                        ['id'],
                                    districtId: provider
                                        .districts[provider.districtVal]['id'],
                                    wardId: provider.subDistricts[
                                        provider.subDistrictVal]['id'],
                                    phone: _receivePhoneController.text.trim(),
                                    name: _receiveNameController.text.trim());
                            Provider.of<CityProvider>(context, listen: false)
                                .reset();
                            Navigator.of(context).pop();
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(SizeUtil.smallRadius),
                        )),
                        color: ColorUtil.primaryColor,
                        child: Text(
                          S.of(context).add_new,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }
}
