import 'package:baby_garden_flutter/data/model/address.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_address.dart';
import 'package:baby_garden_flutter/provider/get_list_address_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'add_address_modal.dart';
// import 'address.dart';

class AddressSettingScreen extends StatefulWidget {
  @override
  _SeenProduct createState() => _SeenProduct();
}

class _SeenProduct extends BaseState<AddressSettingScreen> {
  final GetListAddressProvider _getListAddressProvider =
      GetListAddressProvider();
  final _defaultPadding = const EdgeInsets.only(
      top: SizeUtil.normalSpace, left: SizeUtil.midSmallSpace);
  final List<AddressItem> addressList = [];

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
          for (var _address in value.address) {
            var address = Address(
                id: _address['id'],
                date: _address['date'],
                active: _address['active'] == '1' ? true : false,
                address: _address['address']);
            addressList.add(AddressItem(address: address));
          }

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                header(),
                WidgetUtil.getLine(color: Colors.black),
                addressSetting(),
                WidgetUtil.getLine(width: SizeUtil.lineHeight),
                myAddress(),
                WidgetUtil.getLine(width: SizeUtil.lineHeight),
                addAddress(),
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
    return Padding(
      padding: _defaultPadding,
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Expanded(
            child: Text(
              S.of(context).addressSetting,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: ColorUtil.darkGray),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              S.of(context).edit,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorUtil.darkGray,
                  fontSize: SizeUtil.textSizeSmall),
            ),
          ),
          SizedBox(width: 8),
        ]),
        SizedBox(
          height: 8,
        ),
        Container(
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorUtil.serviceItemUnselectColor),
          child: Center(
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    _getListAddressProvider.mainAddress,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.location_on,
                    color: ColorUtil.primaryColor,
                    size: SizeUtil.iconSizeBigger,
                  )),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget myAddress() {
    return Container(
      // TODO-QAnh: bỏ set height đi, bỏ conatiner này đi
      height: addressList.length * 63.toDouble() + 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: _defaultPadding,
            child: Text(
              S.of(context).myAddress,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: ColorUtil.darkGray),
            ),
          ),

          // list view address
          Expanded(
            child: ListView.builder(
                itemCount: addressList.length,
                itemBuilder: (BuildContext context, int index) {
                  return addressList[index];
                }),
          ),
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
          final addAddress = ShowAddAddressDialog();
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

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListAddressProvider)];
  }
}
