import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'add_address_modal.dart';
import 'address.dart';

// TODO-QAnh: sửa lại tất cả số liệu fix cứng của kích thước và text
class AddressSettingScreen extends StatefulWidget {
  @override
  _SeenProduct createState() => _SeenProduct();
}

class _SeenProduct extends BaseState<AddressSettingScreen> {
  final GetListProvider _getListProvider = GetListProvider();

  final List<Address> address = [
    Address(address: "28 Phan Kế Bính, Ba Đình, Hà Nội", isDefault: true),
    Address(address: "12 Dịch Vọng, Cầu Giấy, Hà Nội", isDefault: false),
    Address(address: "28 Cát Linh, Hà Đông, Hà Nội", isDefault: false),
  ];

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).addressAccount),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              header(),
              addressSetting(),
              myAddress(),
              addAddress(),
            ]));
  }

  Widget header() {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      // TODO-QAnh: bỏ fix height
      height: 50,
      width: double.infinity,
      // TODO-QAnh: cái này chỉ để lấy 1 cái line nên bỏ Conatiner đi, dùng WidgetUtil để add 1 cái line
      decoration: setBorder("bottom", Color.fromRGBO(112, 112, 112, 1), 1),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 8),
        child: Text(
          S.of(context).defaultAddress,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget addressSetting() {
    return Container(
      height: 103,
      width: double.infinity,
      // TODO-QAnh: cái này chỉ để lấy 1 cái line nên bỏ Conatiner đi, dùng WidgetUtil để add 1 cái line
      decoration: setBorder("bottom", Color.fromRGBO(228, 228, 228, 1), 5),
      // TODO-QAnh: bỏ colum này đi, dùng Column phía trên thôi
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 8),
              child: Text(
                S.of(context).addressSetting,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(112, 112, 112, 1)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 8.0),
              child: Text(
                S.of(context).edit,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(112, 112, 112, 1),
                    fontSize: 12),
              ),
            ),
          ),
        ]),
        Container(
          // TODO-QAnh: bỏ set height cho container
          height: 48,
          margin: EdgeInsets.only(left: 8, right: 8, top: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color.fromRGBO(246, 246, 246, 1)),
          child: Row(children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "28 Phan Kế Bính, Ba Đình, Hà Nội",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.location_on,
                  color: ColorUtil.primaryColor,
                  size: 27,
                )),
          ]),
        ),
      ]),
    );
  }

  Widget myAddress() {
    return Container(
      // TODO-QAnh: bỏ set height đi, bỏ conatiner này đi
      height: address.length * 63.toDouble() + 80,
      child: Container(
        // TODO-QAnh: bỏ container này luôn, dùng line thì dùng WidgetUtil.getLine
        decoration: setBorder("bottom", Color.fromRGBO(228, 228, 228, 1), 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 8.0),
              child: Text(
                S.of(context).myAddress,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(112, 112, 112, 1)),
              ),
            ),

            // list view address
            Expanded(
              child: ListView.builder(
                  itemCount: address.length,
                  itemBuilder: (BuildContext context, int index) {
                    // TODO-QAnh: bỏ container này đi
                    return Container(child: address[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget addAddress() {
    // TODO-QAnh: nếu chỉ có width và height thì dùng SizeBox
    return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 12),
          child: GestureDetector(
            onTap: () {
              // show dialog
              final addAddress = ShowAddAddressDialog();
              showDialog(
                  context: context,
                  builder: (BuildContext context) => addAddress);
            },
            child: Row(children: <Widget>[
              Icon(
                Icons.add,
                size: 30,
                color: ColorUtil.primaryColor,
              ),
              Text(
                S.of(context).addAddress,
                style: TextStyle(
                    color: Color.fromRGBO(112, 112, 112, 1),
                    fontWeight: FontWeight.bold),
              )
            ]),
          ),
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
