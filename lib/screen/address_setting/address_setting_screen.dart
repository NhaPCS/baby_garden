// import 'dart:html';

import 'package:baby_garden_flutter/data/model/address.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/address_setting/item/item_address.dart';
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

class _AddressSettingScreenState extends BaseStateModel<AddressSettingScreen, AddressSettingViewModel> {
  final GetListAddressProvider _getListAddressProvider =
      GetListAddressProvider();
  final _defaultPadding = const EdgeInsets.only(
      top: SizeUtil.normalSpace, left: SizeUtil.midSmallSpace);
  final List<ItemAddress> addressList = [];

  final mainAddressCtrl = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_getListAddressProvider.mainAddress == null) {
      _getListAddressProvider.getData();
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).addressAccount),
        body:
            Consumer<GetListAddressProvider>(builder: (context, value, child) {
          final List<ItemAddress> addressList = [];

          if (value.address != null)
            for (var _address in value.address) {
              var address = Address(
                  id: _address['id'],
                  date: _address['date'],
                  active: _address['active'] == '1' ? true : false,
                  address: _address['address']);
              addressList.add(ItemAddress(
                address: ValueNotifier(address),
                onEditAddress: (address, addressId){
                  getViewModel().editAddress(address: address, addressId: addressId);
                },
                onDeleteAddress: (id) {
                  getViewModel().deleteAddress(addressId: id);
                },
              ));
            }

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
                myAddress(addressList),
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
    mainAddressCtrl.text = _getListAddressProvider.mainAddress;

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
          Column(
            children: [
              commonBtnMainAddress(),
              commonBtnMainAddress(isDone: true)
            ],
          ),
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
                      enable: _getListAddressProvider.isEditingMain,
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

  Widget myAddress(List<ItemAddress> addressList) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          addressList.length > 0
              ? Column(
                  children: addressList.map((e) => e).toList(),
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
          final addAddress = AddAddressDialog( addAddressCallBack: (address, isMain){
            getViewModel().addAddress(address: address, isMain: isMain);
          },);
          showDialog(
              context: context,
              builder: (BuildContext context) => addAddress);
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

  Widget commonBtnMainAddress({bool isDone = false}) {
    final onTapDone = () {
      final newAddress = mainAddressCtrl.text.trim();

      if (newAddress.isEmpty ||
          newAddress == _getListAddressProvider.mainAddress) {
        _getListAddressProvider.isEditingMainAddress(false);
        return;
      }

      // edit main address
      getViewModel().addAddress(address: newAddress, isMain: 1);
    };

    return Visibility(
      visible: isDone
          ? _getListAddressProvider.isEditingMain
          : !_getListAddressProvider.isEditingMain,
      child: GestureDetector(
          onTap: isDone
              ? onTapDone
              : () => _getListAddressProvider.isEditingMainAddress(true),
          child: Text(
            isDone ? S.of(context).done : S.of(context).edit,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorUtil.darkGray,
                fontSize: SizeUtil.textSizeSmall),
          )),
    );
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
