import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/city_provider.dart';
import 'package:baby_garden_flutter/screen/address_setting/provider/get_list_address_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/checkbox/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/drop_down_formfield.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class AddAddressDialog extends StatefulWidget {
//   @override
//   _AddAddressDialogState createState() => _AddAddressDialogState();
// }

class AddAddressDialog extends StatelessWidget {
  final detailCtrl = TextEditingController();
  final GetListAddressProvider _getListAddressProvider =
      GetListAddressProvider();

  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                title(context),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeUtil.midSpace, top: SizeUtil.midSpace),
                  child: Text(S.of(context).addressDetail,
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeDefault,
                          color: ColorUtil.textColor)),
                ),
                MyTextField(
                    contentPadding: EdgeInsets.only(
                        left: SizeUtil.midSpace,
                        bottom: SizeUtil.tinySpace,
                        top: SizeUtil.midSmallSpace),
                    hint: S.of(context).addressDetailHint,
                    hintStyle: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: Colors.grey.shade500),
                    textStyle: TextStyle(fontSize: SizeUtil.textSizeSmall),
                    isBorder: false,
                    textEditingController: detailCtrl),
                WidgetUtil.getLine(
                    width: 0.5,
                    margin: EdgeInsets.only(
                        left: SizeUtil.midSpace, right: SizeUtil.midSpace),
                    color: Colors.black),
                Consumer<CityProvider>(
                  builder:
                      (BuildContext context, CityProvider value, Widget child) {
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
                          dataSource: value.subDistricts,
                          textField: 'name',
                        )
                      ],
                    );
                  },
                ),
                checkAddressDefault(context),
                dialogBtn(context)
              ]),
        ));
  }

  Widget checkAddressDefault(BuildContext context) {
    return CircleCheckbox(
      checked: this._getListAddressProvider.isDefaultAddress,
      onChanged: (bool value) {
        this._getListAddressProvider.isDefaultAddress =
            !this._getListAddressProvider.isDefaultAddress;
      },
      text: Text(
        S.of(context).set_delivery_address,
        style: TextStyle(
            color: ColorUtil.black33, fontSize: SizeUtil.textSizeSmall),
      ),
    );
  }

  Widget title(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: SizeUtil.midSpace, bottom: SizeUtil.midSpace),
      decoration: setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
      alignment: Alignment.center,
      child: Text(
        S.of(context).addAddress,
        style: TextStyle(
            color: ColorUtil.primaryColor,
            fontSize: SizeUtil.textSizeBigger,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget dialogBtn(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        MyRaisedButton(
          borderRadius: SizeUtil.tinyRadius,
          color: ColorUtil.primaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: S.of(context).cancel,
          textStyle:
              TextStyle(fontSize: SizeUtil.textSizeSmall, color: Colors.white),
        ),
        SizedBox(
          width: SizeUtil.defaultSpace,
        ),
        MyRaisedButton(
          borderRadius: SizeUtil.tinyRadius,
          color: ColorUtil.primaryColor,
          onPressed: () async {
            // add new address
            String error = "";
            var provider = Provider.of<CityProvider>(context, listen: false);

            if (detailCtrl.text.trim().isEmpty) {
              error = "Vui lòng nhập địa chỉ cụ thể ";
            } else if (provider.cityVal == null) {
              error = "Vui lòng chọn tỉnh/thành phố  ";
            } else if (provider.districtVal == null) {
              error = "Vui lòng chọn quận/huyện  ";
            } else if (provider.subDistrictVal == null) {
              error = "Vui lòng chọn phường/xã ";
            }
            print(error);

            if (error.isEmpty) {
              final detail = detailCtrl.text.trim();
              final city = provider.cities[provider.cityVal]['name'];
              final district = provider.districts[provider.districtVal]['name'];
              final commune =
                  provider.subDistricts[provider.subDistrictVal]['name'];

              final newAddress = "$detail, $commune, $district, $city";

              await postAddAddress(context,
                  address: newAddress,
                  isMain: _getListAddressProvider.isDefaultAddress ? 1 : 0);
              Provider.of<CityProvider>(context, listen: false).reset();
              _getListAddressProvider.getData();
              Navigator.of(context).pop(true);
            } else {
              WidgetUtil.showErrorDialog(context, error);
            }
          },
          text: S.of(context).addNew,
          textStyle:
              TextStyle(fontSize: SizeUtil.textSizeSmall, color: Colors.white),
        ),
      ],
    );
  }
}
