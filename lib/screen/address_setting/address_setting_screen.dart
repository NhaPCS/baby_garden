// import 'dart:html';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/address_setting/item/address_item.dart';
import 'package:baby_garden_flutter/screen/address_setting/provider/get_list_address_provider.dart';
import 'package:baby_garden_flutter/screen/address_setting/view_model/address_setting_view_model.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'dialog/add_address_dialog.dart';

class AddressSettingScreen extends StatefulWidget {
  @override
  _AddressSettingScreenState createState() => _AddressSettingScreenState();
}

class _AddressSettingScreenState
    extends BaseStateModel<AddressSettingScreen, AddressSettingViewModel> {
  final GetListAddressProvider _getListAddressProvider =
      GetListAddressProvider();
  final _defaultPadding = const EdgeInsets.only(
      top: SizeUtil.normalSpace, left: SizeUtil.midSmallSpace);

  final mainAddressCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getListAddressProvider.getData();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).addressAccount),
        body:
            Consumer<GetListAddressProvider>(builder: (context, value, child) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                header(),
                WidgetUtil.getLine(color: Colors.black),
                addressSetting(),
                WidgetUtil.getLine(width: SizeUtil.lineHeight),
                Padding(
                  padding: _defaultPadding,
                  child: Text(
                    S.of(context).myAddress,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: ColorUtil.darkGray),
                  ),
                ),
                myAddress(value.address),
              ]);
        }));
  }

  Widget header() {
    return Padding(
      padding: _defaultPadding,
      child: Text(
        S.of(context).defaultAddress,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: SizeUtil.textSizeBigger),
      ),
    );
  }

  Widget addressSetting() {
    mainAddressCtrl.text =
        StringUtil.getFullAddress(_getListAddressProvider.mainAddress);

    return Padding(
      padding: const EdgeInsets.only(
          top: SizeUtil.normalSpace,
          left: SizeUtil.midSmallSpace,
          right: SizeUtil.midSmallSpace),
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Expanded(
            child: Text(
              S.of(context).addressSetting,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: ColorUtil.darkGray),
            ),
          ),
          commonBtnMainAddress(),
          SizedBox(width: SizeUtil.midSmallSpace),
        ]),
        SizedBox(
          height: SizeUtil.midSmallSpace,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeUtil.tinyRadius),
              color: ColorUtil.serviceItemUnselectColor),
          child: Center(
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: SizeUtil.normalPadding,
                  child: MyTextField(
                      maxLines: null,
                      inputType: TextInputType.text,
                      enable: false,
                      contentPadding: EdgeInsets.only(left: 0),
                      textStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                      isBorder: false,
                      textEditingController: mainAddressCtrl),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: SizeUtil.midSmallSpace),
                  child: Column(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: ColorUtil.primaryColor,
                        size: SizeUtil.iconSizeBigger,
                      )
                    ],
                  )),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget myAddress(List<dynamic> addressList) {
    if (addressList == null) return SizedBox();
    return Expanded(
      child: ListView(
        children: <Widget>[
          addressList != null && addressList.length > 0
              ? Column(
                  children: addressList
                      .map((e) => AddressItem(
                            address: e,
                            onEditAddress: () {
                              final addAddress = AddAddressDialog(
                                address: e,
                                addAddressCallBack: (address, cityId,
                                    districtId, wardId, isMain) {
                                  getViewModel().editAddress(
                                      address: address,
                                      addressId: e['id'],
                                      isMain: isMain,
                                      cityId: cityId,
                                      districtId: districtId,
                                      wardId: wardId);
                                },
                              );
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      addAddress);
                            },
                            onDeleteAddress: () {
                              getViewModel().deleteAddress(addressId: e['id']);
                            },
                          ))
                      .toList(),
                )
              : SizedBox(),
          WidgetUtil.getLine(width: SizeUtil.lineHeight),
          addAddress(),
          SizedBox(height: SizeUtil.largeSpace)
        ],
      ),
    );
  }

  Widget addAddress() {
    return Padding(
      padding: _defaultPadding,
      child: GestureDetector(
        onTap: () {
          // show dialog
          final addAddress = AddAddressDialog(
            addAddressCallBack: (address, cityId, districtId, wardId, isMain) {
              getViewModel().addAddress(
                  address: address,
                  isMain: isMain,
                  cityId: cityId,
                  districtId: districtId,
                  wardId: wardId);
            },
          );
          showDialog(
              context: context, builder: (BuildContext context) => addAddress);
        },
        child: Row(children: <Widget>[
          Icon(
            Icons.add,
            size: SizeUtil.iconSizeBig,
            color: ColorUtil.primaryColor,
          ),
          Text(
            S.of(context).addAddress,
            style: TextStyle(
                color: ColorUtil.darkGray, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }

  Widget commonBtnMainAddress() {
    final onTapDone = () {
      final addAddress = AddAddressDialog(
        address: _getListAddressProvider.mainAddress,
        isMain: true,
        addAddressCallBack: (address, cityId, districtId, wardId, isMain) {
          getViewModel().addAddress(
              address: address,
              isMain: 1,
              cityId: cityId,
              districtId: districtId,
              wardId: wardId);
        },
      );
      showDialog(
          context: context, builder: (BuildContext context) => addAddress);
    };

    return GestureDetector(
        onTap: onTapDone,
        child: Text(
          S.of(context).edit,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorUtil.darkGray,
              fontSize: SizeUtil.textSizeSmall),
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListAddressProvider)];
  }

  @override
  AddressSettingViewModel initViewModel() {
    return AddressSettingViewModel(context, _getListAddressProvider);
  }
}
