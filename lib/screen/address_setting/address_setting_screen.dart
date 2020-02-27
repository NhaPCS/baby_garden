import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'address.dart';

class AddressSetting extends StatefulWidget {
  @override
  _SeenProduct createState() => _SeenProduct();
}

class _SeenProduct extends BaseState<AddressSetting> {
  final GetListProvider _getListProvider = GetListProvider();

  final List<Address> address = [
    Address(address: "28 Phan Kế Bính, Ba Đình, Hà Nội", isDefault: true),
    Address(address: "28 Phan Kế Bính, Ba Đình, Hà Nội", isDefault: false),
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
      height: 50,
      width: double.infinity,
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
      decoration: setBorder("bottom", Color.fromRGBO(228, 228, 228, 1), 5),
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
                  color: Colors.blue,
                  size: 27,
                )),
          ]),
        ),
      ]),
    );
  }

  Widget myAddress() {
    return Container(
      height: address.length * 63.toDouble() + 80,
      child: Container(
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
                    return Container(child: address[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget addAddress() {
    return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 12),
          child: GestureDetector(
            onTap: () {
              // show dialog
              showAddAddressDialog(context);
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

showAddAddressDialog(BuildContext context) {
  Dialog simpleDialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Container(
      height: 300.0,
      width: 300.0,
      child: Column(
        children: <Widget>[
          // title
          Container(
            height: 38,
            width: double.infinity,
            decoration:
                setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
            child: Center(
              child: Text(
                S.of(context).myAddress,
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 38,
            width: double.infinity,
            decoration:
                setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Địa chỉ cụ thể",
                    style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1), fontSize: 12),
                  ),
                ]),
          ),
          Container(
            height: 38,
            width: double.infinity,
            decoration:
                setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Tỉnh/ Thành Phố",
                style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1), fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 38,
            width: double.infinity,
            decoration:
                setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Quận/ Huyện",
                style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1), fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 38,
            width: double.infinity,
            decoration:
                setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Phường/ Xã",
                style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1), fontSize: 12),
              ),
            ),
          ),
          Container(
            height: 38,
            width: double.infinity,
            decoration:
                setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Đặt làm địa chỉ nhận hàng mặc định",
                style: TextStyle(color: ColorUtil.primaryColor, fontSize: 12),
              ),
            ),
          ),

          // button
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 90,
                  height: 23,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    color: ColorUtil.primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Okay',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ButtonTheme(
                  minWidth: 90,
                  height: 23,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    color: ColorUtil.primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel!',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => simpleDialog);
}
